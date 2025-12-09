---
topic: Qualitaetsbericht
---
# Qualitätsbericht / Validation Report

## Übersicht

Dieses Modul wird kontinuierlich mittels automatisierter FHIR-Validierung geprüft. Der Validierungsprozess verwendet den HL7 FHIR Validator mit Anbindung an den MII Terminologie-Server.

## Validierungsstatus

| Metrik                        | Wert                 |
| ----------------------------- | -------------------- |
| **Validierungsversion** | FHIR Validator 6.7.x |
| **FHIR Version**        | R4 (4.0.1)           |
| **Terminologie-Server** | MII TX Server        |
| **Fehler gesamt**       | 57                   |
| **Unterdrückt**         | 48                   |
| **Aktionierbar**        | 9                    |

## Bekannte Validierungsfehler (Suppressed)

Die folgenden Validierungsfehler sind bekannt und werden bewusst unterdrückt:

### Terminologie-Server Limitierungen

| Fehler                          | Beschreibung                                                                       | Status                                                                 |
| ------------------------------- | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| HGNC Fusion Notation            | `Unknown code 'HGNC:3689::HGNC:2697'`                                            | Offizielle Notation für Fusionsgene, nicht vom TX-Server unterstützt |
| StructureDefinition Sprach-Code | `UNABLE_TO_INFER_CODESYSTEM` / `Terminology_TX_NoValid_16` für `de-DE`        | Sprach-Codes in Profil-Definitionen werden nicht erkannt               |

### MIME-Type Validierung

| Kontext           | MIME-Types                           | Beschreibung                     |
| ----------------- | ------------------------------------ | -------------------------------- |
| DocumentReference | `application/gzip`, `text/plain` | Genomische Rohdaten (FASTQ, BED) |
| Media             | `image/png`                        | Coverage-Plots                   |

Diese MIME-Types sind valide, werden aber vom Terminologie-Server nicht erkannt (`UNABLE_TO_INFER_CODESYSTEM`, `Terminology_TX_NoValid_16`).

### Konfiguration

Die Suppression-Regeln für den HL7 FHIR Java Validator sind in der Datei [`advisor.json`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/advisor.json) konfiguriert.

Weitere Informationen zum Advisor Framework: [HL7 Confluence - Advisor File](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation#IGPublisherDocumentation-AdvisorFile)

## Validierungs-Pipeline

Die Validierung erfolgt automatisch bei jedem Push über GitHub Actions:

```
CI (FHIR Validation)
├── JAVA_FHIR_VALIDATION (~42 min)
│   └── HL7 FHIR Validator mit TX-Server
└── DOTNET_FHIR_VALIDATION (~2 min)
    └── Firely.Terminal
```

### Pipeline-Optimierung (experimentell)

Die Java-Validierung ist derzeit der Flaschenhals der CI/CD-Pipeline. Die Hauptursachen für die lange Laufzeit:

| Phase | Beschreibung | Optimierungspotential |
|-------|--------------|----------------------|
| **Package-Download** | ~150 MB FHIR-Pakete (hl7.terminology.r4, genomics-reporting, etc.) | Caching |
| **Snapshot-Generierung** | Aufbau der Snapshot-Elemente für alle Abhängigkeiten entlang der Vererbungskette | Bereits vorberechnet in publizierten Paketen |
| **Validierung** | Eigentliche Prüfung der ~130 Ressourcen | Inkrementelle Validierung |

**Aktueller Test:** Die Pipeline wurde um FHIR-Package-Caching erweitert, um die Download- und Parsing-Zeit bei wiederholten Läufen zu reduzieren. Ergebnisse werden nach mehreren Durchläufen evaluiert.

## Offene Themen

Siehe [GitHub Issues](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/issues) für offene Themen und Feature Requests.
