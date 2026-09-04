<!-- markdownlint-disable MD041 -->
<!-- Deutsche Spiegelung von input/pagecontent/stu2-to-stu3.md.
     Zusammengeführt am 2026-09-04 aus zwei Dokumenten, die unveröffentlicht im
     Repository-Wurzelverzeichnis lagen: STU2-to-STU3-Migration-Guide-Lightweight.md und
     COMPLETE-CHANGE-LIST-STU2-TO-STU3.md. Drei Dinge wurden dabei geändert: die Zusage
     von StructureMaps und Beispielverzeichnissen ist entfallen (sie existierten nie,
     und die DIZ-Datenintegration könnte sie ohnehin meist nicht ausführen), die
     veraltete Paketversion ist raus, und die Vererbung von MSI/Mutationslast war falsch
     beschrieben. Beide Dateien müssen dasselbe aussagen. -->

### Migration von Clinical Genomics STU2 auf STU3

Mit Version 2026.0.0 ist dieses Modul von
[Clinical Genomics Reporting STU2](http://hl7.org/fhir/uv/genomics-reporting/STU2/) auf
[STU3](http://hl7.org/fhir/uv/genomics-reporting/STU3/) umgestiegen. Diese Seite sagt,
was sich geändert hat und wie Bestandsdaten überführt werden. Sie richtet sich an
Standorte, die bereits Daten gegen die 2025er-Linie erzeugen.

**Hier stehen bewusst keine StructureMaps.** Die Datenintegration eines
Datenintegrationszentrums läuft über eigene ETL-Strecken, und eine FHIR-Mapping-Engine
gehört selten dazu. Eine StructureMap würde eine Transformation beschreiben, die die
meisten Standorte gar nicht ausführen könnten. Stattdessen steht die Abbildung hier
deklarativ — umsetzbar in der Technologie, die eure Strecke ohnehin verwendet.

#### Profile: was aus was wurde

| Profil | STU2 | STU3 |
|---|---|---|
| UntersuchteRegion | `…/StructureDefinition/region-studied` | **entfallen** — siehe GenomicStudy unten |
| ErgebnisZusammenfassung | eigene Observation | **entfallen** — geht in `DiagnosticReport.conclusionCode` auf |
| Variante | `…/variant` | `…/variant` — Basis unverändert, Komponenten umbenannt |
| Mikrosatelliteninstabilität | direkt von `Observation` | über `MII_PR_MolGen_MolekularerBiomarker` |
| Mutationslast | direkt von `Observation` | über `MII_PR_MolGen_MolekularerBiomarker` |
| MolekulareKonsequenz | — | **neu**, von `…/molecular-consequence` |
| GenomicStudy | — | **neu**, von `…/genomic-study` (eine `Procedure`) |
| GenomicStudyAnalysis | — | **neu**, von `…/genomic-study-analysis` (eine `Procedure`) |

Zu den zwei Stufen bei den Biomarkern: MSI und Mutationslast erben **nicht** direkt vom
STU3-Profil `molecular-biomarker`. Sie erben von `MII_PR_MolGen_MolekularerBiomarker`
dieses Moduls, und dieses erbt von STU3. Praktisch ist die Folge dieselbe — siehe die
Kategorie-Anforderung unten —, aber eine Profilbindung gegen das STU3-Canonical greift
nicht.

#### Komponenten in Variante

Die Slice-Namen haben sich geändert; in einer Instanz erkennt man eine Komponente am
`code`, deshalb bleibt das meiste in den Daten unsichtbar:

| Komponente | LOINC | Was sich geändert hat |
|---|---|---|
| DNA-Änderung (c.HGVS) | `48004-6` | unverändert |
| Transkript-Referenz | `51958-7` | unverändert |
| Aminosäure-Änderung | `48005-3` | unverändert |
| Art der Aminosäure-Änderung | `48006-1` | **aus dem Profil entfernt** |
| Molekulare Konsequenz | verschiedene | **verlagert** in eine eigene MolekulareKonsequenz-Observation |

Drei Slices haben den Präfix `representative-` bekommen — `coding-hgvs`,
`transcript-ref-seq` und `protein-hgvs`. Das betrifft nur, wer Slices namentlich
referenziert, etwa in eigenen abgeleiteten Profilen oder in FHIRPath; Instanzdaten
bleiben unberührt.

#### Die zusätzliche Kategorie bei MSI und Mutationslast

Weil beide jetzt unter einem Biomarker-Profil hängen, brauchen sie neben `laboratory`
eine zweite `category`:

```json
"category": [
  { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                 "code": "laboratory", "display": "Laboratory" }] },
  { "coding": [{ "system": "http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs",
                 "code": "biomarker-category",
                 "display": "A characterization of a given biomarker observation." }] }
]
```

Auf das zweite System achten: die Biomarker-Kategorie kommt aus dem
Clinical-Genomics-`tbd-codes-cs`, **nicht** aus `observation-category`. STU3 fordert
beide Slices mit `1..1`, eine Instanz mit nur `laboratory` fällt also durch die
Validierung. Das ist der häufigste Fehler beim Überführen von Daten der 2025er-Linie.

#### Weg 1 — aus UntersuchteRegion wird GenomicStudy

STU2 hielt die untersuchten Regionen als Komponenten einer Observation fest. STU3
ersetzt das durch ein `Procedure`-Paar: eine GenomicStudy, die orchestriert, und eine
oder mehrere GenomicStudyAnalysis-Schritte, die die Details tragen.

**Vorher:**

```json
{
  "resourceType": "Observation",
  "meta": { "profile": ["…/mii-pr-molgen-untersuchte-region"] },
  "component": [{
    "code": { "coding": [{ "code": "48018-6" }] },
    "valueCodeableConcept": { "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] }
  }]
}
```

**Nachher** — die untersuchte Region wandert in die Extension
`genomic-study-analysis-regions` eines Analyseschritts:

```json
{
  "resourceType": "Procedure",
  "meta": { "profile": ["…/mii-pr-molgen-genomic-study-analysis"] },
  "extension": [{
    "url": ".../genomic-study-analysis-regions",
    "extension": [{
      "url": "studied",
      "valueCodeableConcept": { "coding": [{ "code": "HGNC:1097", "display": "BRAF" }] }
    }]
  }]
}
```

Die minimal tragfähige Migration ist genau das: ein Analyseschritt je bisheriger
UntersuchteRegion, mit denselben Gen-Codes. Alles Weitere, was GenomicStudyAnalysis
bietet — Sequenzierer und Pipeline als `Device`, Methodentyp, Lesetiefe und Abdeckung,
Probe, Ein- und Ausgabedateien — ist optional und lohnt nur dort, wo das Quellsystem es
tatsächlich vorhält.

Zu bedenken: `regions-studied` ist das, womit eine Abfrage *nicht gefunden* von *nicht
gesucht* unterscheiden kann. Wenn eure STU2-Daten untersuchte Regionen festgehalten
haben, nehmt sie mit — sie wegzulassen kostet genau diese Unterscheidung.

#### Weg 2 — aus ErgebnisZusammenfassung wird conclusionCode

**Vorher:** eine eigene Observation, referenziert aus `DiagnosticReport.result`.

```json
{ "resourceType": "DiagnosticReport",
  "result": [{ "reference": "Observation/ergebnis-zusammenfassung-1" }] }

{ "resourceType": "Observation", "id": "ergebnis-zusammenfassung-1",
  "valueCodeableConcept": { "coding": [{ "code": "LA6576-8", "display": "Positive" }] } }
```

**Nachher:** der Code wandert an den Befund selbst, die Observation entfällt.

```json
{ "resourceType": "DiagnosticReport",
  "conclusionCode": [{ "coding": [{ "code": "LA6576-8", "display": "Positive" }] }] }
```

Dabei den nun ins Leere zeigenden `result`-Eintrag entfernen, nicht nur den
`conclusionCode` ergänzen.

#### Weg 3 — umbenannte Slices in Variante

Nur relevant, wer Slice-Namen referenziert. In den Instanzdaten ändert sich nichts, weil
Komponenten über den `code` identifiziert werden:

| STU2-Slice | STU3-Slice |
|---|---|
| `coding-hgvs` | `representative-coding-hgvs` |
| `transcript-ref-seq` | `representative-transcript-ref-seq` |
| `protein-hgvs` | `representative-protein-hgvs` |

#### Checkliste

**Vorbereitung**

- Aktuelles Paket ziehen und den [Changelog](changes.html) der Zielversion lesen.
- Feststellen, welche Profile ihr tatsächlich erzeugt. Die meisten Standorte nutzen
  einen Bruchteil des Moduls.
- Alle Instanzen finden, die `untersuchte-region` oder `ergebnis-zusammenfassung` in
  `meta.profile` tragen — das sind die beiden, die sich nicht mechanisch überführen
  lassen.

**Während der Migration**

- Die zweite `category` bei MSI- und Mutationslast-Instanzen ergänzen.
- Jede UntersuchteRegion in eine GenomicStudy plus mindestens eine
  GenomicStudyAnalysis aufteilen und die untersuchten Regionen erhalten.
- Jeden ErgebnisZusammenfassung-Wert nach `DiagnosticReport.conclusionCode` überführen
  und die Observation samt `result`-Referenz löschen.
- Molekulare Konsequenzen aus Variante in eine eigene MolekulareKonsequenz auslagern.

**Danach**

- Gegen das veröffentlichte Paket validieren; welche Profile dieses Modul deklariert und
  mit welcher Erwartung, steht auf der Seite
  [Capability Statements](capability-statements.html).
- Die Ausgabe nach verbliebenen STU2-Canonicals durchsuchen — `untersuchte-region`,
  `ergebnis-zusammenfassung`, `region-studied` —, bevor die Migration als erledigt gilt.
