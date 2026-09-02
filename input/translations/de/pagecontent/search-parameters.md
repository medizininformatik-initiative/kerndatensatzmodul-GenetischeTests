<!-- markdownlint-disable MD041 -->
<!-- Deutsche Übersetzung von input/pagecontent/search-parameters.md.
     Beide Sprachfassungen müssen dasselbe aussagen. -->

### Suchparameter

Diese Seite listet die Suchparameter auf, auf die sich Implementierende beim Modul
**Molekulargenetischer Befundbericht** verlassen können. Sie hat zwei Teile: die
Parameter, die dieses Modul **selbst definiert**, und den vollständigen Satz, den ein
konformer Server **unterstützen muss** und den das CapabilityStatement deklariert.

Beide Tabellen sind aus den gebauten Artefakten abgeleitet und nicht von Hand
gepflegt — normativ sind das CapabilityStatement und die SearchParameter-Ressourcen.

#### Von diesem Modul definierte Suchparameter

Diese 6 Parameter erschließen Elemente, die die FHIR-Basis-Suchparameter nicht
erreichen, weil sie in Clinical-Genomics-Extensions liegen. Die FHIRPath-Ausdrücke
stehen auf den verlinkten Artefaktseiten.

| Code | Basis-Ressource | Typ | Artefakt |
|---|---|---|---|
| `genomic-study` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-genomic-study](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.html) |
| `recommended-action` | DiagnosticReport | `reference` | [mii-sp-molgen-diagnostic-report-recommended-action](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.html) |
| `device` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.html) |
| `method-type` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-method](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.html) |
| `regions-studied` | Procedure | `token` | [mii-sp-molgen-genomic-study-analysis-regions-studied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.html) |
| `specimen` | Procedure | `reference` | [mii-sp-molgen-genomic-study-analysis-specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.html) |

#### Suchparameter, die ein konformer Server unterstützen muss

Das CapabilityStatement [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)
deklariert 103 Suchparameter über 7 Ressourcentypen. `_id`, `_lastUpdated` und
`_profile` sind bei jedem Ressourcentyp verpflichtend, damit Instanzen über ihre
Identität, ihren Änderungszeitpunkt und das beanspruchte Profil auffindbar sind.

| Ressource | Unterstützte Suchparameter |
|---|---|
| `ServiceRequest` | `_id`, `_lastUpdated`, `_profile`, `code`, `based-on`, `subject`, `authored`, `requester`, `reason-code`, `reason-reference` |
| `DiagnosticReport` | `_id`, `_lastUpdated`, `_profile`, `status`, `category`, `code`, `subject`, `encounter`, `date`, `issued`, `performer`, `results-interpreter`, `specimen`, `result`, `conclusion`, `media` |
| `Observation` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `category`, `code`, `code-value-concept`, `code-value-date`, `code-value-quantity`, `code-value-string`, `component-code`, `component-code-value-concept`, `component-code-value-quantity`, `component-data-absent-reason`, `component-value-concept`, `component-value-quantity`, `data-absent-reason`, `date`, `derived-from`, `device`, `encounter`, `focus`, `has-member`, `identifier`, `method`, `part-of`, `patient`, `performer`, `specimen`, `status`, `subject`, `value-concept`, `value-date`, `value-quantity`, `value-string` |
| `Procedure` | `_id`, `_lastUpdated`, `_profile`, `status`, `subject`, `encounter`, `performer`, `date` |
| `RiskAssessment` | `_id`, `_lastUpdated`, `_profile`, `subject`, `performer`, `date` |
| `Task` | `_id`, `_lastUpdated`, `_profile`, `based-on`, `code`, `encounter`, `focus`, `intent`, `patient`, `performer`, `requester`, `status`, `subject`, `reason-code`, `reason-reference`, `for` |
| `FamilyMemberHistory` | `_id`, `_lastUpdated`, `_profile`, `code`, `date`, `identifier`, `patient`, `relationship`, `sex`, `status`, `reason-code`, `reason-reference` |

Die Erwartungshaltung je Eintrag (`SHALL` / `SHOULD` / `MAY`) und die unterstützten
Interaktionen stehen im CapabilityStatement selbst — es führt sie pro Parameter, und
diese Seite wiederholt sie nicht.
