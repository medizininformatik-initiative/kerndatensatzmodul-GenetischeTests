<!-- markdownlint-disable MD041 -->
<!-- Migriert aus dem Simplifier-Leitfaden TechnischeImplementierung/CapabilityStatement.page.md
     (Quellbaum implementation-guides/ImplementationGuide-2026.x-DE, Commit 79eaf41, Migration 2026-08-28).
     Simplifier-Direktiven sind nach references/fql-crosswalk.md aufgeloest. -->
<!-- Deutsche Übersetzung von input/pagecontent/capability-statements.md
     — beide Dateien müssen dasselbe aussagen. -->
### CapabilityStatements

Die CapabilityStatements des Moduls **Molekulargenetischer Befundbericht** beschreiben die erwarteten Server-/Client-Fähigkeiten (unterstützte Ressourcen und Interaktionen).

Um eine dezentrale Datenauswertung mittels des Deutschen Forschungsdatenportals für Gesundheit der Medizininformatik-Initiative zu ermöglichen, MUSS die [capabilities-Interaktion](https://www.hl7.org/fhir/http.html#capabilities) unterstützt werden, sodass durch den FHIR-Server unter `[BASE-URL]/metadata` ein CapabilityStatement exponiert wird. Innerhalb dieses CapabilityStatement MUSS angegeben werden, welche Profile inkl. Version sowie welche Suchparameter unterstützt werden.

Nachfolgend wird aufgelistet, welche Inhalte verpflichtend im CapabilityStatement angegeben werden MÜSSEN. Darüber hinaus MUSS eine Konformität zu dem nachfolgenden CapabilityStatement in der jeweiligen CapabilityStatement-Instanz unter [`CapabilityStatement.instantiates`](https://www.hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates) angegeben werden.

Canonical: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata`

[mii-cps-molgen-capabilitystatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.html)
