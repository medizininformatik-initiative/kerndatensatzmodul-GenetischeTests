---
topic: FamilienanamneseIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Die Familienanamnese erfasst genetisch relevante Erkrankungen bei Blutsverwandten und ist essentiell für die Interpretation hereditärer Varianten und die Risikoeinschätzung.

### Kernprofil

**FamilyMemberHistory**: Dokumentiert Erkrankungen von Familienangehörigen mit detaillierten Verwandtschaftsinformationen.

### Wichtige Komponenten

#### Verwandtschaftsbeziehung
- Verwandtschaftsgrad (1., 2., 3. Grades)
- Verwandtschaftsverhältnis (leiblich, adoptiert)
- Familiäre Linie (mütterlich, väterlich)
- Spezifische Beziehung (Mutter, Vater, Geschwister, etc.)

#### Erkrankungsdokumentation
- Diagnosen (ICD-10, Orphanet, OMIM)
- Manifestationsalter
- Krankheitsverlauf
- Todesursache (falls zutreffend)

### Extensions (MII-spezifisch)

Drei spezielle Extensions erweitern die Standardressource:
- **Verwandtschaftsgrad**: Grad der biologischen Verwandtschaft
- **Verwandtschaftsverhältnis**: Art der Beziehung (leiblich/adoptiert)
- **Familiäre Linie**: Mütterliche oder väterliche Seite

Details siehe [Extensions-Dokumentation](Extensions/Familienanamnese-Extensions.page.md)

### Klinische Bedeutung

- Identifikation hereditärer Muster
- Risikostratifizierung für Anlageträger
- Indikationsstellung für erweiterte Diagnostik
- Familienberatung und Kaskadenscreening

### Verknüpfungen

- Referenziert über `patient` den Indexpatienten
- Kann über `reasonReference` auf genetische Befunde verweisen
- Wird in ServiceRequest als `reasonReference` für Testindikation genutzt