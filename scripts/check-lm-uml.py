#!/usr/bin/env python3
"""Gleicht das handgepflegte UML-Diagramm mit dem Logical Model ab.

Kopie aus dem Skill mii-lm-uml (Vorlage: scripts/check-lm-uml.py im
Modul Seltene Erkrankungen), Standardpfade auf MolGen gesetzt.

Das Diagramm (information-model/logical-model-uml.pu) bleibt layoutoptimiert
und wird von Hand gepflegt. Damit es mit dem Logical Model abgleichbar ist,
traegt jedes Attribut (und bei Bedarf ein Objekt) in der Zeile direkt darunter
einen PlantUML-Kommentar, der nicht gerendert wird:

    o Koerpermasse
    ' lm: koerperlicheUntersuchung.*

    ' lm: <pfad>[, <pfad> ...]   deckt genau diese LM-Elemente ab
    ' lm: <pfad>.*               deckt das Element und alles darunter ab
    ' lm: -                      bewusst ohne LM-Element (anderes Modul,
                                 FHIR-Detail, Strukturknoten im Bild)

LM-Elemente, die bewusst nicht ins Bild sollen, stehen in einer Zeile
irgendwo in der Datei:

    ' lm-ignore: pfad, pfad.*

Gemeldet wird:
  1. LM-Elemente ohne Entsprechung im UML
  2. Verweise auf LM-Pfade, die es nicht (mehr) gibt
  3. Attribute ohne Verweis

Pfade relativ zur Wurzel des Logical Models (ohne "LogicalModelMolGen.").
Liest fsh-generated/resources/StructureDefinition-LogicalModelMolGen.json, also
vorher SUSHI laufen lassen. Exit 1, wenn etwas gemeldet wird.
"""
import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path.cwd()  # im Modul-Repo ausfuehren
LM = ROOT / "fsh-generated/resources/StructureDefinition-LogicalModelMolGen.json"
UML = ROOT / "information-model/logical-model-uml.pu"

ANNOT = re.compile(r"^\s*'\s*lm:\s*(.*?)\s*$")
IGNORE = re.compile(r"^\s*'\s*lm-ignore:\s*(.*?)\s*$")
# Objektdiagramm ("object X", Attribute "o Name") wie bei Seltene, oder
# Klassendiagramm ("class X", Attribute "+Name: typ") wie bei MolGen.
ATTR = re.compile(r"^\s*(?:o\s+|[+\-#~])(.+?)\s*$")
OBJ = re.compile(r"^\s*(?:object|class|abstract\s+class)\s+(\"[^\"]+\"|[^\s{]+)")


def lm_pfade(pfad: Path) -> list[str]:
    sd = json.loads(pfad.read_text(encoding="utf-8"))
    elemente = sd.get("snapshot", sd["differential"])["element"]
    return [e["path"].split(".", 1)[1] for e in elemente if "." in e["path"]]


def deckt(muster: str, pfad: str) -> bool:
    if muster.endswith(".*"):
        basis = muster[:-2]
        return pfad == basis or pfad.startswith(basis + ".")
    return pfad == muster


def lies_uml(pfad: Path):
    zeilen = pfad.read_text(encoding="utf-8").splitlines()
    verweise = []    # (zeilennr, objekt, beschriftung, [muster])
    ohne = []        # (zeilennr, objekt, beschriftung)
    ignoriert = []
    objekt = None
    for i, z in enumerate(zeilen):
        if m := IGNORE.match(z):
            ignoriert += [p.strip() for p in m.group(1).split(",") if p.strip()]
            continue
        if m := OBJ.match(z):
            objekt = m.group(1).strip('"')
            ziel = ("objekt", objekt)
        elif m := ATTR.match(z):
            ziel = ("attribut", m.group(1))
        else:
            continue
        folge = zeilen[i + 1] if i + 1 < len(zeilen) else ""
        if a := ANNOT.match(folge):
            muster = [p.strip() for p in a.group(1).split(",") if p.strip()]
            verweise.append((i + 2, objekt, ziel[1], muster))
        elif ziel[0] == "attribut":
            ohne.append((i + 1, objekt, ziel[1]))
    return verweise, ohne, ignoriert


def verdichte(fehlend: list[str], alle: list[str]) -> list[str]:
    """Meldet einen Teilbaum nur einmal, wenn er komplett fehlt."""
    fehl = set(fehlend)
    aus = []
    for p in fehlend:
        eltern = p.rsplit(".", 1)[0] if "." in p else None
        if eltern in fehl:
            continue
        kinder = [q for q in alle if q.startswith(p + ".")]
        aus.append(f"{p}.*  (+{len(kinder)})" if kinder and all(q in fehl for q in kinder) else p)
    return aus


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--lm", type=Path, default=LM)
    ap.add_argument("--uml", type=Path, default=UML)
    args = ap.parse_args()

    alle = lm_pfade(args.lm)
    verweise, ohne, ignoriert = lies_uml(args.uml)

    muster = [(nr, obj, txt, m) for nr, obj, txt, ms in verweise for m in ms if m != "-"]
    tot = [(nr, obj, txt, m) for nr, obj, txt, m in muster + [(0, "lm-ignore", "", m) for m in ignoriert]
           if not any(deckt(m, p) for p in alle)]
    abgedeckt = {p for p in alle if any(deckt(m, p) for *_, m in muster)}
    # Ein Gruppenknoten gilt als abgedeckt, sobald etwas darunter im Bild ist.
    abgedeckt |= {p for p in alle if any(q.startswith(p + ".") for q in abgedeckt)}
    weg = {p for p in alle if any(deckt(m, p) for m in ignoriert)}
    fehlend = [p for p in alle if p not in abgedeckt and p not in weg]

    rel = args.uml.relative_to(ROOT) if args.uml.is_relative_to(ROOT) else args.uml
    print(f"LM: {len(alle)} Elemente, {len(abgedeckt)} im UML, {len(weg)} bewusst weggelassen, "
          f"{len(fehlend)} fehlen")

    if fehlend:
        print("\n1. LM-Elemente ohne Entsprechung im UML:")
        for p in verdichte(fehlend, alle):
            print(f"   {p}")
    if tot:
        print("\n2. Verweise auf LM-Pfade, die es nicht gibt:")
        for nr, obj, txt, m in tot:
            wo = f"{rel}:{nr}" if nr else "lm-ignore"
            print(f"   {wo}  {obj} / {txt}  ->  {m}")
    if ohne:
        print("\n3. Attribute ohne Verweis (' lm: ... darunter ergaenzen):")
        for nr, obj, txt in ohne:
            print(f"   {rel}:{nr}  {obj} / {txt}")

    return 1 if (fehlend or tot or ohne) else 0


if __name__ == "__main__":
    sys.exit(main())
