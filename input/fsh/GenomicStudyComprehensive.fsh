// Comprehensive GenomicStudy Example showcasing full technical documentation capabilities

Instance: mii-exa-molgen-device-illumina-novaseq
InstanceOf: Device
Usage: #example
Title: "Illumina NovaSeq 6000 Sequencer"
Description: "Beispiel für Sequenziergerät"
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/lab-devices"
* identifier.value = "NOVASEQ-6000-SN12345"
* manufacturer = "Illumina Inc."
* modelNumber = "NovaSeq 6000"
* serialNumber = "SN12345"
* deviceName.name = "NovaSeq 6000 Sequencing System"
* deviceName.type = #model-name
* type = $SCT#30234008 "Medical laboratory analyzer"
* status = #active

Instance: mii-exa-molgen-device-thermofisher-ionchef
InstanceOf: Device
Usage: #example
Title: "Ion Chef System"
Description: "Library Preparation System"
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/lab-devices"
* identifier.value = "IONCHEF-IC12345"
* manufacturer = "Thermo Fisher Scientific"
* modelNumber = "Ion Chef"
* serialNumber = "IC12345"
* deviceName.name = "Ion Chef System"
* deviceName.type = #model-name
* type = $SCT#706689003 "Nucleic acid extraction system (physical object)"
* status = #active

Instance: mii-exa-molgen-genomic-study-comprehensive-wes
InstanceOf: mii-pr-molgen-genomic-study
Title: "Comprehensive Whole Exome Sequencing Study"
Description: "Vollständiges Exom-Sequenzierung Beispiel mit detaillierten technischen Angaben"
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-wes-library-prep)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-wes-sequencing)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(mii-exa-molgen-genomic-study-analysis-wes-bioinformatics)

Instance: mii-exa-molgen-genomic-study-analysis-wes-library-prep
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "WES Library Preparation Analysis"
Description: "Library Preparation für Whole Exome Sequencing"
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(mii-exa-molgen-specimen-blood-edta)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(mii-exa-molgen-device-thermofisher-ionchef)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26811-2 "Hybridization-based capture"
// Protocol reference removed - not supported as PlanDefinition in STU3

Instance: mii-exa-molgen-genomic-study-analysis-wes-sequencing
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "WES Sequencing Analysis"
Description: "Sequenzierung für Whole Exome Sequencing mit detaillierten Metriken"
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(mii-exa-molgen-specimen-dna-library)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(mii-exa-molgen-device-illumina-novaseq)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26398-0 "Sequencing"
* extension[metrics].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics"
* extension[metrics].extension[read-depth].url = "read-depth"
* extension[metrics].extension[read-depth].valueQuantity = 120 '1' "reads"
* extension[metrics].extension[sequencing-coverage].url = "sequencing-coverage"
* extension[metrics].extension[sequencing-coverage].valueQuantity = 98.5 '%' "percent"
* extension[metrics].extension[metrics-description].url = "metrics-description"
* extension[metrics].extension[metrics-description].valueString = "High-quality sequencing run with mean coverage of 120X. 98.5% of target regions achieved >20X coverage. Q30 bases: 92%. Contamination estimate: <1%. Sample identity confirmed by SNP fingerprinting."
* extension[regions].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
* extension[regions].extension[description].url = "description"
* extension[regions].extension[description].valueString = "Whole Exome - Agilent SureSelect Human All Exon V7"
// Coordinates reference removed - not supported in STU3

Instance: mii-exa-molgen-genomic-study-analysis-wes-bioinformatics
InstanceOf: mii-pr-molgen-genomic-study-analysis
Title: "WES Bioinformatics Analysis"
Description: "Bioinformatische Auswertung für Whole Exome Sequencing"
* status = #completed
* subject = Reference(mii-exa-molgen-patient)
* extension[input].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-input"
* extension[input].extension[type].url = "type"
* extension[input].extension[type].valueCodeableConcept.text = "FASTQ files"
// Input value reference simplified - pipeline details not fully supported in STU3
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26806-2 "Computational analysis"
// Pipeline details removed - not supported in STU3 structure
* extension[regions].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions"
* extension[regions].extension[description].url = "description"
* extension[regions].extension[description].valueString = "Callable regions after quality filtering"
// Called/uncalled regions removed - use metrics extension instead

// Supporting resources for the comprehensive example

Instance: mii-exa-molgen-specimen-blood-edta
InstanceOf: Specimen
Usage: #example
Title: "EDTA Blood Sample"
Description: "EDTA-Blutprobe für DNA-Extraktion"
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids"
* identifier.value = "EDTA-2024-001"
* type = $SCT#119361006 "Plasma specimen"
* subject = Reference(mii-exa-molgen-patient)
* collection.collectedDateTime = "2024-01-15T09:30:00+01:00"
* container.type = $SCT#767384004 "Evacuated blood collection tube with clot activator"
* container.capacity = 10 'mL' "milliliter"
* container.specimenQuantity = 10 'mL' "milliliter"

Instance: mii-exa-molgen-specimen-dna-library
InstanceOf: Specimen
Usage: #example
Title: "DNA Library"
Description: "Prepared DNA library for sequencing"
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids"
* identifier.value = "LIB-2024-001"
* type = $SCT#119342007 "Saliva specimen"
* type.text = "DNA Library"
* subject = Reference(mii-exa-molgen-patient)
* parent = Reference(mii-exa-molgen-specimen-blood-edta)
* processing.description = "DNA extraction and library preparation using Agilent SureSelect"
* processing.timeDateTime = "2024-01-16T14:00:00+01:00"

Instance: mii-exa-molgen-protocol-agilent-sureselect
InstanceOf: PlanDefinition
Usage: #example
Title: "Agilent SureSelect Human All Exon V7 Protocol"
Description: "Protokoll für Exom-Anreicherung"
* status = #active
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#protocol "Protocol"
* name = "AgilentSureSelectV7"
* title = "Agilent SureSelect Human All Exon V7 Kit Protocol"
* description = "Target enrichment protocol for whole exome sequencing covering 35.8 Mb of the human exome"
* action[+].title = "DNA Fragmentation"
* action[=].description = "Fragment genomic DNA to 150-200bp using Covaris"
* action[+].title = "Library Preparation"
* action[=].description = "End repair, A-tailing, adapter ligation"
* action[+].title = "Hybridization"
* action[=].description = "Hybridize with SureSelect baits for 24 hours at 65°C"
* action[+].title = "Capture"
* action[=].description = "Streptavidin bead capture and washing"
* action[+].title = "Amplification"
* action[=].description = "PCR amplification of captured library"

Instance: mii-exa-molgen-documentreference-bed-file
InstanceOf: DocumentReference
Usage: #example
Title: "BED File for Target Regions"
Description: "BED-Datei mit den Zielregionen des Exom-Kits"
* status = #current
* type = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#GENOMIC "Genomic"
* type.text = "BED file - Agilent SureSelect V7 target regions"
* subject = Reference(mii-exa-molgen-patient)
* content.attachment.url = "https://example.org/files/agilent_v7_targets.bed"
* content.attachment.title = "Agilent SureSelect Human All Exon V7 Target Regions"
* content.attachment.contentType = #text/plain
* content.format = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#BED "BED file format"

Instance: mii-exa-molgen-practitioner-ordering
InstanceOf: Practitioner
Usage: #example
Title: "Ordering Practitioner"
Description: "Anfordernder Arzt"
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/practitioner-ids"
* identifier.value = "54321"
* name.family = "Müller"
* name.given = "Klaus"
* name.prefix = "Dr."

Instance: mii-exa-molgen-documentreference-fastq
InstanceOf: DocumentReference
Usage: #example
Title: "FASTQ Sequencing Files"
Description: "Raw sequencing data files"
* status = #current
* type = http://terminology.hl7.org/CodeSystem/v3-ObservationValue#GENOMIC "Genomic"
* type.text = "FASTQ files - paired-end sequencing data"
* subject = Reference(mii-exa-molgen-patient)
* content[+].attachment.url = "https://example.org/files/sample_R1.fastq.gz"
* content[=].attachment.title = "Forward reads"
* content[=].attachment.contentType = #application/gzip
* content[+].attachment.url = "https://example.org/files/sample_R2.fastq.gz"
* content[=].attachment.title = "Reverse reads"
* content[=].attachment.contentType = #application/gzip

Instance: mii-exa-molgen-befundbericht-comprehensive-wes
InstanceOf: mii-pr-molgen-molekulargenetischer-befundbericht
Usage: #example
Title: "Comprehensive WES Report with Full Technical Documentation"
Description: "Beispiel für einen vollständigen WES-Bericht mit detaillierten technischen Angaben"
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report"
* extension[genomic-study].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference"
* extension[genomic-study].valueReference = Reference(mii-exa-molgen-genomic-study-comprehensive-wes)
* extension[workflow-relatedArtifact].url = "http://hl7.org/fhir/StructureDefinition/workflow-relatedArtifact"
* extension[workflow-relatedArtifact].valueRelatedArtifact.type = $RelArtType#documentation "Documentation"
* extension[workflow-relatedArtifact].valueRelatedArtifact.label = "GATK Best Practices for Germline SNP & Indel Discovery"
* extension[workflow-relatedArtifact].valueRelatedArtifact.url = "https://gatk.broadinstitute.org/hc/en-us/articles/360035535932"
* extension[coded-note][+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report-note"
* extension[coded-note][=].valueAnnotation.extension[code].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/annotation-code"
* extension[coded-note][=].valueAnnotation.extension[code].valueCodeableConcept.text = "Quality Metrics"
* extension[coded-note][=].valueAnnotation.text = "Mean coverage: 120X, 98.5% of bases >20X, 95.2% of target regions callable. Q30 bases: 92%. Contamination estimate: <1%. Sample identity confirmed by SNP fingerprinting."
* basedOn = Reference(mii-exa-molgen-anforderung-wes)
* status = $DiagRepStatus#final
* category[Genetics] = $v2-0074#GE "Genetics"
* code = $LNC#51969-4 "Genetic analysis report"
* subject = Reference(mii-exa-molgen-patient)
* performer = Reference(mii-exa-molgen-practitioner-lab)
* specimen = Reference(mii-exa-molgen-specimen-blood-edta)
* result[variant] = Reference(mii-exa-molgen-variante-comprehensive-pathogenic)
* result[diagnostic-implication] = Reference(mii-exa-molgen-diagnostische-implikation-comprehensive)
* media[+].comment = "Coverage plot showing uniform coverage across all exons"
* media[=].link = Reference(mii-exa-molgen-media-coverage-plot)
* conclusion = "Whole exome sequencing identified a pathogenic de novo variant in the KMT2A gene, consistent with Wiedemann-Steiner syndrome. This explains the patient's developmental delay and dysmorphic features. Technical quality metrics met all acceptance criteria."
* conclusionCode = $LNC#LA6576-8 "Positive"

Instance: mii-exa-molgen-anforderung-wes
InstanceOf: mii-pr-molgen-anforderung-genetischer-test
Usage: #example
Title: "Anforderung Whole Exome Sequencing"
* status = #completed
* intent = #order
* code = $LNC#94077-5 "Whole exome sequence analysis in Blood or Tissue by Molecular genetics method"
* subject = Reference(mii-exa-molgen-patient)
* authoredOn = "2024-01-10"
* requester = Reference(mii-exa-molgen-practitioner-ordering)
* reasonCode = $SCT#234123001 "Intellectual disability syndrome"
* reasonCode.text = "Unklare Entwicklungsverzögerung mit Dysmorphiezeichen, V.a. genetisches Syndrom nach unauffälliger Chromosomenanalyse und Array-CGH"

Instance: mii-exa-molgen-variante-comprehensive-pathogenic
InstanceOf: mii-pr-molgen-variante
Usage: #example
Title: "KMT2A Pathogenic Variant from WES"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(mii-exa-molgen-patient)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:7132 "KMT2A"
* component[representative-coding-hgvs].code = $LNC#48004-6 "DNA change (c.HGVS)"
* component[representative-coding-hgvs].valueCodeableConcept = $HGVS#NM_001197104.2:c.3463C>T
* component[representative-protein-hgvs].code = $LNC#48005-3 "Amino acid change (pHGVS)"
* component[representative-protein-hgvs].valueCodeableConcept = $HGVS#p.(Arg1155Ter)
* component[allelic-read-depth].code = $LNC#82121-5 "Allelic read depth"
* component[allelic-read-depth].valueQuantity = 45 '1' "reads"
* component[variant-confidence-status].code = $GenTbd#variant-confidence-status "Variant confidence status"
* component[variant-confidence-status].valueCodeableConcept = $GenTbd#high "High confidence"

Instance: mii-exa-molgen-diagnostische-implikation-comprehensive
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #example
Title: "Diagnostic Implication for KMT2A Variant"
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(mii-exa-molgen-patient)
* derivedFrom = Reference(mii-exa-molgen-variante-comprehensive-pathogenic)
* component[clinical-significance].code = $LNC#53037-8
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"
* component[evidence-level].code = $LNC#93044-6 "Variant confidence status"
* component[evidence-level].valueCodeableConcept.text = "Strong evidence - de novo variant, loss-of-function"
* component[predicted-phenotype].code = $LNC#81259-4 "Associated phenotype"
* component[predicted-phenotype].valueCodeableConcept = $SCT#268627008 "Wiedemann-Steiner syndrome"

Instance: mii-exa-molgen-media-coverage-plot
InstanceOf: Media
Usage: #example
Title: "Coverage Plot"
Description: "Graphical representation of sequencing coverage"
* status = #completed
* type = http://terminology.hl7.org/CodeSystem/media-type#image "Image"
* subject = Reference(mii-exa-molgen-patient)
* createdDateTime = "2024-01-20T10:00:00+01:00"
* content.contentType = #image/png
* content.title = "Exome Coverage Distribution Plot"
* content.url = "https://example.org/plots/coverage_wes_2024001.png"