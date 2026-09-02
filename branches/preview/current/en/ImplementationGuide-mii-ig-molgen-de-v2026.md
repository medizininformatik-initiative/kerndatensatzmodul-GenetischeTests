# MII ImplementationGuide Resource - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* **MII ImplementationGuide Resource**

## MII ImplementationGuide Resource

This ImplementationGuide resource defines the technical details of this publication, including dependencies and publishing parameters.

* [XML](../ImplementationGuide-mii-ig-molgen-de-v2026.xml)
* [JSON](../ImplementationGuide-mii-ig-molgen-de-v2026.json)

### Cross Version Analysis

This is an R4 IG. None of the features it uses are changed in R4B, so it can be used as is with R4B systems. Packages for both [R4 (de.medizininformatikinitiative.kerndatensatz.molgen.r4)](../package.r4.tgz) and [R4B (de.medizininformatikinitiative.kerndatensatz.molgen.r4b)](../package.r4b.tgz) are available.

### IG Dependencies

This IG contains the following dependencies on other IGs.













> **Where the versions come from.** Every package in the table is pinned directly in [`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/sushi-config.yaml) (`dependencies:`) — including `hl7.terminology.r4` (THO) and `hl7.fhir.uv.extensions.r4`, and those two deliberately so: the IG Publisher's [automatic-packages rule](https://build.fhir.org/ig/FHIR/ig-guidance/versions.html#automatic-packages) consults only this guide's **own** dependency list, so without a direct pin every build would silently inject the latest THO/extensions release — a version pinned by the MII meta package alone cannot control the build (verified in the publisher source at the pinned release). A weekly check warns when these two pins drift from what the pinned meta package ships, and the exact versions a concrete build used are recorded in its `qa-versions.json` output.

### Global Profiles

This IG declares the following global profiles — profiles that apply to every instance of their resource type exchanged under this guide. An empty table means this module declares none.

*There are no Global profiles defined*

### Copyrights

This publication includes IP covered under the following statements.

* BfArM 1994 - 2024 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM)

* [Alpha-ID](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2026.0.1&canonical=http://fhir.de/CodeSystem/bfarm/alpha-id): [MII_PR_MolGen_Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md)


* HL7 Deutschland e.V.

* [Identifier Type De Basis](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.6.0&canonical=http://fhir.de/CodeSystem/identifier-type-de-basis): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 5 more, [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [Patient/mii-exa-molgen-patient](Patient-mii-exa-molgen-patient.md), [Patient/mii-exa-molgen-patient-2](Patient-mii-exa-molgen-patient-2.md) and [Patient/mii-exa-molgen-patient-brca1](Patient-mii-exa-molgen-patient-brca1.md)


* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.1.0/CodeSystem-ISO3166Part1.html): [AgilentSureSelectV7](PlanDefinition-mii-exa-molgen-protocol-agilent-sureselect.md), [MII_CPS_MolGen_CapabilityStatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)... Show 33 more, [MII_EX_MolGen_EmpfohleneMassnahme](StructureDefinition-mii-ex-molgen-empfohlene-massnahme.md), [MII_EX_MolGen_FamiliareLinie](StructureDefinition-mii-ex-molgen-familiare-linie.md), [MII_EX_MolGen_RiskAssessment_Einflussfaktor](StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.md), [MII_EX_MolGen_Verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md), [MII_EX_MolGen_Verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md), [MII_IG_MolGen_DE](index.md), [MII_LM_MolGen_LogicalModel](StructureDefinition-LogicalModelMolGen.md), [MII_PR_MolGen_AnforderungGenetischerTest](StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.md), [MII_PR_MolGen_DiagnostischeImplikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md), [MII_PR_MolGen_EmpfohleneFolgemassnahme](StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.md), [MII_PR_MolGen_Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md), [MII_PR_MolGen_GenomicStudy](StructureDefinition-mii-pr-molgen-genomic-study.md), [MII_PR_MolGen_GenomicStudyAnalysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [MII_PR_MolGen_Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md), [MII_PR_MolGen_Medikationsempfehlung](StructureDefinition-mii-pr-molgen-medikationsempfehlung.md), [MII_PR_MolGen_Mikrosatelliteninstabilitaet](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md), [MII_PR_MolGen_MolekulareKonsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [MII_PR_MolGen_MolekularerBiomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md), [MII_PR_MolGen_MolekulargenetischerBefundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md), [MII_PR_MolGen_Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md), [MII_PR_MolGen_PolygenerRisikoScore](StructureDefinition-mii-pr-molgen-polygener-risiko-score.md), [MII_PR_MolGen_TherapeutischeImplikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md), [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md), [MII_VS_MolGen_FamiliaereLinie](ValueSet-mii-vs-molgen-familiaere-linie.md), [MII_VS_MolGen_FamilyMember_SNOMED](ValueSet-mii-vs-molgen-family-member-snomed.md), [MII_VS_MolGen_Verwandtschaftsgrad](ValueSet-mii-vs-molgen-verwandtschaftsgrad.md), [MII_VS_MolGen_Verwandtsverhaeltnis](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.md), [SP_MII_MolGen_DiagnosticReport_GenomicStudy](SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.md), [SP_MII_MolGen_DiagnosticReport_RecommendedAction](SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.md), [SP_MII_MolGen_GenomicStudyAnalysis_Device](SearchParameter-mii-sp-molgen-genomic-study-analysis-device.md), [SP_MII_MolGen_GenomicStudyAnalysis_MethodType](SearchParameter-mii-sp-molgen-genomic-study-analysis-method.md), [SP_MII_MolGen_GenomicStudyAnalysis_RegionsStudied](SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.md) and [SP_MII_MolGen_GenomicStudyAnalysis_Specimen](SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.md)


* Information that is created by or for the US government are within the public domain. Public domain information on the National Library of Medicine (NLM) Web pages may be freely distributed and copied. However, it is requested that in any subsequent use of this work, NLM be given appropriate acknowledgment.NOTE: This site contains resources which incorporate material contributed or licensed by individuals, companies, or organizations that may be protected by U.S. and foreign copyright laws. These include, but are not limited to PubMed Central (PMC) (see PMC Copyright Notice via [https://www.ncbi.nlm.nih.gov/pmc/about/copyright/)](https://www.ncbi.nlm.nih.gov/pmc/about/copyright/)), Bookshelf (see Bookshelf Copyright Notice via [https://www.ncbi.nlm.nih.gov/books/about/copyright/)](https://www.ncbi.nlm.nih.gov/books/about/copyright/)), OMIM (see OMIM Copyright Status via [https://omim.org/help/copyright)](https://omim.org/help/copyright)), and PubChem. All persons reproducing, redistributing, or making commercial use of this information are expected to adhere to the terms and conditions asserted by the copyright holder. Transmission or reproduction of protected items beyond that allowed by fair use ([https://www.copyright.gov/fls/fl102.html)(PDF)](https://www.copyright.gov/fls/fl102.html)(PDF)) as defined in the copyright laws requires the written permission of the copyright owners.For information on NCBI's policies and disclaimers for use, see here [https://www.ncbi.nlm.nih.gov/home/about/policies/](https://www.ncbi.nlm.nih.gov/home/about/policies/).

* [ClinVar Variant ID](http://terminology.hl7.org/6.1.0/CodeSystem-ClinVarV.html): [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md) and [Observation/mii-exa-molgen-variante-2](Observation-mii-exa-molgen-variante-2.md)


* It is a condition of HGNC funding from NIH and the Welcome Trust that the nomenclature and information provided is freely available to all. Anyone may use the HGNC data, but we request that they reference the **"HUGO Gene Nomenclature Committee at the European Bioinformatics Institute"** and the website where possible.

* [HUGO Gene Nomenclature Committee Genes](http://terminology.hl7.org/6.1.0/CodeSystem-v3-hgnc.html): [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md)
* [HUGO Gene Nomenclature Committee Gene Group](http://terminology.hl7.org/6.1.0/CodeSystem-HGNCGeneGroup.html): [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md)


* The HPO vocabularies, annotation files, tools and documentation are freely available. 
* The HPO is copyrighted to protect the integrity of the vocabularies, which means that changes to the HPO vocabularies need to be done by HPO developers. However, anyone can download the HPO and use the ontologies or other HPO files under three conditions:
 
*  That the Human Phenotype Ontology Consortium is acknowledged and [cited](https://hpo.jax.org/app/citation) properly. 
 
* That any HPO Consortium file(s) displayed publicly include the date(s) and/or version number(s) of the relevant HPO file(s).
 
*  That neither the content of the HPO file(s) nor the logical relationships embedded within the HPO file(s) be altered in any way. (Content additions and modifications have to be suggested using our [issue tracker](https://github.com/obophenotype/human-phenotype-ontology/issues) .) 
 
* Users of the HPO should add the following statement to their online presence. This service/product uses the Human Phenotype Ontology (version information). Find out more at [http://www.human-phenotype-ontology.org](http://www.human-phenotype-ontology.org). We request that the HPO logo be included as well.
 

* [Human Phenotype Ontology](http://terminology.hl7.org/6.1.0/CodeSystem-HPO.html): [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md)... Show 9 more, [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [MII_LM_MolGen_LogicalModel](StructureDefinition-LogicalModelMolGen.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-brca1](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md), [Observation/mii-exa-molgen-phenotypic-feature-1](Observation-mii-exa-molgen-phenotypic-feature-1.md), [Observation/mii-exa-molgen-phenotypic-feature-2](Observation-mii-exa-molgen-phenotypic-feature-2.md), [Observation/mii-exa-molgen-phenotypic-feature-3](Observation-mii-exa-molgen-phenotypic-feature-3.md), [Observation/mii-exa-molgen-phenotypic-feature-4](Observation-mii-exa-molgen-phenotypic-feature-4.md) and [ServiceRequest/mii-exa-molgen-anforderung-2](ServiceRequest-mii-exa-molgen-anforderung-2.md)


* The UCUM codes, UCUM table (regardless of format), and UCUM Specification are copyright 1999-2009, Regenstrief Institute, Inc. and the Unified Codes for Units of Measures (UCUM) Organization. All rights reserved. [https://ucum.org/trac/wiki/TermsOfUse](https://ucum.org/trac/wiki/TermsOfUse)

* [Unified Code for Units of Measure (UCUM)](http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/CodeSystem-v3-ucum.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md)... Show 9 more, [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [Observation/mii-exa-molgen-mutationslast-1](Observation-mii-exa-molgen-mutationslast-1.md), [Observation/mii-exa-molgen-variante-1](Observation-mii-exa-molgen-variante-1.md), [Observation/mii-exa-molgen-variante-brca1](Observation-mii-exa-molgen-variante-brca1.md), [Observation/mii-exa-molgen-variante-cnv-4](Observation-mii-exa-molgen-variante-cnv-4.md), [Observation/mii-exa-molgen-variante-comprehensive-pathogenic](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md) and [Specimen/mii-exa-molgen-specimen-blood-edta](Specimen-mii-exa-molgen-specimen-blood-edta.md)


* This material contains content from [LOINC](http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the [license](http://loinc.org/license). LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

* [LOINC](http://terminology.hl7.org/6.1.0/CodeSystem-v3-loinc.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 62 more, [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md), [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [DiagnosticReport/mii-exa-molgen-befundbericht-1](DiagnosticReport-mii-exa-molgen-befundbericht-1.md), [DiagnosticReport/mii-exa-molgen-befundbericht-2](DiagnosticReport-mii-exa-molgen-befundbericht-2.md), [DiagnosticReport/mii-exa-molgen-befundbericht-comprehensive-wes](DiagnosticReport-mii-exa-molgen-befundbericht-comprehensive-wes.md), [DiagnosticReport/mii-exa-molgen-befundbericht-fgfr2-fusion](DiagnosticReport-mii-exa-molgen-befundbericht-fgfr2-fusion.md), [DiagnosticReport/mii-exa-molgen-befundbericht-srcc](DiagnosticReport-mii-exa-molgen-befundbericht-srcc.md), [DiagnosticReport/mii-exa-molgen-befundbericht-trurisk-panel](DiagnosticReport-mii-exa-molgen-befundbericht-trurisk-panel.md), [DiagnosticReport/mii-exa-molgen-befundbericht-tumorboard-3](DiagnosticReport-mii-exa-molgen-befundbericht-tumorboard-3.md), [MII_PR_MolGen_DiagnostischeImplikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md), [MII_PR_MolGen_Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md), [MII_PR_MolGen_Mikrosatelliteninstabilitaet](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md), [MII_PR_MolGen_MolekulareKonsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [MII_PR_MolGen_MolekularerBiomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md), [MII_PR_MolGen_MolekulargenetischerBefundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md), [MII_PR_MolGen_Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md), [MII_PR_MolGen_TherapeutischeImplikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md), [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-brca1](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md), [Observation/mii-exa-molgen-diagnostische-implikation-cnv-4](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md), [Observation/mii-exa-molgen-diagnostische-implikation-comprehensive](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md), [Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md), [Observation/mii-exa-molgen-genotyp-1](Observation-mii-exa-molgen-genotyp-1.md), [Observation/mii-exa-molgen-genotyp-2](Observation-mii-exa-molgen-genotyp-2.md), [Observation/mii-exa-molgen-genotyp-brca1](Observation-mii-exa-molgen-genotyp-brca1.md), [Observation/mii-exa-molgen-mikrosatelliteninstabilitaet-1](Observation-mii-exa-molgen-mikrosatelliteninstabilitaet-1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-2](Observation-mii-exa-molgen-molekulare-konsequenz-2.md), [Observation/mii-exa-molgen-molekulare-konsequenz-brca1](Observation-mii-exa-molgen-molekulare-konsequenz-brca1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-cnv-4](Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.md), [Observation/mii-exa-molgen-mutationslast-1](Observation-mii-exa-molgen-mutationslast-1.md), [Observation/mii-exa-molgen-phenotypic-feature-1](Observation-mii-exa-molgen-phenotypic-feature-1.md), [Observation/mii-exa-molgen-phenotypic-feature-2](Observation-mii-exa-molgen-phenotypic-feature-2.md), [Observation/mii-exa-molgen-phenotypic-feature-3](Observation-mii-exa-molgen-phenotypic-feature-3.md), [Observation/mii-exa-molgen-phenotypic-feature-4](Observation-mii-exa-molgen-phenotypic-feature-4.md), [Observation/mii-exa-molgen-therapeutische-implikation-1](Observation-mii-exa-molgen-therapeutische-implikation-1.md), [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md), [Observation/mii-exa-molgen-variante-1](Observation-mii-exa-molgen-variante-1.md), [Observation/mii-exa-molgen-variante-2](Observation-mii-exa-molgen-variante-2.md), [Observation/mii-exa-molgen-variante-brca1](Observation-mii-exa-molgen-variante-brca1.md), [Observation/mii-exa-molgen-variante-cnv-4](Observation-mii-exa-molgen-variante-cnv-4.md), [Observation/mii-exa-molgen-variante-comprehensive-pathogenic](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md), [Observation/mii-exa-molgen-variante-fgfr2-fusion](Observation-mii-exa-molgen-variante-fgfr2-fusion.md), [Observation/mii-exa-molgen-variante-srcc-ctnna1](Observation-mii-exa-molgen-variante-srcc-ctnna1.md), [Procedure/mii-exa-molgen-genomic-study-analysis-braf](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md), [Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-analysis-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md), [ServiceRequest/mii-exa-molgen-anforderung-1](ServiceRequest-mii-exa-molgen-anforderung-1.md), [ServiceRequest/mii-exa-molgen-anforderung-2](ServiceRequest-mii-exa-molgen-anforderung-2.md), [ServiceRequest/mii-exa-molgen-anforderung-wes](ServiceRequest-mii-exa-molgen-anforderung-wes.md), [Task/mii-exa-molgen-folgemassnahme-1](Task-mii-exa-molgen-folgemassnahme-1.md), [Task/mii-exa-molgen-folgemassnahme-brca1](Task-mii-exa-molgen-folgemassnahme-brca1.md), [Task/mii-exa-molgen-medikationsempfehlung-1](Task-mii-exa-molgen-medikationsempfehlung-1.md) and [Task/mii-exa-molgen-medikationsempfehlung-fgfr2-fusion](Task-mii-exa-molgen-medikationsempfehlung-fgfr2-fusion.md)


* This material contains content that is copyright of SNOMED International. Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact [https://www.snomed.org/get-snomed](https://www.snomed.org/get-snomed) or [info@snomed.org](mailto:info@snomed.org).

* [SNOMED Clinical Terms&reg; (SNOMED CT&reg;)](http://hl7.org/fhir/R4/codesystem-snomedct.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 42 more, [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md), [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [Condition/mii-exa-molgen-condition-nipbl-clinical](Condition-mii-exa-molgen-condition-nipbl-clinical.md), [Device/mii-exa-molgen-device-illumina-novaseq](Device-mii-exa-molgen-device-illumina-novaseq.md), [DiagnosticReport/mii-exa-molgen-befundbericht-2](DiagnosticReport-mii-exa-molgen-befundbericht-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-1](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-2](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-srcc](FamilyMemberHistory-mii-exa-molgen-family-member-history-srcc.md), [MII_EX_MolGen_FamiliareLinie](StructureDefinition-mii-ex-molgen-familiare-linie.md), [MII_EX_MolGen_Verwandtschaftsgrad](StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.md), [MII_EX_MolGen_Verwandtschaftsverhaeltnis](StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.md), [MII_PR_MolGen_Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md), [MII_VS_MolGen_FamiliaereLinie](ValueSet-mii-vs-molgen-familiaere-linie.md), [MII_VS_MolGen_FamilyMember_SNOMED](ValueSet-mii-vs-molgen-family-member-snomed.md), [MII_VS_MolGen_Verwandtschaftsgrad](ValueSet-mii-vs-molgen-verwandtschaftsgrad.md), [MII_VS_MolGen_Verwandtsverhaeltnis](ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-comprehensive](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md), [Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md), [Observation/mii-exa-molgen-therapeutische-implikation-1](Observation-mii-exa-molgen-therapeutische-implikation-1.md), [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md), [RiskAssessment/mii-exa-molgen-prs-brca1](RiskAssessment-mii-exa-molgen-prs-brca1.md), [ServiceRequest/mii-exa-molgen-anforderung-1](ServiceRequest-mii-exa-molgen-anforderung-1.md), [ServiceRequest/mii-exa-molgen-anforderung-2](ServiceRequest-mii-exa-molgen-anforderung-2.md), [ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md), [ServiceRequest/mii-exa-molgen-anforderung-srcc](ServiceRequest-mii-exa-molgen-anforderung-srcc.md), [ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel](ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.md), [ServiceRequest/mii-exa-molgen-anforderung-wes](ServiceRequest-mii-exa-molgen-anforderung-wes.md), [Specimen/mii-exa-molgen-specimen-1](Specimen-mii-exa-molgen-specimen-1.md), [Specimen/mii-exa-molgen-specimen-2](Specimen-mii-exa-molgen-specimen-2.md), [Specimen/mii-exa-molgen-specimen-blood-edta](Specimen-mii-exa-molgen-specimen-blood-edta.md), [Specimen/mii-exa-molgen-specimen-brca1](Specimen-mii-exa-molgen-specimen-brca1.md), [Specimen/mii-exa-molgen-specimen-dna-library](Specimen-mii-exa-molgen-specimen-dna-library.md), [Specimen/mii-exa-molgen-specimen-ffpe-tumor](Specimen-mii-exa-molgen-specimen-ffpe-tumor.md), [Specimen/mii-exa-molgen-specimen-srcc](Specimen-mii-exa-molgen-specimen-srcc.md) and [Specimen/mii-exa-molgen-specimen-srcc-2](Specimen-mii-exa-molgen-specimen-srcc-2.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [Condition Clinical Status Codes](http://terminology.hl7.org/7.2.0/CodeSystem-condition-clinical.html): [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Condition/mii-exa-molgen-bundle-befund-2-nipbl-condition-lab](Condition-mii-exa-molgen-bundle-befund-2-nipbl-condition-lab.md) and [Condition/mii-exa-molgen-condition-nipbl-clinical](Condition-mii-exa-molgen-condition-nipbl-clinical.md)
* [ConditionVerificationStatus](http://terminology.hl7.org/7.2.0/CodeSystem-condition-ver-status.html): [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Condition/mii-exa-molgen-bundle-befund-2-nipbl-condition-lab](Condition-mii-exa-molgen-bundle-befund-2-nipbl-condition-lab.md) and [Condition/mii-exa-molgen-condition-nipbl-clinical](Condition-mii-exa-molgen-condition-nipbl-clinical.md)
* [Observation Category Codes](http://terminology.hl7.org/7.2.0/CodeSystem-observation-category.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 57 more, [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md), [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [MII_PR_MolGen_DiagnostischeImplikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md), [MII_PR_MolGen_GenomicStudy](StructureDefinition-mii-pr-molgen-genomic-study.md), [MII_PR_MolGen_GenomicStudyAnalysis](StructureDefinition-mii-pr-molgen-genomic-study-analysis.md), [MII_PR_MolGen_Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md), [MII_PR_MolGen_Mikrosatelliteninstabilitaet](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md), [MII_PR_MolGen_MolekulareKonsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [MII_PR_MolGen_MolekularerBiomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md), [MII_PR_MolGen_Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md), [MII_PR_MolGen_TherapeutischeImplikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md), [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md), [Observation/mii-exa-molgen-diagnostische-implikation-1](Observation-mii-exa-molgen-diagnostische-implikation-1.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-brca1](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md), [Observation/mii-exa-molgen-diagnostische-implikation-cnv-4](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md), [Observation/mii-exa-molgen-diagnostische-implikation-comprehensive](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md), [Observation/mii-exa-molgen-diagnostische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.md), [Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md), [Observation/mii-exa-molgen-genotyp-1](Observation-mii-exa-molgen-genotyp-1.md), [Observation/mii-exa-molgen-genotyp-2](Observation-mii-exa-molgen-genotyp-2.md), [Observation/mii-exa-molgen-genotyp-brca1](Observation-mii-exa-molgen-genotyp-brca1.md), [Observation/mii-exa-molgen-mikrosatelliteninstabilitaet-1](Observation-mii-exa-molgen-mikrosatelliteninstabilitaet-1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-1](Observation-mii-exa-molgen-molekulare-konsequenz-1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-2](Observation-mii-exa-molgen-molekulare-konsequenz-2.md), [Observation/mii-exa-molgen-molekulare-konsequenz-brca1](Observation-mii-exa-molgen-molekulare-konsequenz-brca1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-cnv-4](Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.md), [Observation/mii-exa-molgen-mutationslast-1](Observation-mii-exa-molgen-mutationslast-1.md), [Observation/mii-exa-molgen-phenotypic-feature-1](Observation-mii-exa-molgen-phenotypic-feature-1.md), [Observation/mii-exa-molgen-phenotypic-feature-2](Observation-mii-exa-molgen-phenotypic-feature-2.md), [Observation/mii-exa-molgen-phenotypic-feature-3](Observation-mii-exa-molgen-phenotypic-feature-3.md), [Observation/mii-exa-molgen-phenotypic-feature-4](Observation-mii-exa-molgen-phenotypic-feature-4.md), [Observation/mii-exa-molgen-therapeutische-implikation-1](Observation-mii-exa-molgen-therapeutische-implikation-1.md), [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md), [Observation/mii-exa-molgen-variante-1](Observation-mii-exa-molgen-variante-1.md), [Observation/mii-exa-molgen-variante-2](Observation-mii-exa-molgen-variante-2.md), [Observation/mii-exa-molgen-variante-brca1](Observation-mii-exa-molgen-variante-brca1.md), [Observation/mii-exa-molgen-variante-cnv-4](Observation-mii-exa-molgen-variante-cnv-4.md), [Observation/mii-exa-molgen-variante-comprehensive-pathogenic](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md), [Observation/mii-exa-molgen-variante-fgfr2-fusion](Observation-mii-exa-molgen-variante-fgfr2-fusion.md), [Observation/mii-exa-molgen-variante-srcc-ctnna1](Observation-mii-exa-molgen-variante-srcc-ctnna1.md), [Procedure/mii-exa-molgen-genomic-study-1](Procedure-mii-exa-molgen-genomic-study-1.md), [Procedure/mii-exa-molgen-genomic-study-analysis-braf](Procedure-mii-exa-molgen-genomic-study-analysis-braf.md), [Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-analysis-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.md), [Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics](Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep](Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.md), [Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing](Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.md), [Procedure/mii-exa-molgen-genomic-study-comprehensive-wes](Procedure-mii-exa-molgen-genomic-study-comprehensive-wes.md), [Procedure/mii-exa-molgen-genomic-study-cornelia-de-lange](Procedure-mii-exa-molgen-genomic-study-cornelia-de-lange.md), [Procedure/mii-exa-molgen-genomic-study-trurisk-panel](Procedure-mii-exa-molgen-genomic-study-trurisk-panel.md) and [Procedure/mii-exa-molgen-genomic-study-tso500](Procedure-mii-exa-molgen-genomic-study-tso500.md)
* [PlanDefinitionType](http://terminology.hl7.org/7.2.0/CodeSystem-plan-definition-type.html): [AgilentSureSelectV7](PlanDefinition-mii-exa-molgen-protocol-agilent-sureselect.md) and [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md)
* [Risk Probability](http://terminology.hl7.org/7.2.0/CodeSystem-risk-probability.html): [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md) and [RiskAssessment/mii-exa-molgen-prs-brca1](RiskAssessment-mii-exa-molgen-prs-brca1.md)
* [diagnosticServiceSectionId](http://terminology.hl7.org/7.2.0/CodeSystem-v2-0074.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 44 more, [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md), [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-comprehensive-wes](Bundle-mii-exa-molgen-bundle-comprehensive-wes.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [DiagnosticReport/mii-exa-molgen-befundbericht-1](DiagnosticReport-mii-exa-molgen-befundbericht-1.md), [DiagnosticReport/mii-exa-molgen-befundbericht-2](DiagnosticReport-mii-exa-molgen-befundbericht-2.md), [DiagnosticReport/mii-exa-molgen-befundbericht-comprehensive-wes](DiagnosticReport-mii-exa-molgen-befundbericht-comprehensive-wes.md), [DiagnosticReport/mii-exa-molgen-befundbericht-fgfr2-fusion](DiagnosticReport-mii-exa-molgen-befundbericht-fgfr2-fusion.md), [DiagnosticReport/mii-exa-molgen-befundbericht-srcc](DiagnosticReport-mii-exa-molgen-befundbericht-srcc.md), [DiagnosticReport/mii-exa-molgen-befundbericht-trurisk-panel](DiagnosticReport-mii-exa-molgen-befundbericht-trurisk-panel.md), [DiagnosticReport/mii-exa-molgen-befundbericht-tumorboard-3](DiagnosticReport-mii-exa-molgen-befundbericht-tumorboard-3.md), [MII_PR_MolGen_DiagnostischeImplikation](StructureDefinition-mii-pr-molgen-diagnostische-implikation.md), [MII_PR_MolGen_Genotyp](StructureDefinition-mii-pr-molgen-genotyp.md), [MII_PR_MolGen_Mikrosatelliteninstabilitaet](StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.md), [MII_PR_MolGen_MolekulareKonsequenz](StructureDefinition-mii-pr-molgen-molekulare-konsequenz.md), [MII_PR_MolGen_MolekularerBiomarker](StructureDefinition-mii-pr-molgen-molekularer-biomarker.md), [MII_PR_MolGen_MolekulargenetischerBefundbericht](StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.md), [MII_PR_MolGen_Mutationslast](StructureDefinition-mii-pr-molgen-mutationslast.md), [MII_PR_MolGen_TherapeutischeImplikation](StructureDefinition-mii-pr-molgen-therapeutische-implikation.md), [MII_PR_MolGen_Variante](StructureDefinition-mii-pr-molgen-variante.md), [Observation/mii-exa-molgen-diagnostische-implikation-1](Observation-mii-exa-molgen-diagnostische-implikation-1.md), [Observation/mii-exa-molgen-diagnostische-implikation-2](Observation-mii-exa-molgen-diagnostische-implikation-2.md), [Observation/mii-exa-molgen-diagnostische-implikation-brca1](Observation-mii-exa-molgen-diagnostische-implikation-brca1.md), [Observation/mii-exa-molgen-diagnostische-implikation-cnv-4](Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.md), [Observation/mii-exa-molgen-diagnostische-implikation-comprehensive](Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.md), [Observation/mii-exa-molgen-diagnostische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.md), [Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1](Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.md), [Observation/mii-exa-molgen-genotyp-1](Observation-mii-exa-molgen-genotyp-1.md), [Observation/mii-exa-molgen-genotyp-2](Observation-mii-exa-molgen-genotyp-2.md), [Observation/mii-exa-molgen-genotyp-brca1](Observation-mii-exa-molgen-genotyp-brca1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-1](Observation-mii-exa-molgen-molekulare-konsequenz-1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-2](Observation-mii-exa-molgen-molekulare-konsequenz-2.md), [Observation/mii-exa-molgen-molekulare-konsequenz-brca1](Observation-mii-exa-molgen-molekulare-konsequenz-brca1.md), [Observation/mii-exa-molgen-molekulare-konsequenz-cnv-4](Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.md), [Observation/mii-exa-molgen-therapeutische-implikation-1](Observation-mii-exa-molgen-therapeutische-implikation-1.md), [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md), [Observation/mii-exa-molgen-variante-1](Observation-mii-exa-molgen-variante-1.md), [Observation/mii-exa-molgen-variante-2](Observation-mii-exa-molgen-variante-2.md), [Observation/mii-exa-molgen-variante-brca1](Observation-mii-exa-molgen-variante-brca1.md), [Observation/mii-exa-molgen-variante-cnv-4](Observation-mii-exa-molgen-variante-cnv-4.md), [Observation/mii-exa-molgen-variante-comprehensive-pathogenic](Observation-mii-exa-molgen-variante-comprehensive-pathogenic.md), [Observation/mii-exa-molgen-variante-fgfr2-fusion](Observation-mii-exa-molgen-variante-fgfr2-fusion.md) and [Observation/mii-exa-molgen-variante-srcc-ctnna1](Observation-mii-exa-molgen-variante-srcc-ctnna1.md)
* [identifierType](http://terminology.hl7.org/7.2.0/CodeSystem-v2-0203.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md)... Show 5 more, [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can](Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.md), [Patient/mii-exa-molgen-patient](Patient-mii-exa-molgen-patient.md), [Patient/mii-exa-molgen-patient-2](Patient-mii-exa-molgen-patient-2.md) and [Patient/mii-exa-molgen-patient-brca1](Patient-mii-exa-molgen-patient-brca1.md)
* [ObservationValue](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ObservationValue.html): [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md), [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Patient/mii-exa-molgen-patient-fgfr2-fusion](Patient-mii-exa-molgen-patient-fgfr2-fusion.md) and [Patient/mii-exa-molgen-patient-srcc](Patient-mii-exa-molgen-patient-srcc.md)
* [RoleCode](http://terminology.hl7.org/7.2.0/CodeSystem-v3-RoleCode.html): [Bundle/mii-exa-befund-bundle-1-braf](Bundle-mii-exa-befund-bundle-1-braf.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-1](FamilyMemberHistory-mii-exa-molgen-family-member-history-1.md)... Show 6 more, [FamilyMemberHistory/mii-exa-molgen-family-member-history-2](FamilyMemberHistory-mii-exa-molgen-family-member-history-2.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-srcc](FamilyMemberHistory-mii-exa-molgen-family-member-history-srcc.md) and [MII_PR_MolGen_Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md)


* WHO, BfArM 1994 - 2024 - Die Erstellung erfolgt unter Verwendung der maschinenlesbaren Fassung des Bundesinstituts für Arzneimittel und Medizinprodukte (BfArM)

* [ICD-10-GM](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.biobank@2026.0.1&canonical=http://fhir.de/CodeSystem/bfarm/icd-10-gm): [Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical](Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.md), [Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion](Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.md)... Show 11 more, [Bundle/mii-exa-befund-bundle-befund-srcc](Bundle-mii-exa-befund-bundle-befund-srcc.md), [Bundle/mii-exa-molgen-bundle-befund-2-nipbl](Bundle-mii-exa-molgen-bundle-befund-2-nipbl.md), [Condition/mii-exa-molgen-bundle-befund-2-nipbl-condition-lab](Condition-mii-exa-molgen-bundle-befund-2-nipbl-condition-lab.md), [Condition/mii-exa-molgen-condition-nipbl-clinical](Condition-mii-exa-molgen-condition-nipbl-clinical.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes](FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-mi](FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.md), [FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal](FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.md), [MII_PR_MolGen_Familienanamnese](StructureDefinition-mii-pr-molgen-familienanamnese.md), [Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion](Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.md), [ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion](ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.md) and [ServiceRequest/mii-exa-molgen-anforderung-srcc](ServiceRequest-mii-exa-molgen-anforderung-srcc.md)


### IG Parameter Settings and Expansion Parameters

Expansion parameters are query parameters that can be passed to a `ValueSet` `$expand` operation to control how the ValueSet is expanded — that is, how the full list of codes is generated from the ValueSet definition. The [IG Parameters](https://hl7.org/fhir/tools/en/CodeSystem-ig-parameters.html) used for this IG are declared in [`sushi-config.yaml`](https://github.com/medizininformatik-initiative/kerndatensatzmodul-GenetischeTests/blob/main/sushi-config.yaml) (`parameters:`). A module that pins its expansion parameters through a CRMI manifest additionally links the generated `Parameters` resource from here (see the commented manifest blocks in `sushi-config.yaml` and the Metadata Overview page, if the module keeps it).



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "mii-ig-molgen-de-v2026",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableimplementationguide",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableimplementationguide",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-implementationguide"]
  },
  "language" : "en",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-01-02"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "extension" : [{
      "url" : "packageId",
      "valueId" : "de.medizininformatikinitiative.kerndatensatz.molgen"
    },
    {
      "url" : "version",
      "valueString" : "2026.0.4"
    },
    {
      "url" : "uri",
      "valueUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen"
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2026"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Taskforce Core Data Set"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Interoperability Working Group",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/interoperability-working-group"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "National Steering Committee",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.medizininformatik-initiative.de/en/collaboration/national-steering-committee"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-expansionParameters",
    "valueReference" : {
      "reference" : "Parameters/mii-param-molgen-manifest"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver"
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this ImplementationGuide resource as a computable definition of all the parts of the corresponding module of the Medical Informatics Initiative core data set."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-purpose",
    "valueMarkdown" : "Provide the computable publication unit for the MII Core Dataset Molecular Genetics Report module, enabling implementers to discover, validate, version, and apply the specification consistently."
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C17457"
      }]
    }
  }],
  "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/ImplementationGuide/mii-ig-molgen-de-v2026",
  "version" : "2026.0.4",
  "name" : "MII_IG_MolGen_DE",
  "title" : "MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "MII Implementierungsleitfaden Kerndatensatz-Modul Molekulargenetischer Befundbericht"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : false,
  "date" : "2026-01-02",
  "publisher" : "Medizininformatik-Initiative",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "de"
      },
      {
        "url" : "content",
        "valueString" : "Medizininformatik-Initiative"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Medizininformatik-Initiative",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.medizininformatik-initiative.de/"
    },
    {
      "system" : "email",
      "value" : "info@medizininformatik-initiative.de"
    }]
  }],
  "description" : "FHIR profiles for molecular genetic findings - variants, molecular consequences, diagnostic and therapeutic implications, molecular biomarkers and the genomic study that produced them - as part of the MII core data set.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "packageId" : "de.medizininformatikinitiative.kerndatensatz.molgen",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7_fhir_uv_genomics_reporting",
    "uri" : "http://hl7.org/fhir/uv/genomics-reporting/ImplementationGuide/hl7.fhir.uv.genomics-reporting",
    "packageId" : "hl7.fhir.uv.genomics-reporting",
    "version" : "3.0.0"
  },
  {
    "id" : "de_medizininformatikinitiative_kerndatensatz_meta",
    "uri" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/ImplementationGuide/mii-ig-meta",
    "packageId" : "de.medizininformatikinitiative.kerndatensatz.meta",
    "version" : "2027.0.0-ballot.rc3"
  },
  {
    "id" : "de_basisprofil_r4",
    "uri" : "http://fhir.org/packages/de.basisprofil.r4/ImplementationGuide/de.basisprofil.r4",
    "packageId" : "de.basisprofil.r4",
    "version" : "1.6.0"
  },
  {
    "id" : "de_medizininformatikinitiative_kerndatensatz_base",
    "uri" : "https://www.medizininformatik-initiative.de/fhir/modul-base/ImplementationGuide/mii-ig-base",
    "packageId" : "de.medizininformatikinitiative.kerndatensatz.base",
    "version" : "2027.0.0-ballot.rc1"
  },
  {
    "id" : "de_medizininformatikinitiative_kerndatensatz_biobank",
    "uri" : "http://fhir.org/packages/de.medizininformatikinitiative.kerndatensatz.biobank/ImplementationGuide/de.medizininformatikinitiative.kerndatensatz.biobank",
    "packageId" : "de.medizininformatikinitiative.kerndatensatz.biobank",
    "version" : "2026.0.1"
  },
  {
    "id" : "hl7_terminology_r4",
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "6.1.0"
  },
  {
    "id" : "hl7_fhir_uv_crmi",
    "uri" : "http://hl7.org/fhir/uv/crmi/ImplementationGuide/hl7.fhir.uv.crmi",
    "packageId" : "hl7.fhir.uv.crmi",
    "version" : "2.0.0"
  },
  {
    "id" : "hl7_fhir_uv_extensions_r4",
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2021+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-lang"
      },
      {
        "url" : "value",
        "valueString" : "de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "translation-sources"
      },
      {
        "url" : "value",
        "valueString" : "input/translations/de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludexml"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludejson"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludemap"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "init"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "progress"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "context"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "tx"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "pin-canonicals"
      },
      {
        "url" : "value",
        "valueString" : "pin-all"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../input/resources/Parameters-expansion-manifest.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "pin-manifest"
      },
      {
        "url" : "value",
        "valueString" : "mii-param-molgen-manifest"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "suppress-mappings"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/v3"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "suppress-mappings"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/v3/cda"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-MethodType"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "wantGen-ttl"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "wantGen-ttl-html"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/expansion-parameters",
      "valueReference" : {
        "reference" : "Parameters/expansion-parameters"
      }
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2021+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-lang"
      },
      {
        "url" : "value",
        "valueString" : "de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "translation-sources"
      },
      {
        "url" : "value",
        "valueString" : "input/translations/de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludexml"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludejson"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludemap"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "init"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "progress"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "context"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "logging"
      },
      {
        "url" : "value",
        "valueString" : "tx"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "pin-canonicals"
      },
      {
        "url" : "value",
        "valueString" : "pin-all"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../input/resources/Parameters-expansion-manifest.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "pin-manifest"
      },
      {
        "url" : "value",
        "valueString" : "mii-param-molgen-manifest"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "suppress-mappings"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/v3"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "suppress-mappings"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/v3/cda"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-GenomicStudy"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/DiagnosticReport-RecommendedAction"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Device"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-MethodType"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-RegionsStudied"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/SearchParameter/GenomicStudyAnalysis-Specimen"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-massnahme"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/risk-assessment-einflussfaktor"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "special-url"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "wantGen-ttl"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "wantGen-ttl-html"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "PlanDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "PlanDefinition-mii-exa-molgen-protocol-agilent-sureselect.html"
      }],
      "reference" : {
        "reference" : "PlanDefinition/mii-exa-molgen-protocol-agilent-sureselect"
      },
      "name" : "Agilent SureSelect Human All Exon V7 Protocol",
      "description" : "Protokoll für Exom-Anreicherung",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-1.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-1"
      },
      "name" : "Anforderung BRAF Genetische Testung",
      "description" : "Beispiel für Anforderung für genetische Testung auf genetische Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-2.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-2"
      },
      "name" : "Anforderung Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom",
      "description" : "Beispiel für Anforderung für genetische Testung auf pathogene Variante im NIPBL Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-trurisk-panel.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-trurisk-panel"
      },
      "name" : "Anforderung Molekulargenetische Diagnose Familiäre Belastung für Brust- und Eierstockkrebs",
      "description" : "Beispiel für Anforderung für genetische Testung bei Familiärer Belastung für Brust- und Eierstockkrebs.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-wes.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-wes"
      },
      "name" : "Anforderung Whole Exome Sequencing",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-mii-exa-molgen-documentreference-bed-file.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/mii-exa-molgen-documentreference-bed-file"
      },
      "name" : "BED File for Target Regions",
      "description" : "BED-Datei mit den Zielregionen des Exom-Kits",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-mutationslast-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-mutationslast-1"
      },
      "name" : "Beispiel Mutationslast in Tumorprobe",
      "description" : "Beispiel für Mutationslast in Tumorprobe.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mutationslast"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-mii-exa-molgen-folgemassnahme-1.html"
      }],
      "reference" : {
        "reference" : "Task/mii-exa-molgen-folgemassnahme-1"
      },
      "name" : "BRAF Empfohlene Folgemaßnahme",
      "description" : "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-1"
      },
      "name" : "BRAF Variante",
      "description" : "Beispiel für genetische Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-1"
      },
      "name" : "BRAF Variante Diagnostische Implikation",
      "description" : "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-mii-exa-molgen-medikationsempfehlung-1.html"
      }],
      "reference" : {
        "reference" : "Task/mii-exa-molgen-medikationsempfehlung-1"
      },
      "name" : "BRAF Variante Medikationsempfehlung",
      "description" : "Beispiel für Medikationsempfehlung abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-molekulare-konsequenz-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-molekulare-konsequenz-1"
      },
      "name" : "BRAF Variante Molekulare Konsequenz",
      "description" : "Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-therapeutische-implikation-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-1"
      },
      "name" : "BRAF Variante Therapeutische Implikation",
      "description" : "Beispiel für therapeutische Implikation abgeleitet von genetische Variante im BRAF Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-cnv-4.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-cnv-4"
      },
      "name" : "CNV SMO Diagnostische Implikation",
      "description" : "Beispiel für diagnostische Implikation abgeleitet von Copy Number Variante im SMO Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-molekulare-konsequenz-cnv-4.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-molekulare-konsequenz-cnv-4"
      },
      "name" : "CNV SMO Molekulare Konsequenz",
      "description" : "Beispiel für molekulare Konsequenz abgeleitet von Copy Number Variante im SMO Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-molgen-bundle-comprehensive-wes.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-molgen-bundle-comprehensive-wes"
      },
      "name" : "Comprehensive WES Bundle with Full Technical Documentation",
      "description" : "Transaktions-Bundle für eine vollständige Whole Exome Sequencing Analyse mit detaillierten technischen Angaben zu Geräten, Kits, Metriken und Bioinformatik-Pipeline. Dieses Beispiel zeigt die erweiterten Dokumentationsmöglichkeiten für Forschungsprojekte.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-comprehensive-wes.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-comprehensive-wes"
      },
      "name" : "Comprehensive WES Report with Full Technical Documentation",
      "description" : "Beispiel für einen vollständigen WES-Bericht mit detaillierten technischen Angaben",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-comprehensive-wes.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-comprehensive-wes"
      },
      "name" : "Comprehensive Whole Exome Sequencing Study",
      "description" : "Vollständiges Exom-Sequenzierung Beispiel mit detaillierten technischen Angaben",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Media"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Media-mii-exa-molgen-media-coverage-plot.html"
      }],
      "reference" : {
        "reference" : "Media/mii-exa-molgen-media-coverage-plot"
      },
      "name" : "Coverage Plot",
      "description" : "Graphical representation of sequencing coverage",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-comprehensive.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-comprehensive"
      },
      "name" : "Diagnostic Implication for KMT2A Variant",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-brca1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-brca1"
      },
      "name" : "Diagnostische Implikation BRCA1 Variante",
      "description" : "Beispiel für diagnostische Implikation abgeleitet von SNP im BRCA1.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-dna-library.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-dna-library"
      },
      "name" : "DNA Library",
      "description" : "Prepared DNA library for sequencing",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-blood-edta.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-blood-edta"
      },
      "name" : "EDTA Blood Sample",
      "description" : "EDTA-Blutprobe für DNA-Extraktion",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-mii-exa-molgen-folgemassnahme-brca1.html"
      }],
      "reference" : {
        "reference" : "Task/mii-exa-molgen-folgemassnahme-brca1"
      },
      "name" : "Empfohlene Folgemaßnahme bei BRCA1 Variante",
      "description" : "Beispiel für empfohlene Folgemaßnahme abgeleitet von genetischer Variante im BRCA1 Gen an Hand von NGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/empfohlene-folgemassnahme"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-diabetes.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-diabetes"
      },
      "name" : "Family History - Father with Type 2 Diabetes",
      "description" : "Example of family member history documenting father's Type 2 diabetes mellitus (ICD-10: E11.9)",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-mi.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-mi"
      },
      "name" : "Family History - Mother with Myocardial Infarction",
      "description" : "Example of family member history documenting mother's ST-elevation myocardial infarction (ICD-10: I21.2)",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-retinal.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-retinal"
      },
      "name" : "Family History - Sister with Retinal Disorder",
      "description" : "Example of family member history documenting sister's retinal disorder (ICD-10: H35.8)",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DocumentReference"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DocumentReference-mii-exa-molgen-documentreference-fastq.html"
      }],
      "reference" : {
        "reference" : "DocumentReference/mii-exa-molgen-documentreference-fastq"
      },
      "name" : "FASTQ Sequencing Files",
      "description" : "Raw sequencing data files",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-ffpe-tumor.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-ffpe-tumor"
      },
      "name" : "FFPE-Tumorgewebe (NSCLC) fuer TSO500",
      "description" : "Formalinfixiertes, in Paraffin eingebettetes Tumorgewebe aus der Lunge, Ausgangsmaterial der TSO500-v2-Analyse bei nicht-kleinzelligem Lungenkarzinom",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-braf.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-braf"
      },
      "name" : "Genomic Study Analysis BRAF",
      "description" : "Analyse der BRAF Region mittels NGS",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-cornelia-de-lange.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-cornelia-de-lange"
      },
      "name" : "Genomic Study Analysis Cornelia de Lange Panel",
      "description" : "NGS-Analyse des Cornelia de Lange-Syndrom Panels",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-trurisk-panel.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-trurisk-panel"
      },
      "name" : "Genomic Study Analysis TruRisk Panel v3",
      "description" : "NGS-Analyse des TruRisk Panel v3 für erblichen Brust- und Eierstockkrebs",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-cornelia-de-lange.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-cornelia-de-lange"
      },
      "name" : "Genomic Study Cornelia de Lange Panel",
      "description" : "Genomische Studie für Cornelia de Lange-Syndrom Panel",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-trurisk-panel.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-trurisk-panel"
      },
      "name" : "Genomic Study TruRisk Panel v3",
      "description" : "Genomische Studie für TruRisk Panel v3",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-tso500.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-tso500"
      },
      "name" : "Genomic Study TSO500 NSCLC",
      "description" : "Komprehensives Tumor-Profiling mit TSO500 bei nicht-kleinzelligem Lungenkarzinom (NSCLC)",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-genotyp-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-genotyp-1"
      },
      "name" : "Genotyp BRAF",
      "description" : "Beispiel für Genotyp BRAF Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-genotyp-brca1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-genotyp-brca1"
      },
      "name" : "Genotyp BRCA1",
      "description" : "Beispiel für Genotyp BRCA1 Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-genotyp-2.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-genotyp-2"
      },
      "name" : "Genotyp NIPBL",
      "description" : "Beispiel für Genotyp NIPBL Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/genotyp"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-illumina-novaseq.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-illumina-novaseq"
      },
      "name" : "Illumina NovaSeq 6000 Sequencer",
      "description" : "Beispiel für Sequenziergerät",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-thermofisher-ionchef.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-thermofisher-ionchef"
      },
      "name" : "Ion Chef System",
      "description" : "Library Preparation System",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-comprehensive-pathogenic.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-comprehensive-pathogenic"
      },
      "name" : "KMT2A Pathogenic Variant from WES",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-mii-cps-molgen-capabilitystatement.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/mii-cps-molgen-capabilitystatement"
      },
      "name" : "MII CPS MolGen CapabilityStatement",
      "description" : "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein konformes System unterstützen muss, um das Modul MolGen der Medizininformatik-Initiative zu implementieren.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-molgen-verwandtschaftsgrad.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-molgen-verwandtschaftsgrad"
      },
      "name" : "MII EX Mol Gen Verwandtschaftsgrad",
      "description" : "Extension erlaubt die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-molgen-empfohlene-massnahme.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-molgen-empfohlene-massnahme"
      },
      "name" : "MII EX MolGen Empfohlene Maßnahme",
      "description" : "Die Extension verweist auf eine vorgeschlagene Maßnahme, die auf der Grundlage der Ergebnisse des Befundberichts empfohlen wird.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-molgen-familiare-linie.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-molgen-familiare-linie"
      },
      "name" : "MII EX MolGen Familiare Linie",
      "description" : "Extension erlaubt die Angabe der familiären Linie zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-molgen-risk-assessment-einflussfaktor.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-molgen-risk-assessment-einflussfaktor"
      },
      "name" : "MII EX MolGen RiskAssessment Einflussfaktor",
      "description" : "Die Extension erweitert RiskAssessment.prediction um die Möglichkeit, weitere ausschlaggebende Faktoren mit Einfluss auf die Risikoberechnung anzugeben.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-ex-molgen-verwandtschaftsverhaeltnis.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-ex-molgen-verwandtschaftsverhaeltnis"
      },
      "name" : "MII EX MolGen Verwandtschaftsverhaeltnis",
      "description" : "Extension erlaubt die Angabe eines Verwandtschaftsverhältnisses zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-LogicalModelMolGen.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/LogicalModelMolGen"
      },
      "name" : "MII LM MolGen LogicalModel",
      "description" : "LogicalModel des MII Moduls Molekulargenetischer Befundbericht",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-anforderung-genetischer-test.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-anforderung-genetischer-test"
      },
      "name" : "MII PR MolGen Anforderung genetischer Test",
      "description" : "Der Laborauftrag oder die Anfrage, die die Durchführung des genetischen Tests auslöst.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-diagnostische-implikation.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-diagnostische-implikation"
      },
      "name" : "MII PR MolGen Diagnostische Implikation",
      "description" : "Dieses Profil beschreibt den Zusammenhang zwischen einem oder mehreren Genotyp/Haplotyp/Varianten und Beweisen für oder gegen eine bestimmte Krankheit.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-empfohlene-folgemassnahme.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-empfohlene-folgemassnahme"
      },
      "name" : "MII PR MolGen Empfohlene Folgemaßnahme",
      "description" : "Das Profil dieser Task Ressource beschreibt die empfohlenen Folgemaßnahmen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-familienanamnese.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-familienanamnese"
      },
      "name" : "MII PR MolGen Familienanamnese",
      "description" : "Dieses Profil beschreibt die Familienanamnese eines Patienten im Kontext von genetischen Analysen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-genomic-study.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-genomic-study"
      },
      "name" : "MII PR MolGen Genomic Study",
      "description" : "Genomic Study ist ein Profil, dass die Durchführung von übergeorndenten molekulargenetischen Untersuchungen (Studies) beschreibt. Einzelne Assays werden dann als GenomicStudyAnalysis abgebildet. Es ist vom GenomicStudy-Profils aus dem Genomics Reporting IG abgeleitet .",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-genomic-study-analysis.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-genomic-study-analysis"
      },
      "name" : "MII PR MolGen Genomic Study Analysis",
      "description" : "Genomic Study Analysis ist ein Profil, das die Durchführung von konkreten molekulargenetischen Methoden und Assays beschreibt. Es ist vom GenomicStudyAnalysis-Profil aus dem Genomics Reporting IG abgeleitet. Die Darstellung über GenomicStudyAnalysis ist präziser als die vorherige UntersuchteRegion, da sie eine klare Repräsentation ermöglicht, welche Regionen mit welchem Assay untersucht wurden und welche Bereiche callable bzw. nicht-callable waren. Dies ermöglicht eine genauere Qualitätsbewertung und Interpretation der Ergebnisse, insbesondere bei negativen Befunden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-genotyp.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-genotyp"
      },
      "name" : "MII PR MolGen Genotyp",
      "description" : "Dieses Profil beschreibt die Feststellung eines bestimmten Genotyps auf der Grundlage einer oder mehrerer Varianten oder Haplotypen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-medikationsempfehlung.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-medikationsempfehlung"
      },
      "name" : "MII PR MolGen Medikationsempfehlung",
      "description" : "Das Profil dieser Task Ressource dient dazu, auf der Grundlage der genetischen Ergebnisse medikamanetöse Maßnahmen vorzuschlagen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-mikrosatelliteninstabilitaet.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-mikrosatelliteninstabilitaet"
      },
      "name" : "MII PR MolGen Mikrosatelliteninstabilität",
      "description" : "Mikrosatelliteninstabilität (MSI) ist ein Zustand genetischer Hypermutabilität (Neigung zu Mutationen), der aus einer gestörten DNA-Mismatch-Reparatur (MMR) resultiert. Das Profil basiert auf dem CG STU3 MolecularBiomarker-Profil",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-molekularer-biomarker.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-molekularer-biomarker"
      },
      "name" : "MII PR MolGen Molekulare Biomarker",
      "description" : "Dieses Profil beschreibt molekulare Biomarker, z.B. genübergreifende Biomarker wie Tumormutationslast (TMB) oder Mikrosatelliteninstabilität (MSI). Es ist ein abstraktes Profil, konkrete Biomarker-Profile erben davon.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-molekulare-konsequenz.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-molekulare-konsequenz"
      },
      "name" : "MII PR MolGen Molekulare Konsequenz",
      "description" : "Dieses Profil beschreibt den Zusammenhang von bestimmten Varianten, Haplotypen oder Genotypen und bestimmten Konsequenzen auf molekularer Ebene.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-molekulargenetischer-befundbericht.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-molekulargenetischer-befundbericht"
      },
      "name" : "MII PR MolGen Molekulargenetischer Befundbericht",
      "description" : "Der DiagnosticReport ist zentraler Bestandteil aller genetischen Befundberichte und enthält Metadaten über den gesamten Bericht sowie alle relevanten Informationen, die im Rahmen der molekulargenetischen Analyse gefunden wurden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-mutationslast.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-mutationslast"
      },
      "name" : "MII PR MolGen Mutationslast",
      "description" : "Dieses Profil beschreibt die Gesamtzahl der in der DNA von Krebszellen gefundenen Mutationen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-polygener-risiko-score.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-polygener-risiko-score"
      },
      "name" : "MII PR MolGen Polygener Risiko Score",
      "description" : "Profil für Polygenen Risiko Score",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-therapeutische-implikation.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-therapeutische-implikation"
      },
      "name" : "MII PR MolGen Therapeutische Implikation",
      "description" : "Dieses Profil beschreibt den möglichen Einfluss genetischer Merkmale auf eine medikamentöse oder nicht-medikamentöse Therapie.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-mii-pr-molgen-variante.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/mii-pr-molgen-variante"
      },
      "name" : "MII PR MolGen Variante",
      "description" : "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-mii-vs-molgen-verwandtschaftsgrad.html"
      }],
      "reference" : {
        "reference" : "ValueSet/mii-vs-molgen-verwandtschaftsgrad"
      },
      "name" : "MII VS Mol Gen Verwandtschaftsgrad",
      "description" : "ValueSet für die Angabe eines Verwandtschaftsgrades zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-mii-vs-molgen-familiaere-linie.html"
      }],
      "reference" : {
        "reference" : "ValueSet/mii-vs-molgen-familiaere-linie"
      },
      "name" : "MII VS MolGen Familiäre Linie",
      "description" : "ValueSet für die Angabe der familären Linie zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-mii-vs-molgen-family-member-snomed.html"
      }],
      "reference" : {
        "reference" : "ValueSet/mii-vs-molgen-family-member-snomed"
      },
      "name" : "MII VS MolGen Family Member SNOMED",
      "description" : "The ValueSet contains codes for related family member types from SNOMED CT.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-mii-vs-molgen-verwandtschaftsverhaeltnis.html"
      }],
      "reference" : {
        "reference" : "ValueSet/mii-vs-molgen-verwandtschaftsverhaeltnis"
      },
      "name" : "MII VS MolGen Verwandtschaftsverhaeltnis",
      "description" : "ValueSet für die Angabe eines Verwandtschaftsverhältnis zwischen Patient und Familienangehörigen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-befund-bundle-1-braf.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-befund-bundle-1-braf"
      },
      "name" : "mii-exa-befund-bundle-1-braf",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-befund-bundle-befund-2-nipbl-clinical.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-befund-bundle-befund-2-nipbl-clinical"
      },
      "name" : "mii-exa-befund-bundle-befund-2-nipbl-clinical",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-befund-bundle-befund-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-befund-bundle-befund-fgfr2-fusion"
      },
      "name" : "mii-exa-befund-bundle-befund-fgfr2-fusion",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-befund-bundle-befund-srcc.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-befund-bundle-befund-srcc"
      },
      "name" : "mii-exa-befund-bundle-befund-srcc",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-anforderung-fgfr2-fusion",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-mii-exa-molgen-anforderung-srcc.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/mii-exa-molgen-anforderung-srcc"
      },
      "name" : "mii-exa-molgen-anforderung-srcc",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-befundbericht-fgfr2-fusion",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-srcc.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-srcc"
      },
      "name" : "mii-exa-molgen-befundbericht-srcc",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-molgen-bundle-befund-2-nipbl.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-molgen-bundle-befund-2-nipbl"
      },
      "name" : "mii-exa-molgen-bundle-befund-2-nipbl",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Condition-mii-exa-molgen-bundle-befund-2-nipbl-condition-lab.html"
      }],
      "reference" : {
        "reference" : "Condition/mii-exa-molgen-bundle-befund-2-nipbl-condition-lab"
      },
      "name" : "mii-exa-molgen-bundle-befund-2-nipbl-condition-lab",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Bundle-mii-exa-molgen-bundle-fam-his-breast-ovar-can.html"
      }],
      "reference" : {
        "reference" : "Bundle/mii-exa-molgen-bundle-fam-his-breast-ovar-can"
      },
      "name" : "mii-exa-molgen-bundle-fam-his-breast-ovar-can",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ChargeItem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ChargeItem-mii-exa-molgen-chargeitem-ebm-21.html"
      }],
      "reference" : {
        "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-21"
      },
      "name" : "mii-exa-molgen-chargeitem-ebm-21",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ChargeItem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ChargeItem-mii-exa-molgen-chargeitem-ebm-22.html"
      }],
      "reference" : {
        "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-22"
      },
      "name" : "mii-exa-molgen-chargeitem-ebm-22",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ChargeItem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ChargeItem-mii-exa-molgen-chargeitem-ebm-23.html"
      }],
      "reference" : {
        "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-23"
      },
      "name" : "mii-exa-molgen-chargeitem-ebm-23",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ChargeItem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ChargeItem-mii-exa-molgen-chargeitem-ebm-24.html"
      }],
      "reference" : {
        "reference" : "ChargeItem/mii-exa-molgen-chargeitem-ebm-24"
      },
      "name" : "mii-exa-molgen-chargeitem-ebm-24",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Condition-mii-exa-molgen-condition-nipbl-clinical.html"
      }],
      "reference" : {
        "reference" : "Condition/mii-exa-molgen-condition-nipbl-clinical"
      },
      "name" : "mii-exa-molgen-condition-nipbl-clinical",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-sequencer.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer"
      },
      "name" : "mii-exa-molgen-device-sequencer",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-sequencer-2.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer-2"
      },
      "name" : "mii-exa-molgen-device-sequencer-2",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-sequencer-nextseq.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-sequencer-nextseq"
      },
      "name" : "mii-exa-molgen-device-sequencer-nextseq",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-diagnostische-implikation-fgfr2-fusion",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-srcc-ctnna1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-srcc-ctnna1"
      },
      "name" : "mii-exa-molgen-diagnostische-implikation-srcc-ctnna1",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-1.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-1"
      },
      "name" : "mii-exa-molgen-family-member-history-1",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-2.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-2"
      },
      "name" : "mii-exa-molgen-family-member-history-2",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "FamilyMemberHistory"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "FamilyMemberHistory-mii-exa-molgen-family-member-history-srcc.html"
      }],
      "reference" : {
        "reference" : "FamilyMemberHistory/mii-exa-molgen-family-member-history-srcc"
      },
      "name" : "mii-exa-molgen-family-member-history-srcc",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/familienanamnese"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-mii-exa-molgen-medikationsempfehlung-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Task/mii-exa-molgen-medikationsempfehlung-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-medikationsempfehlung-fgfr2-fusion",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/medikationsempfehlung"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-mii-exa-molgen-patient.html"
      }],
      "reference" : {
        "reference" : "Patient/mii-exa-molgen-patient"
      },
      "name" : "mii-exa-molgen-patient",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-mii-exa-molgen-patient-2.html"
      }],
      "reference" : {
        "reference" : "Patient/mii-exa-molgen-patient-2"
      },
      "name" : "mii-exa-molgen-patient-2",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-mii-exa-molgen-patient-brca1.html"
      }],
      "reference" : {
        "reference" : "Patient/mii-exa-molgen-patient-brca1"
      },
      "name" : "mii-exa-molgen-patient-brca1",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-mii-exa-molgen-patient-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Patient/mii-exa-molgen-patient-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-patient-fgfr2-fusion",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-mii-exa-molgen-patient-srcc.html"
      }],
      "reference" : {
        "reference" : "Patient/mii-exa-molgen-patient-srcc"
      },
      "name" : "mii-exa-molgen-patient-srcc",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-phenotypic-feature-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-1"
      },
      "name" : "mii-exa-molgen-phenotypic-feature-1",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-phenotypic-feature-2.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-2"
      },
      "name" : "mii-exa-molgen-phenotypic-feature-2",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-phenotypic-feature-3.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-3"
      },
      "name" : "mii-exa-molgen-phenotypic-feature-3",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-phenotypic-feature-4.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-phenotypic-feature-4"
      },
      "name" : "mii-exa-molgen-phenotypic-feature-4",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-mii-exa-molgen-practitioner-lab.html"
      }],
      "reference" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-lab"
      },
      "name" : "mii-exa-molgen-practitioner-lab",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-mii-exa-molgen-practitioner-physician.html"
      }],
      "reference" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-physician"
      },
      "name" : "mii-exa-molgen-practitioner-physician",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-1.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-1"
      },
      "name" : "mii-exa-molgen-specimen-1",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-2.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-2"
      },
      "name" : "mii-exa-molgen-specimen-2",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-brca1.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-brca1"
      },
      "name" : "mii-exa-molgen-specimen-brca1",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-srcc.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-srcc"
      },
      "name" : "mii-exa-molgen-specimen-srcc",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-mii-exa-molgen-specimen-srcc-2.html"
      }],
      "reference" : {
        "reference" : "Specimen/mii-exa-molgen-specimen-srcc-2"
      },
      "name" : "mii-exa-molgen-specimen-srcc-2",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-therapeutische-implikation-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-therapeutische-implikation-fgfr2-fusion"
      },
      "name" : "mii-exa-molgen-therapeutische-implikation-fgfr2-fusion",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/therapeutische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-srcc-ctnna1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-srcc-ctnna1"
      },
      "name" : "mii-exa-molgen-variante-srcc-ctnna1",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Parameters"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Parameters-mii-param-molgen-manifest.html"
      }],
      "reference" : {
        "reference" : "Parameters/mii-param-molgen-manifest"
      },
      "name" : "mii-param-molgen-manifest",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-diagnostic-report-genomic-study.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-diagnostic-report-genomic-study"
      },
      "name" : "mii-sp-molgen-diagnostic-report-genomic-study",
      "description" : "Suchparameter für GenomicStudy Referenz in DiagnosticReport",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-diagnostic-report-recommended-action.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-diagnostic-report-recommended-action"
      },
      "name" : "mii-sp-molgen-diagnostic-report-recommended-action",
      "description" : "Suchparameter für empfohlene Maßnahmen in DiagnosticReport",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-genomic-study-analysis-device.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-genomic-study-analysis-device"
      },
      "name" : "mii-sp-molgen-genomic-study-analysis-device",
      "description" : "Suchparameter für verwendetes Gerät in GenomicStudyAnalysis",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-genomic-study-analysis-method.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-genomic-study-analysis-method"
      },
      "name" : "mii-sp-molgen-genomic-study-analysis-method",
      "description" : "Suchparameter für Methoden-Typ in GenomicStudyAnalysis",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-genomic-study-analysis-regions-studied.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-genomic-study-analysis-regions-studied"
      },
      "name" : "mii-sp-molgen-genomic-study-analysis-regions-studied",
      "description" : "Suchparameter für untersuchte Gene/Regionen in GenomicStudyAnalysis",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SearchParameter"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SearchParameter-mii-sp-molgen-genomic-study-analysis-specimen.html"
      }],
      "reference" : {
        "reference" : "SearchParameter/mii-sp-molgen-genomic-study-analysis-specimen"
      },
      "name" : "mii-sp-molgen-genomic-study-analysis-specimen",
      "description" : "Suchparameter für Specimen in GenomicStudyAnalysis",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-mikrosatelliteninstabilitaet-1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-mikrosatelliteninstabilitaet-1"
      },
      "name" : "Mikrosatelliteninstabilität",
      "description" : "Beispiel für Mikrosatelliteninstabilität in Tumorprobe.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mikrosatelliteninstabilitaet"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-molekulare-konsequenz-brca1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-molekulare-konsequenz-brca1"
      },
      "name" : "Molekulare Konsequenz BRCA1 Variante",
      "description" : "Beispiel für molekulare Konsequenz abgeleitet von SNP im BRCA1.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-1.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-1"
      },
      "name" : "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom",
      "description" : "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-1.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-1"
      },
      "name" : "Molekulargentischer Befund 1: BRAF mutiert colorektales Adenokarzinom",
      "description" : "Beispiel für molekulargenetischen Befund BRAF mutiert bei colorektalem Adenokarzniom.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-2.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-2"
      },
      "name" : "Molekulargentischer Befund 2: Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang",
      "description" : "Beispiel für molekulargenetischen Befund Molekulargenetische Diagnose eines Cornelia de Lange-Syndrom autosomal dominanter Erbgang.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-tumorboard-3.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-tumorboard-3"
      },
      "name" : "Molekulargentischer Befund 3: Tumorboard Genfusion",
      "description" : "Beispiel für molekulargenetischen Befund Tumorboard Genfusion.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-mii-exa-molgen-befundbericht-trurisk-panel.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/mii-exa-molgen-befundbericht-trurisk-panel"
      },
      "name" : "Molekulargentischer Befund Familiäre Belastung für Brust- und Eierstockkrebs",
      "description" : "Beispiel für molekulargenetischen Befund einer BRCA1 Variante bei Familiärer Belastung für Brust- und Eierstockkrebs.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/molekulargenetischer-befundbericht"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-2.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-2"
      },
      "name" : "NIPBL Variante",
      "description" : "Beispiel für genetische Variante im NIPBL Gen an Hand von WGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-diagnostische-implikation-2.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-diagnostische-implikation-2"
      },
      "name" : "NIPBL Variante Diagnostische Implikation",
      "description" : "Beispiel für diagnostische Implikation abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/diagnostische-implikation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-molekulare-konsequenz-2.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-molekulare-konsequenz-2"
      },
      "name" : "NIPBL Variante Molekulare Konsequenz",
      "description" : "Beispiel für molekulare Konsequenz abgeleitet von genetischer Variante im NIPBL Gen an Hand von WGS.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-molekulare-konsequenz"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-mii-exa-molgen-practitioner-ordering.html"
      }],
      "reference" : {
        "reference" : "Practitioner/mii-exa-molgen-practitioner-ordering"
      },
      "name" : "Ordering Practitioner",
      "description" : "Anfordernder Arzt",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "RiskAssessment"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "RiskAssessment-mii-exa-molgen-prs-brca1.html"
      }],
      "reference" : {
        "reference" : "RiskAssessment/mii-exa-molgen-prs-brca1"
      },
      "name" : "Polygener Risiko Score BRCA1 Variante",
      "description" : "Beispiel für Polygenen Risiko Score bei Variante BRCA1",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/polygener-risiko-score"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DeviceDefinition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DeviceDefinition-mii-exa-molgen-devicedef-tso500.html"
      }],
      "reference" : {
        "reference" : "DeviceDefinition/mii-exa-molgen-devicedef-tso500"
      },
      "name" : "TruSight Oncology 500 v2 Panel (DeviceDefinition)",
      "description" : "Katalogeintrag des TSO500 v2 Capture Panels: 523 Gene für SNV/Indel, 59 Gene für CNV, 23 Gene für DNA-Rearrangements, 55 Gene für RNA-Fusionen und Splice-Varianten; integrierte Biomarker TMB, MSI und HRD; Panelgröße 1,94 Mb",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-tso500-libprep.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-tso500-libprep"
      },
      "name" : "TSO500 Library Preparation",
      "description" : "Library Preparation und Hybrid-Capture-Target-Enrichment mit dem TSO500 Panel",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-tso500-sequencing.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-tso500-sequencing"
      },
      "name" : "TSO500 Sequencing on NovaSeq 6000",
      "description" : "Paired-end Sequenzierung der TSO500-Library auf Illumina NovaSeq 6000",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-mii-exa-molgen-device-tso500-lot.html"
      }],
      "reference" : {
        "reference" : "Device/mii-exa-molgen-device-tso500-lot"
      },
      "name" : "TSO500 v2 Kit Lot 20240518",
      "description" : "Konkrete Kit-Charge des TSO500 v2 Panels im Labor, verweist auf den Katalog-Eintrag in der DeviceDefinition",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-brca1.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-brca1"
      },
      "name" : "Variante BRCA1",
      "description" : "Beispiel für genetische Variante BRCA1",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-fgfr2-fusion.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-fgfr2-fusion"
      },
      "name" : "Variante FGFR2-DBP Fusion",
      "description" : "Beispiel für genetische Variante FGFR2-DBP Fusion.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-mii-exa-molgen-variante-cnv-4.html"
      }],
      "reference" : {
        "reference" : "Observation/mii-exa-molgen-variante-cnv-4"
      },
      "name" : "Variante SMO CNV",
      "description" : "Beispiel für genetische Copy Number Variante SMO Gen.",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-wes-bioinformatics.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics"
      },
      "name" : "WES Bioinformatics Analysis",
      "description" : "Bioinformatische Auswertung für Whole Exome Sequencing",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-wes-library-prep.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep"
      },
      "name" : "WES Library Preparation Analysis",
      "description" : "Library Preparation für Whole Exome Sequencing",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-mii-exa-molgen-genomic-study-analysis-wes-sequencing.html"
      }],
      "reference" : {
        "reference" : "Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing"
      },
      "name" : "WES Sequencing Analysis",
      "description" : "Sequenzierung für Whole Exome Sequencing mit detaillierten Metriken",
      "exampleCanonical" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/mii-pr-molgen-genomic-study-analysis"
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "_title" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "de"
          },
          {
            "url" : "content",
            "valueString" : "Inhaltsverzeichnis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Startseite"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "guidance.html"
        }],
        "nameUrl" : "guidance.html",
        "title" : "Guidance",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Anleitung"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "implementer-guidance.html"
          }],
          "nameUrl" : "implementer-guidance.html",
          "title" : "Guidance for Implementers",
          "_title" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Anleitung für Implementierende"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          },
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "uml-diagrams.html"
          }],
          "nameUrl" : "uml-diagrams.html",
          "title" : "UML Diagrams",
          "_title" : {
            "extension" : [{
              "extension" : [{
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "UML-Diagramme"
              }],
              "url" : "http://hl7.org/fhir/StructureDefinition/translation"
            }]
          },
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "security-and-privacy.html"
        }],
        "nameUrl" : "security-and-privacy.html",
        "title" : "Security and Privacy",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Sicherheit und Datenschutz"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "qualitaetsbericht.html"
        }],
        "nameUrl" : "qualitaetsbericht.html",
        "title" : "Quality Report",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Qualitätsbericht"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "profiles.html"
        }],
        "nameUrl" : "profiles.html",
        "title" : "Profiles",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Profile"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "extensions.html"
        }],
        "nameUrl" : "extensions.html",
        "title" : "Extensions",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Extensions"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "capability-statements.html"
        }],
        "nameUrl" : "capability-statements.html",
        "title" : "Capability Statements",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "CapabilityStatements"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "search-parameters.html"
        }],
        "nameUrl" : "search-parameters.html",
        "title" : "Search Parameters",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Suchparameter"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "logical-models.html"
        }],
        "nameUrl" : "logical-models.html",
        "title" : "Logical Models",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Logische Modelle"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "value-sets.html"
        }],
        "nameUrl" : "value-sets.html",
        "title" : "Value Sets",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "ValueSets"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "examples.html"
        }],
        "nameUrl" : "examples.html",
        "title" : "Examples",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Beispiele"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "downloads.html"
        }],
        "nameUrl" : "downloads.html",
        "title" : "Downloads",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Downloads"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "changes.html"
        }],
        "nameUrl" : "changes.html",
        "title" : "Changelog",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Änderungshistorie"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "metadata.html"
        }],
        "nameUrl" : "metadata.html",
        "title" : "Metadata Overview",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Metadaten-Übersicht"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "version-history.html"
        }],
        "nameUrl" : "version-history.html",
        "title" : "Versioning",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Versionierung"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "ImplementationGuide-mii-ig-molgen-de-v2026.html"
        }],
        "nameUrl" : "ImplementationGuide-mii-ig-molgen-de-v2026.html",
        "title" : "MII ImplementationGuide Resource",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "MII ImplementationGuide Ressource"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "translationinfo.html"
        }],
        "nameUrl" : "translationinfo.html",
        "title" : "Translation Information",
        "_title" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "de"
            },
            {
              "url" : "content",
              "valueString" : "Hinweise zur Übersetzung"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/predefined-resources"
    },
    {
      "code" : "path-pages",
      "value" : "input/intro-notes"
    },
    {
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
