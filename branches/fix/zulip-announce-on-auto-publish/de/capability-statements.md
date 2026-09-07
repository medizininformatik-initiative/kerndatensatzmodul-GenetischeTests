# CapabilityStatements - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc2

* [**Inhaltsverzeichnis**](toc.md)
* **CapabilityStatements**

## CapabilityStatements

 Diese Seite enthält Übersetzungen aus der Originalsprache, in der der Leitfaden verfasst wurde. Informationen zu diesen Übersetzungen und Anweisungen zum Abgeben von Feedback zu den Übersetzungen finden Sie [hier](translationinfo.md). 

### CapabilityStatements

Die CapabilityStatements des Moduls **Molekulargenetischer Befundbericht** beschreiben die erwarteten Server-/Client-Fähigkeiten (unterstützte Ressourcen und Interaktionen).

Um eine dezentrale Datenauswertung mittels des Deutschen Forschungsdatenportals für Gesundheit der Medizininformatik-Initiative zu ermöglichen, MUSS die [capabilities-Interaktion](https://www.hl7.org/fhir/http.html#capabilities) unterstützt werden, sodass durch den FHIR-Server unter `[BASE-URL]/metadata` ein CapabilityStatement exponiert wird. Innerhalb dieses CapabilityStatement MUSS angegeben werden, welche Profile inkl. Version sowie welche Suchparameter unterstützt werden.

Nachfolgend wird aufgelistet, welche Inhalte verpflichtend im CapabilityStatement angegeben werden MÜSSEN. Darüber hinaus MUSS eine Konformität zu dem nachfolgenden CapabilityStatement in der jeweiligen CapabilityStatement-Instanz unter [`CapabilityStatement.instantiates`](https://www.hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates) angegeben werden.

Canonical: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata`

[mii-cps-molgen-capabilitystatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

#### Unterstützte Profile und ihre Erwartung

Das oben gerenderte CapabilityStatement listet die unterstützten Profile als Links, **zeigt aber die Erwartung dazu nicht an** — der IG Publisher lässt sie weg. Die folgende Tabelle holt das nach. Sie ist aus dem gebauten CapabilityStatement erzeugt und kann deshalb nicht davon abweichen.

| | | |
| :--- | :--- | :--- |
| `DiagnosticReport` | [MII PR MolGen Molekulargenetischer Befundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) | `SHALL` |
| `FamilyMemberHistory` | [MII PR MolGen Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md) | `SHALL` |
| `Observation` | [MII PR MolGen Diagnostische Implikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) | `SHALL` |
| `Observation` | [MII PR MolGen Mikrosatelliteninstabilität](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md) | `SHALL` |
| `Observation` | [MII PR MolGen Molekulare Konsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md) | `SHALL` |
| `Observation` | [MII PR MolGen Molekularer Biomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md) | `SHALL` |
| `Observation` | [MII PR MolGen Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md) | `SHALL` |
| `Observation` | [MII PR MolGen Therapeutische Implikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md) | `SHALL` |
| `Observation` | [MII PR MolGen Variante](StructureDefinition-mii-pr-molgen-variante.md) | `SHALL` |
| `Procedure` | [MII PR MolGen Genomic Study Analysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md) | `SHALL` |
| `Procedure` | [MII PR MolGen Genomic Study](StructureDefinition-mii-pr-molgen-genomic-study.md) | `SHALL` |
| `RiskAssessment` | [MII PR MolGen Polygener Risiko Score](StructureDefinition-mii-pr-molgen-polygener-risiko-score.md) | `SHALL` |
| `ServiceRequest` | [MII PR MolGen Anforderung genetischer Test](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) | `SHALL` |
| `Task` | [MII PR MolGen Empfohlene Folgemaßnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md) | `SHALL` |
| `Task` | [MII PR MolGen Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md) | `SHALL` |
| `Observation` | [MII PR MolGen Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md) | `MAY` |
| `Observation` | [haplotype](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-haplotype.html) | `MAY` |
| `Observation` | [sequence-phase-relationship](http://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-sequence-phase-relationship.html) | `MAY` |

`SHALL` heißt, ein konformer Server muss das Profil unterstützen; `MAY` heißt, es ist für alle spezifiziert, die diese Daten austauschen, aber kein Server ist verpflichtet, sie zu erzeugen.

#### Warum drei Profile MAY sind

Von den achtzehn unterstützten Profilen tragen fünfzehn `SHALL` und drei `MAY`: `genotyp`, `haplotype` und `sequence-phase-relationship`.

Alle drei sagen etwas über **Allele als Ganzes** aus statt über einen einzelnen Befund: welche Allele an einem Locus sitzen, welche Varianten gemeinsam vererbt werden und ob zwei Varianten auf derselben Chromosomenkopie liegen. Viele Labore leiten das nie ab — sie berichten die Varianten und hören dort auf. Ein `SHALL` würde Implementierende zu Daten verpflichten, die sie nicht haben.

`MAY` sagt stattdessen das Brauchbare: Wer Genotypen, Haplotypen oder Phasenbeziehungen austauscht, nutzt dafür diese Profile und erfindet nichts Eigenes. Der verpflichtende Kern dieses Moduls sind der Befundbericht, die Varianten und die daraus gezogenen Implikationen.

Zwei der drei — `haplotype` und `sequence-phase-relationship` — werden von diesem Modul gar nicht profiliert; sie werden unverändert aus Clinical Genomics STU3 übernommen und sind unter [Implementierungshinweise](implementer-guidance.md) beschrieben.

