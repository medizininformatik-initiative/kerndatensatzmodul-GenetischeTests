<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/Familienanamnese/Familienanamnese---FamilyMemberHistory.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->

---

#### Beschreibung

Details zur Krankengeschichte von verwandten Familienmitgliedern.

---

#### Profil

---

#### Extensions

Dieses Profil verwendet drei spezifische Extensions für detaillierte Verwandtschaftsinformationen:

- **Verwandtschaftsgrad**: Grad der Verwandtschaft (erstgradig, zweitgradig)
- **Verwandtschaftsverhältnis**: Spezifisches Verhältnis (natürliches Kind, adoptiert)
- **Familiäre Linie**: Mütterliche oder väterliche Linie

Detaillierte Dokumentation und Profile der Extensions finden Sie auf der extensions.html#extensions-der-familienanamnese Seite.

---

| FHIR-Element | Logischer Datensatz |
|---|---|
| FamilyMemberHistory | Anforderung.Indikation.Krankengeschichte Familie |

--- 


**Examples**

 
---

  
---

<!-- DERIVED:bridge source=the same profile page gate=B -->
### Beispiele

> **Von der Migration geschrieben, nicht aus der Quelle übernommen.** Der
> Simplifier-Leitfaden hat diese Beispiele auf dieser Seite eingebettet; der IG
> Publisher rendert jedes auf einer eigenen Seite. Sie stehen deshalb hier als
> Links, in der Reihenfolge der Quelle und mit deren Bildunterschriften. Es wurde
> nichts ergänzt und nichts weggelassen.
{: .ig-highlight .ig-highlight-grey}

- [`mii-exa-molgen-family-member-history-1`](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.html) — **Examples**
- [`mii-exa-molgen-family-member-history-2`](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.html)
