---
topic: TerminologieIndex
---

## Terminologie

{{index:current}}

### Überblick

Die Terminologie-Komponenten definieren die standardisierten Vokabulare für die semantische Interoperabilität genetischer Daten. Die Terminologien sind nach ihrer Herkunft organisiert:

| Seite | Inhalt |
|-------|--------|
| **MII ValueSets** | Eigene ValueSets dieses Moduls (Verwandtschaft, Familienanamnese) |
| **Clinical Genomics** | ValueSets und CodeSystems aus dem HL7 Genomics Reporting IG |
| **Externe Terminologien** | Internationale Standards (LOINC, SNOMED CT, HGNC, etc.) mit Lizenzinformationen |

### Entscheidungskriterien

| Quelle | Verwendung | Beispiel |
|--------|------------|----------|
| **MII-definiert** | Eigene Anforderungen, keine passende externe Terminologie | Verwandtschaftsgrad, Familiäre Linie |
| **Clinical Genomics** | Genetik-spezifische Konzepte aus dem STU3 Standard | DNA Change Type, Functional Effect |
| **Externe Terminologie** | Etablierte internationale Standards | LOINC, SNOMED CT, HGNC |

### Binding-Stärken

| Stärke | Bedeutung | Beispiel |
|--------|-----------|----------|
| **Required** | Exakte Übereinstimmung erforderlich | HGVS-Notation |
| **Extensible** | ValueSet erweiterbar bei Bedarf | Diagnose-Codes |
| **Preferred** | Empfohlen aber nicht verpflichtend | - |
| **Example** | Nur als Beispiel, keine Einschränkung | - |

### Implementierungshinweise

- **Mehrfach-Kodierung**: ICD-10-GM + Orphanet für seltene Erkrankungen
- **Display-Werte**: Immer angeben für Benutzerfreundlichkeit
- **Versionierung**: Terminologie-Versionen dokumentieren (besonders ICD-10-GM Jahresversion)
- **MANE-Transkripte**: Bevorzugt für HGVS-Notationen verwenden
