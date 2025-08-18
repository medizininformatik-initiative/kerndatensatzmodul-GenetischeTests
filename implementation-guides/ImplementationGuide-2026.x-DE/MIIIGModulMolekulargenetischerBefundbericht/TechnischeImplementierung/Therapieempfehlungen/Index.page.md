---
topic: TherapieempfehlungenIndex
---

#### {{page-title}}

{{index:current}}

### Überblick

Therapieempfehlungen dokumentieren konkrete Handlungsanweisungen, die sich aus den genetischen Befunden ergeben. Diese Task-basierten Profile ermöglichen die strukturierte Weitergabe von Empfehlungen.

### Kernprofile

**Medikationsempfehlung**: Pharmakogenetisch begründete Empfehlungen zu Medikamentenwahl und -dosierung.

**Empfohlene Folgemaßnahme**: Weitere diagnostische oder präventive Maßnahmen basierend auf genetischen Befunden.

### Medikationsempfehlung

- Medikamentenauswahl basierend auf Genotyp
- Dosisanpassungen oder Kontraindikationen
- Evidenzbasis: CPIC, DPWG, PharmGKB
- Beispiele: CYP2D6, TPMT, DPYD, HLA-B*57:01

### Empfohlene Folgemaßnahme

- Familienuntersuchung bei hereditären Erkrankungen
- Tumorboard-Vorstellung
- Intensivierte Vorsorge
- Genetische Beratung
- Verlaufskontrollen

### Verknüpfungen

- Tasks verweisen über `reasonReference` auf die Implikationen
- DiagnosticReport referenziert Tasks über `recommended-action` Extension
- Task-Status tracking: draft → requested → completed