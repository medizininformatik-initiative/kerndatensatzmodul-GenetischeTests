# Suchparameter - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* **Suchparameter**

## Suchparameter

 Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

### Suchparameter

Diese Seite listet die Suchparameter auf, auf die sich Implementierende im Modul **Molekulargenetischer Befundbericht** verlassen können. Sie hat zwei Teile: die Parameter, die dieses Modul **selbst definiert** — jeder unten erklärt — und den vollständigen Satz, den ein konformer Server **unterstützen muss** und den das CapabilityStatement deklariert.

Beide Teile sind aus den gebauten Artefakten abgeleitet, nicht von Hand gepflegt — normativ sind das CapabilityStatement und die SearchParameter-Ressourcen.

#### Von diesem Modul definierte Suchparameter

Clinical Genomics STU3 führt mehrere Datenelemente in **Extensions** statt in der Basisressource. Die FHIR-Basissuchparameter können nicht in eine Extension hineinsehen, deshalb wären diese sechs Elemente ohne einen eigenen Parameter nicht suchbar. Jeder Eintrag unten nennt das Element, das er erreicht, den Grund, warum die Basisparameter das nicht tun, und eine ausformulierte Abfrage.

In den Beispielen ist `[base]` die FHIR-Basis-URL des Servers.

##### genomic-study — vom Befund zurück zur Untersuchung

Findet die Befunde, die aus einer bestimmten genomischen Untersuchung hervorgegangen sind. `DiagnosticReport.result` zeigt auf die **Observations**; die Untersuchung selbst hängt über die Extension `genomic-study-reference` am Befund, die kein Basisparameter erreicht.

| | |
| :--- | :--- |
| Basis / Typ / Ziel | `DiagnosticReport`·`reference`·`Procedure` |
| Ausdruck | `DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference').value` |
| Artefakt | [mii-sp-molgen-diagnostic-report-genomic-study](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.md) |

```
GET [base]/DiagnosticReport?genomic-study=Procedure/mii-exa-molgen-genomic-study-tso500

```

##### recommended-action — Befunde mit einer bestimmten Folgemaßnahme

Findet die Befunde, die eine bestimmte Folgemaßnahme empfehlen — eine Bestätigungsuntersuchung, eine Familienabklärung, eine Therapieempfehlung. Die Maßnahme ist ein `Task`, der aus der Extension `recommended-action` referenziert wird, und damit über `DiagnosticReport.result` nicht erreichbar.

| | |
| :--- | :--- |
| Basis / Typ / Ziel | `DiagnosticReport`·`reference`·`Task` |
| Ausdruck | `DiagnosticReport.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/recommended-action').value` |
| Artefakt | [mii-sp-molgen-diagnostic-report-recommended-action](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.md) |

```
GET [base]/DiagnosticReport?recommended-action=Task/mii-exa-molgen-folgemassnahme-1

```

##### regions-studied — „nicht gefunden" von „nicht gesucht" unterscheiden

Der eine Parameter hier mit klinischer Konsequenz statt bloßer Bequemlichkeit. Ein Befund, der keine Variante in **BRCA1** nennt, bedeutet nichts, solange nicht klar ist, ob **BRCA1** überhaupt untersucht wurde. Die untersuchten Regionen stehen in der Unter-Extension `studied` von `genomic-study-analysis-regions`; dieser Parameter ist das, womit eine Abfrage die Abdeckung feststellen kann.

| | |
| :--- | :--- |
| Basis / Typ | `Procedure`·`token` |
| Ausdruck | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions').extension.where(url='studied').value` |
| Artefakt | [mii-sp-molgen-genomic-study-analysis-regions-studied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.md) |

```
GET [base]/Procedure?regions-studied=http://www.genenames.org/geneId|HGNC:1100

```

##### method-type — Analysen nach angewandter Methode

Findet Analysen über die verwendete Sequenzier- oder Genotypisierungsmethode — Sequenzierung, DNA-Hybridisierung, computergestützte Auswertung. Die Methode bestimmt, was eine Analyse überhaupt detektieren kann und was nicht; deshalb ist sie für sich suchbar. Sie steht in der Extension `genomic-study-analysis-method-type`; `Procedure.code` trägt die Prozedur, nicht die Methode.

| | |
| :--- | :--- |
| Basis / Typ | `Procedure`·`token` |
| Ausdruck | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type').value` |
| Artefakt | [mii-sp-molgen-genomic-study-analysis-method](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.md) |

```
GET [base]/Procedure?method-type=http://loinc.org|LA26398-0

```

##### specimen — Analysen an einer bestimmten Probe

Findet die Analysen, die an einer bestimmten Probe durchgeführt wurden, etwa um alles zu sehen, was aus einem Tumorblock hervorgegangen ist. `Procedure` hat in R4 gar keinen Basissuchparameter `specimen`; die Referenz steht in der Extension `genomic-study-analysis-specimen`.

| | |
| :--- | :--- |
| Basis / Typ / Ziel | `Procedure`·`reference`·`Specimen` |
| Ausdruck | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen').value` |
| Artefakt | [mii-sp-molgen-genomic-study-analysis-specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.md) |

```
GET [base]/Procedure?specimen=Specimen/mii-exa-molgen-specimen-ffpe-tumor

```

##### device — Analysen auf einem bestimmten Gerät

Findet die Analysen, die ein bestimmter Sequenzierer oder ein bestimmtes Analysegerät erzeugt hat. Das ist die Rückverfolgung zum Instrument, und die zählt, wenn eine Plattform zurückgerufen, neu kalibriert wird oder sich bei einer Variantenklasse als fehleranfällig erweist. Das Gerät steht in der Extension `genomic-study-analysis-device`.

| | |
| :--- | :--- |
| Basis / Typ / Ziel | `Procedure`·`reference`·`Device` |
| Ausdruck | `Procedure.extension.where(url='http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device').value` |
| Artefakt | [mii-sp-molgen-genomic-study-analysis-device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.md) |

```
GET [base]/Procedure?device=Device/mii-exa-molgen-device-tso500-lot

```

#### Suchparameter, die ein konformer Server unterstützen muss

Das CapabilityStatement [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md) deklariert 110 Suchparameter über 7 Ressourcentypen — die 6 oben und 104 aus der FHIR-Basisspezifikation. `_id`, `_lastUpdated` und `_profile` sind auf jedem Ressourcentyp gefordert, damit Instanzen über ihre Identität, ihren Änderungszeitpunkt und das von ihnen beanspruchte Profil abrufbar sind.

| | |
| :--- | :--- |
| `ServiceRequest` | `_id`,`_lastUpdated`,`_profile`,`code`,`based-on`,`subject`,`authored`,`requester`,`reason-code`,`reason-reference` |
| `DiagnosticReport` | `_id`,`_lastUpdated`,`_profile`,`status`,`category`,`code`,`subject`,`encounter`,`date`,`issued`,`performer`,`results-interpreter`,`specimen`,`result`,`conclusion`,`media`,`genomic-study`,`recommended-action` |
| `Observation` | `_id`,`_lastUpdated`,`_profile`,`based-on`,`category`,`code`,`code-value-concept`,`code-value-date`,`code-value-quantity`,`code-value-string`,`component-code`,`component-code-value-concept`,`component-code-value-quantity`,`component-data-absent-reason`,`component-value-concept`,`component-value-quantity`,`data-absent-reason`,`date`,`derived-from`,`device`,`encounter`,`focus`,`has-member`,`identifier`,`method`,`part-of`,`patient`,`performer`,`specimen`,`status`,`subject`,`value-concept`,`value-date`,`value-quantity`,`value-string` |
| `Procedure` | `_id`,`_lastUpdated`,`_profile`,`status`,`code`,`subject`,`encounter`,`performer`,`date`,`device`,`method-type`,`regions-studied`,`specimen` |
| `RiskAssessment` | `_id`,`_lastUpdated`,`_profile`,`subject`,`performer`,`date` |
| `Task` | `_id`,`_lastUpdated`,`_profile`,`based-on`,`code`,`encounter`,`focus`,`intent`,`patient`,`performer`,`requester`,`status`,`subject`,`reason-code`,`reason-reference`,`for` |
| `FamilyMemberHistory` | `_id`,`_lastUpdated`,`_profile`,`code`,`date`,`identifier`,`patient`,`relationship`,`sex`,`status`,`reason-code`,`reason-reference` |

`Procedure.code` unterscheidet eine GenomicStudy von einer GenomicStudyAnalysis — beide sind `Procedure` und lassen sich ohne den Code serverseitig nicht trennen.

Welche Erwartung an einem Eintrag hängt (`SHALL` / `SHOULD` / `MAY`) und welche Interaktionen unterstützt werden, steht im CapabilityStatement selbst — es trägt das je Parameter, und diese Seite wiederholt es nicht.

