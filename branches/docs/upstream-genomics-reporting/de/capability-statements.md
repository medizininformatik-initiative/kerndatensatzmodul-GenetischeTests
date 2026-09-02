# CapabilityStatements - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2027.0.0-ballot.rc1

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

#### Warum drei Profile MAY sind

Von den siebzehn unterstützten Profilen tragen vierzehn `SHALL` und drei `MAY`: `genotyp`, `haplotype` und `sequence-phase-relationship`.

Alle drei sagen etwas über **Allele als Ganzes** aus statt über einen einzelnen Befund: welche Allele an einem Locus sitzen, welche Varianten gemeinsam vererbt werden und ob zwei Varianten auf derselben Chromosomenkopie liegen. Viele Labore leiten das nie ab — sie berichten die Varianten und hören dort auf. Ein `SHALL` würde Implementierende zu Daten verpflichten, die sie nicht haben.

`MAY` sagt stattdessen das Brauchbare: Wer Genotypen, Haplotypen oder Phasenbeziehungen austauscht, nutzt dafür diese Profile und erfindet nichts Eigenes. Der verpflichtende Kern dieses Moduls sind der Befundbericht, die Varianten und die daraus gezogenen Implikationen.

Zwei der drei — `haplotype` und `sequence-phase-relationship` — werden von diesem Modul gar nicht profiliert; sie werden unverändert aus Clinical Genomics STU3 übernommen und sind unter [Implementierungshinweise](implementer-guidance.md) beschrieben.

