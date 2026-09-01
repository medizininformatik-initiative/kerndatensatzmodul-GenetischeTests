# Artefaktübersicht - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Inhaltsverzeichnis**](toc.md)
* **Artefaktübersicht**

## Artefaktübersicht

 Für die aktuelle Seite ist keine Übersetzung verfügbar, daher wurde sie in der Standardsprache dargestellt. 

Diese Seite bietet eine Liste der FHIR-Artefakte, die in diesem Implementierungsleitfaden definiert sind.

### Verhalten: CapabilityStatements 

Die folgenden Artefakte definieren die spezifischen Fähigkeiten, die verschiedene Systemtypen haben müssen, um diesem Implementierungsleitfaden zu entsprechen. Von Systemen, die mit dem Implementierungsleitfaden konform sind, wird erwartet, dass sie die Konformität mit einem oder mehreren der folgenden Capability Statements deklarieren.

| | |
| :--- | :--- |
| [ MII CPS MolGen CapabilityStatement  ](CapabilityStatement-mii-cps-molgen-capabilitystatement.md) | Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul MolGen der Medizininformatik Initiative zu implementieren. |

### Verhalten: Suchparameter (SearchParameter) 

Diese definieren die Eigenschaften, nach denen ein RESTful-Server durchsucht werden kann. Sie können auch zum Sortieren und Einbeziehen verwandter Ressourcen verwendet werden.

| | |
| :--- | :--- |
| [ mii-sp-molgen-diagnostic-report-genomic-study  ](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.md) | Suchparameter für GenomicStudy Referenz in DiagnosticReport |
| [ mii-sp-molgen-diagnostic-report-recommended-action  ](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.md) | Suchparameter für empfohlene Maßnahmen in DiagnosticReport |
| [ mii-sp-molgen-genomic-study-analysis-device  ](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.md) | Suchparameter für verwendetes Gerät in GenomicStudyAnalysis |
| [ mii-sp-molgen-genomic-study-analysis-method  ](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.md) | Suchparameter für Methoden-Typ in GenomicStudyAnalysis |
| [ mii-sp-molgen-genomic-study-analysis-regions-studied  ](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.md) | Suchparameter für untersuchte Gene/Regionen in GenomicStudyAnalysis |
| [ mii-sp-molgen-genomic-study-analysis-specimen  ](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.md) | Suchparameter für Specimen in GenomicStudyAnalysis |

### Strukturen: Logische Modelle 

Diese definieren Datenmodelle, die den von diesem Implementierungsleitfaden abgedeckten Bereich in geschäftsfreundlicheren Begriffen darstellen als die zugrunde liegenden FHIR-Ressourcen.

| | |
| :--- | :--- |
| [ MII LM MolGen LogicalModel  ](StructureDefinition-LogicalModelMolGen.md) | LogicalModel des MII Moduls Molekulargenetischer Befundbericht |

### Strukturen: Ressourcenprofile 

Diese definieren Einschränkungen für FHIR-Ressourcen für Systeme, die mit dem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII PR MolGen Anforderung genetischer Test  ](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md) | Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst. |
| [ MII PR MolGen Diagnostische Implikation  ](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md) | Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit. |
| [ MII PR MolGen Empfohlene Folgemaßnahme  ](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md) | Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen. |
| [ MII PR MolGen Familienanamnese  ](StructureDefinition-mii-pr-molgen-familienanamnese.md) | Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen. |
| [ MII PR MolGen Genomic Study  ](StructureDefinition-mii-pr-molgen-genomic-study.md) | Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet . |
| [ MII PR MolGen Genomic Study Analysis  ](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md) | Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden. |
| [ MII PR MolGen Genotyp  ](StructureDefinition-mii-pr-molgen-genotyp.md) | Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen. |
| [ MII PR MolGen Medikationsempfehlung  ](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md) | Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen. |
| [ MII PR MolGen Mikrosatelliteninstabilität  ](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md) | Mikrosatelliteninstabilität (MSI) ist ein Zustand genetischer Hypermutabilität (Neigung zu Mutationen), der aus einer gestörten DNA-Mismatch-Reparatur (MMR) resultiert. Das Profil basiert auf dem CG STU3 MolecularBiomarker-Profil |
| [ MII PR MolGen Molekulare Biomarker  ](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md) | Dieses Profil beschreibt molekulare Biomarker, z.B. genübergreifende Biomarker wie Tumormutationslast (TMB) oder Mikrosatelliteninstabilität (MSI). Es ist ein abstraktes Profil, konkrete Biomarker-Profile erben davon. |
| [ MII PR MolGen Molekulare Konsequenz  ](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md) | Dieses Profil beschreibt den Zusammenhang von bestimmten Varianten, Haplotypen oder Genotypen und bestimmten Konsequenzen auf molekularer Ebene. |
| [ MII PR MolGen Molekulargenetischer Befundbericht  ](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md) | Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden. |
| [ MII PR MolGen Mutationslast  ](StructureDefinition-mii-pr-molgen-mutationslast.md) | Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen. |
| [ MII PR MolGen Polygener Risiko Score  ](StructureDefinition-mii-pr-molgen-polygener-risiko-score.md) | Profil für Polygenen Risiko Score |
| [ MII PR MolGen Therapeutische Implikation  ](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md) | Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie. |
| [ MII PR MolGen Variante  ](StructureDefinition-mii-pr-molgen-variante.md) | Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden. |

### Strukturen: Extension-Definitionen 

Diese definieren Einschränkungen für FHIR-Datentypen für Systeme, die mit diesem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII EX Mol Gen Verwandtschaftsgrad  ](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md) | Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen. |
| [ MII EX MolGen Empfohlene Maßnahme  ](StructureDefinition-mii-ex-molgen-empfohlene-massnahme.md) | Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird. |
| [ MII EX MolGen Familiare Linie  ](StructureDefinition-mii-ex-molgen-familiare-linie.md) | Extension erlaubt die Angabe der familiären Linie zwischen Patient und Familienangehörigen. |
| [ MII EX MolGen RiskAssessment Einflussfaktor  ](StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.md) | Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben. |
| [ MII EX MolGen Verwandtschaftsverhaeltnis  ](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md) | Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen. |

### Terminologie: ValueSets 

Diese definieren Wertemengen, die von Systemen verwendet werden, die mit dem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ MII VS Mol Gen Verwandtschaftsgrad  ](ValueSet-mii-vs-molgen-verwandtschaftsgrad.md) | ValueSet für die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen. |
| [ MII VS MolGen Familiäre Linie  ](ValueSet-mii-vs-molgen-familiaere-linie.md) | ValueSet für die Angabe der familären Linie zwischen Patient und Familienangehörigen. |
| [ MII VS MolGen Family Member SNOMED  ](ValueSet-mii-vs-molgen-family-member-snomed.md) | The ValueSet contains codes for related family member types from SNOMED CT. |
| [ MII VS MolGen Verwandtschaftsverhaeltnis  ](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.md) | ValueSet für die Angabe eines Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen. |

### Beispiel: Beispielinstanzen 

Dies sind Beispielinstanzen, die zeigen, wie Daten aussehen könnten, die von Systemen produziert und konsumiert werden, die mit diesem Implementierungsleitfaden konform sind.

| | |
| :--- | :--- |
| [ Agilent SureSelect Human All Exon V7 Protocol  ](PlanDefinition-mii-exa-molgen-protocol-agilent-sureselect.md) | Protokoll für Exom-Anreicherung |
| [ Anforderung BRAF Genetische Testung  ](ServiceRequest-mii-exa-molgen-anforderung-1.md) | Beispiel für Anforderung für genetische Testung auf genetische Variante im BRAF Gen an Hand von NGS. |
| [ Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs  ](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md) | Beispiel für Anforderung für genetische Testung bei Familiärer Belastung für Brust- und Eierstockkrebs. |
| [ Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom  ](ServiceRequest-mii-exa-molgen-anforderung-2.md) | Beispiel für Anforderung für genetische Testung auf pathogene Variante im NIPBL Gen. |
| [ Anforderung Whole Exome Sequencing  ](ServiceRequest-mii-exa-molgen-anforderung-wes.md) |  |
| [ BED File for Target Regions  ](DocumentReference-mii-exa-molgen-documentreference-bed-file.md) | BED-Datei mit den Zielregionen des Exom-Kits |
| [ BRAF Empfohlene Folgemaßnahme  ](Task-mii-exa-molgen-folgemassnahme-1.md) | Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS. |
| [ BRAF Variante  ](Observation-mii-exa-molgen-variante-1.md) | Beispiel für genetische Variante im BRAF Gen an Hand von NGS. |
| [ BRAF Variante Diagnostische Implikation  ](Observation-mii-exa-molgen-diagnostische-implikation-1.md) | Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS. |
| [ BRAF Variante Medikationsempfehlung  ](Task-mii-exa-molgen-medikationsempfehlung-1.md) | Beispiel für Medikationsempfehlung abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS. |
| [ BRAF Variante Molekulare Konsequenz  ](Observation-mii-exa-molgen-molekulare-konsequenz-1.md) | Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS. |
| [ BRAF Variante Therapeutische Implikation  ](Observation-mii-exa-molgen-therapeutische-implikation-1.md) | Beispiel für therapeutische Implikation abgeleitet von genetische Variante im BRAF Gen an Hand von NGS. |
| [ Beispiel Mutationslast in Tumorprobe  ](Observation-mii-exa-molgen-mutationslast-1.md) | Beispiel für Mutationslast in Tumorprobe. |
| [ CNV SMO Diagnostische Implikation  ](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md) | Beispiel für diagnostische Implikation abgeleitet von Copy Number Variante im SMO Gen. |
| [ CNV SMO Molekulare Konsequenz  ](Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.md) | Beispiel für molekulare Konsequenz abgeleitet von Copy Number Variante im SMO Gen. |
| [ Comprehensive WES Bundle with Full Technical Documentation  ](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md) | Transaktions-Bundle für eine vollständige Whole Exome Sequencing Analyse mit detaillierten technischen Angaben zu Geräten, Kits, Metriken und Bioinformatik-Pipeline. Dieses Beispiel zeigt die erweiterten Dokumentationsmöglichkeiten für Forschungsprojekte. |
| [ Comprehensive WES Report with Full Technical Documentation  ](DiagnosticReport-mii-exa-molgen-befundbericht-comprehensive-wes.md) | Beispiel für einen vollständigen WES-Bericht mit detaillierten technischen Angaben |
| [ Comprehensive Whole Exome Sequencing Study  ](Procedure-mii-exa-molgen-genomic-study-comprehensive-wes.md) | Vollständiges Exom-Sequenzierung Beispiel mit detaillierten technischen Angaben |
| [ Coverage Plot  ](Media-mii-exa-molgen-media-coverage-plot.md) | Graphical representation of sequencing coverage |
| [ DNA Library  ](Specimen-mii-exa-molgen-specimen-dna-library.md) | Prepared DNA library for sequencing |
| [ Diagnostic Implication for KMT2A Variant  ](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md) |  |
| [ Diagnostische Implikation BRCA1 Variante  ](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md) | Beispiel für diagnostische Implikation abgeleitet von SNP im BRCA1. |
| [ EDTA Blood Sample  ](Specimen-mii-exa-molgen-specimen-blood-edta.md) | EDTA-Blutprobe für DNA-Extraktion |
| [ Empfohlene Folgemaßnahme bei BRCA1 Variante  ](Task-mii-exa-molgen-folgemassnahme-brca1.md) | Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRCA1 Gen an Hand von NGS. |
| [ FASTQ Sequencing Files  ](DocumentReference-mii-exa-molgen-documentreference-fastq.md) | Raw sequencing data files |
| [ Family History - Father with Type 2 Diabetes  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md) | Example of family member history documenting father's Type 2 diabetes mellitus (ICD-10: E11.9) |
| [ Family History - Mother with Myocardial Infarction  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md) | Example of family member history documenting mother's ST-elevation myocardial infarction (ICD-10: I21.2) |
| [ Family History - Sister with Retinal Disorder  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md) | Example of family member history documenting sister's retinal disorder (ICD-10: H35.8) |
| [ Genomic Study Analysis BRAF  ](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md) | Analyse der BRAF Region mittels NGS |
| [ Genomic Study Analysis Cornelia de Lange Panel  ](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md) | NGS-Analyse des Cornelia de Lange-Syndrom Panels |
| [ Genomic Study Analysis TruRisk Panel v3  ](Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.md) | NGS-Analyse des TruRisk Panel v3 für erblichen Brust- und Eierstockkrebs |
| [ Genomic Study Cornelia de Lange Panel  ](Procedure-mii-exa-molgen-genomic-study-cornelia-de-lange.md) | Genomische Studie für Cornelia de Lange-Syndrom Panel |
| [ Genomic Study TSO500 NSCLC  ](Procedure-mii-exa-molgen-genomic-study-tso500.md) | Komprehensives Tumor-Profiling mit TSO500 bei nicht-kleinzelligem Lungenkarzinom (NSCLC) |
| [ Genomic Study TruRisk Panel v3  ](Procedure-mii-exa-molgen-genomic-study-trurisk-panel.md) | Genomische Studie für TruRisk Panel v3 |
| [ Genotyp BRAF  ](Observation-mii-exa-molgen-genotyp-1.md) | Beispiel für Genotyp BRAF Gen. |
| [ Genotyp BRCA1  ](Observation-mii-exa-molgen-genotyp-brca1.md) | Beispiel für Genotyp BRCA1 Gen. |
| [ Genotyp NIPBL  ](Observation-mii-exa-molgen-genotyp-2.md) | Beispiel für Genotyp NIPBL Gen. |
| [ Illumina NovaSeq 6000 Sequencer  ](Device-mii-exa-molgen-device-illumina-novaseq.md) | Beispiel für Sequenziergerät |
| [ Ion Chef System  ](Device-mii-exa-molgen-device-thermofisher-ionchef.md) | Library Preparation System |
| [ KMT2A Pathogenic Variant from WES  ](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md) |  |
| [ Mikrosatelliteninstabilität  ](Observation-mii-exa-molgen-mikrosatelliteninstabilitaet-1.md) | Beispiel für Mikrosatelliteninstabilität in Tumorprobe. |
| [ Molekulare Konsequenz BRCA1 Variante  ](Observation-mii-exa-molgen-molekulare-konsequenz-brca1.md) | Beispiel für molekulare Konsequenz abgeleitet von SNP im BRCA1. |
| [ Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom  ](DiagnosticReport-mii-exa-molgen-befundbericht-1.md) | Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom. |
| [ Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom  ](Procedure-mii-exa-molgen-genomic-study-1.md) | Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom. |
| [ Molekulargentischer Befund 2: Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang  ](DiagnosticReport-mii-exa-molgen-befundbericht-2.md) | Beispiel für molekulargenetischen Befund Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang. |
| [ Molekulargentischer Befund 3: Tumorboard Genfusion  ](DiagnosticReport-mii-exa-molgen-befundbericht-tumorboard-3.md) | Beispiel für molekulargenetischen Befund Tumorboard Genfusion. |
| [ Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs  ](DiagnosticReport-mii-exa-molgen-befundbericht-trurisk-panel.md) | Beispiel für molekulargenetischen Befund einer BRCA1 Variante bei Familiärer Belastung für Brust- und Eierstockkrebs. |
| [ NIPBL Variante  ](Observation-mii-exa-molgen-variante-2.md) | Beispiel für genetische Variante im NIPBL Gen an Hand von WGS. |
| [ NIPBL Variante Diagnostische Implikation  ](Observation-mii-exa-molgen-diagnostische-implikation-2.md) | Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS. |
| [ NIPBL Variante Molekulare Konsequenz  ](Observation-mii-exa-molgen-molekulare-konsequenz-2.md) | Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS. |
| [ Ordering Practitioner  ](Practitioner-mii-exa-molgen-practitioner-ordering.md) | Anfordernder Arzt |
| [ Polygener Risiko Score BRCA1 Variante  ](RiskAssessment-mii-exa-molgen-prs-brca1.md) | Beispiel für Polygenen Risiko Score bei Variante BRCA1 |
| [ TSO500 Library Preparation  ](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md) | Library Preparation und Hybrid-Capture-Target-Enrichment mit dem TSO500 Panel |
| [ TSO500 Sequencing on NovaSeq 6000  ](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md) | Paired-end Sequenzierung der TSO500-Library auf Illumina NovaSeq 6000 |
| [ TSO500 v2 Kit Lot 20240518  ](Device-mii-exa-molgen-device-tso500-lot.md) | Konkrete Kit-Charge des TSO500 v2 Panels im Labor, verweist auf den Katalog-Eintrag in der DeviceDefinition |
| [ TruSight Oncology 500 v2 Panel (DeviceDefinition)  ](DeviceDefinition-mii-exa-molgen-devicedef-tso500.md) | Katalogeintrag des TSO500 v2 Capture Panels: 523 Gene für SNV/Indel, 59 Gene für CNV, 23 Gene für DNA-Rearrangements, 55 Gene für RNA-Fusionen und Splice-Varianten; integrierte Biomarker TMB, MSI und HRD; Panelgröße 1,94 Mb |
| [ Variante BRCA1  ](Observation-mii-exa-molgen-variante-brca1.md) | Beispiel für genetische Variante BRCA1 |
| [ Variante FGFR2-DBP Fusion  ](Observation-mii-exa-molgen-variante-fgfr2-fusion.md) | Beispiel für genetische Variante FGFR2-DBP Fusion. |
| [ Variante SMO CNV  ](Observation-mii-exa-molgen-variante-cnv-4.md) | Beispiel für genetische Copy Number Variante SMO Gen. |
| [ WES Bioinformatics Analysis  ](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md) | Bioinformatische Auswertung für Whole Exome Sequencing |
| [ WES Library Preparation Analysis  ](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md) | Library Preparation für Whole Exome Sequencing |
| [ WES Sequencing Analysis  ](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md) | Sequenzierung für Whole Exome Sequencing mit detaillierten Metriken |
| [ mii-exa-befund-bundle-1-braf  ](Bundle-mii-exa-befund-bundle-1-braf.md) |  |
| [ mii-exa-befund-bundle-befund-2-nipbl-clinical  ](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md) |  |
| [ mii-exa-befund-bundle-befund-fgfr2-fusion  ](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md) |  |
| [ mii-exa-befund-bundle-befund-srcc  ](Bundle-mii-exa-befund-bundle-befund-srcc.md) |  |
| [ mii-exa-molgen-anforderung-fgfr2-fusion  ](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-anforderung-srcc  ](ServiceRequest-mii-exa-molgen-anforderung-srcc.md) |  |
| [ mii-exa-molgen-befundbericht-fgfr2-fusion  ](DiagnosticReport-mii-exa-molgen-befundbericht-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-befundbericht-srcc  ](DiagnosticReport-mii-exa-molgen-befundbericht-srcc.md) |  |
| [ mii-exa-molgen-bundle-befund-2-nipbl  ](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md) |  |
| [ mii-exa-molgen-bundle-befund-2-nipbl-condition-lab  ](Condition-mii-exa-molgen-bundle-befund-2-nipbl-condition-lab.md) |  |
| [ mii-exa-molgen-bundle-fam-his-breast-ovar-can  ](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md) |  |
| [ mii-exa-molgen-chargeitem-ebm-21  ](ChargeItem-mii-exa-molgen-chargeitem-ebm-21.md) |  |
| [ mii-exa-molgen-chargeitem-ebm-22  ](ChargeItem-mii-exa-molgen-chargeitem-ebm-22.md) |  |
| [ mii-exa-molgen-chargeitem-ebm-23  ](ChargeItem-mii-exa-molgen-chargeitem-ebm-23.md) |  |
| [ mii-exa-molgen-chargeitem-ebm-24  ](ChargeItem-mii-exa-molgen-chargeitem-ebm-24.md) |  |
| [ mii-exa-molgen-condition-nipbl-clinical  ](Condition-mii-exa-molgen-condition-nipbl-clinical.md) |  |
| [ mii-exa-molgen-device-sequencer  ](Device-mii-exa-molgen-device-sequencer.md) |  |
| [ mii-exa-molgen-device-sequencer-2  ](Device-mii-exa-molgen-device-sequencer-2.md) |  |
| [ mii-exa-molgen-device-sequencer-nextseq  ](Device-mii-exa-molgen-device-sequencer-nextseq.md) |  |
| [ mii-exa-molgen-diagnostische-implikation-fgfr2-fusion  ](Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-diagnostische-implikation-srcc-ctnna1  ](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md) |  |
| [ mii-exa-molgen-family-member-history-1  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md) |  |
| [ mii-exa-molgen-family-member-history-2  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md) |  |
| [ mii-exa-molgen-family-member-history-srcc  ](FamilyMemberHistory-mii-exa-molgen-family-member-history-srcc.md) |  |
| [ mii-exa-molgen-medikationsempfehlung-fgfr2-fusion  ](Task-mii-exa-molgen-medikationsempfehlung-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-patient  ](Patient-mii-exa-molgen-patient.md) |  |
| [ mii-exa-molgen-patient-2  ](Patient-mii-exa-molgen-patient-2.md) |  |
| [ mii-exa-molgen-patient-brca1  ](Patient-mii-exa-molgen-patient-brca1.md) |  |
| [ mii-exa-molgen-patient-fgfr2-fusion  ](Patient-mii-exa-molgen-patient-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-patient-srcc  ](Patient-mii-exa-molgen-patient-srcc.md) |  |
| [ mii-exa-molgen-phenotypic-feature-1  ](Observation-mii-exa-molgen-phenotypic-feature-1.md) |  |
| [ mii-exa-molgen-phenotypic-feature-2  ](Observation-mii-exa-molgen-phenotypic-feature-2.md) |  |
| [ mii-exa-molgen-phenotypic-feature-3  ](Observation-mii-exa-molgen-phenotypic-feature-3.md) |  |
| [ mii-exa-molgen-phenotypic-feature-4  ](Observation-mii-exa-molgen-phenotypic-feature-4.md) |  |
| [ mii-exa-molgen-practitioner-lab  ](Practitioner-mii-exa-molgen-practitioner-lab.md) |  |
| [ mii-exa-molgen-practitioner-physician  ](Practitioner-mii-exa-molgen-practitioner-physician.md) |  |
| [ mii-exa-molgen-specimen-1  ](Specimen-mii-exa-molgen-specimen-1.md) |  |
| [ mii-exa-molgen-specimen-2  ](Specimen-mii-exa-molgen-specimen-2.md) |  |
| [ mii-exa-molgen-specimen-brca1  ](Specimen-mii-exa-molgen-specimen-brca1.md) |  |
| [ mii-exa-molgen-specimen-srcc  ](Specimen-mii-exa-molgen-specimen-srcc.md) |  |
| [ mii-exa-molgen-specimen-srcc-2  ](Specimen-mii-exa-molgen-specimen-srcc-2.md) |  |
| [ mii-exa-molgen-therapeutische-implikation-fgfr2-fusion  ](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md) |  |
| [ mii-exa-molgen-variante-srcc-ctnna1  ](Observation-mii-exa-molgen-variante-srcc-ctnna1.md) |  |

### Sonstige 

Dies sind Ressourcen, die in diesem Implementierungsleitfaden verwendet werden, die in keine der anderen Kategorien passen.

| |
| :--- |
| [ mii-param-molgen-manifest  ](Parameters-mii-param-molgen-manifest.md) |

