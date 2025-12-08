// Transaction Bundle for Comprehensive Whole Exome Sequencing
// This bundle demonstrates the full technical documentation capabilities of GenomicStudy/GenomicStudyAnalysis
// for research projects requiring detailed methodological tracking

Instance: mii-exa-molgen-bundle-comprehensive-wes
InstanceOf: Bundle
Usage: #example
Title: "Comprehensive WES Bundle with Full Technical Documentation"
Description: "Transaktions-Bundle für eine vollständige Whole Exome Sequencing Analyse mit detaillierten technischen Angaben zu Geräten, Kits, Metriken und Bioinformatik-Pipeline. Dieses Beispiel zeigt die erweiterten Dokumentationsmöglichkeiten für Forschungsprojekte."
* type = #transaction
* timestamp = "2024-01-20T10:00:00+01:00"

// Patient
* entry[+].fullUrl = "https://example.org/Patient/mii-exa-molgen-patient-wes"
* entry[=].resource = mii-exa-molgen-patient-wes
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"

// Devices
* entry[+].fullUrl = "https://example.org/Device/mii-exa-molgen-device-illumina-novaseq"
* entry[=].resource = mii-exa-molgen-device-illumina-novaseq
* entry[=].request.method = #POST
* entry[=].request.url = "Device"

* entry[+].fullUrl = "https://example.org/Device/mii-exa-molgen-device-thermofisher-ionchef"
* entry[=].resource = mii-exa-molgen-device-thermofisher-ionchef
* entry[=].request.method = #POST
* entry[=].request.url = "Device"

// Specimens
* entry[+].fullUrl = "https://example.org/Specimen/mii-exa-molgen-specimen-blood-edta"
* entry[=].resource = mii-exa-molgen-specimen-blood-edta-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"

* entry[+].fullUrl = "https://example.org/Specimen/mii-exa-molgen-specimen-dna-library"
* entry[=].resource = mii-exa-molgen-specimen-dna-library-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"

// Protocol/PlanDefinition
* entry[+].fullUrl = "https://example.org/PlanDefinition/mii-exa-molgen-protocol-agilent-sureselect"
* entry[=].resource = mii-exa-molgen-protocol-agilent-sureselect
* entry[=].request.method = #POST
* entry[=].request.url = "PlanDefinition"

// DocumentReferences for data files
* entry[+].fullUrl = "https://example.org/DocumentReference/mii-exa-molgen-documentreference-bed-file"
* entry[=].resource = mii-exa-molgen-documentreference-bed-file-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"

* entry[+].fullUrl = "https://example.org/DocumentReference/mii-exa-molgen-documentreference-fastq"
* entry[=].resource = mii-exa-molgen-documentreference-fastq-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "DocumentReference"

// GenomicStudy and Analyses
* entry[+].fullUrl = "https://example.org/Procedure/mii-exa-molgen-genomic-study-comprehensive-wes"
* entry[=].resource = mii-exa-molgen-genomic-study-comprehensive-wes-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].fullUrl = "https://example.org/Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep"
* entry[=].resource = mii-exa-molgen-genomic-study-analysis-wes-library-prep-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].fullUrl = "https://example.org/Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing"
* entry[=].resource = mii-exa-molgen-genomic-study-analysis-wes-sequencing-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].fullUrl = "https://example.org/Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics"
* entry[=].resource = mii-exa-molgen-genomic-study-analysis-wes-bioinformatics-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

// ServiceRequest
* entry[+].fullUrl = "https://example.org/ServiceRequest/mii-exa-molgen-anforderung-wes"
* entry[=].resource = mii-exa-molgen-anforderung-wes-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

// Observations (Variant and Diagnostic Implication)
* entry[+].fullUrl = "https://example.org/Observation/mii-exa-molgen-variante-comprehensive-pathogenic"
* entry[=].resource = mii-exa-molgen-variante-comprehensive-pathogenic-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "https://example.org/Observation/mii-exa-molgen-diagnostische-implikation-comprehensive"
* entry[=].resource = mii-exa-molgen-diagnostische-implikation-comprehensive-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

// Media (Coverage Plot)
* entry[+].fullUrl = "https://example.org/Media/mii-exa-molgen-media-coverage-plot"
* entry[=].resource = mii-exa-molgen-media-coverage-plot
* entry[=].request.method = #POST
* entry[=].request.url = "Media"

// DiagnosticReport
* entry[+].fullUrl = "https://example.org/DiagnosticReport/mii-exa-molgen-molekulargenetischer-befundbericht-comprehensive-wes"
* entry[=].resource = mii-exa-molgen-befundbericht-comprehensive-wes-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "DiagnosticReport"

// Practitioners
* entry[+].fullUrl = "https://example.org/Practitioner/mii-exa-molgen-practitioner"
* entry[=].resource = mii-exa-molgen-practitioner-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

* entry[+].fullUrl = "https://example.org/Practitioner/mii-exa-molgen-practitioner-lab"
* entry[=].resource = mii-exa-molgen-practitioner-lab-bundle
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

// Bundle-specific instances with updated references

Instance: mii-exa-molgen-patient-wes
InstanceOf: Patient
Usage: #inline
* identifier.system = "https://example.org/patient-ids"
* identifier.value = "WES2024001"
* name.family = "Mustermann"
* name.given = "Max"
* gender = #male
* birthDate = "1970-01-01"

Instance: mii-exa-molgen-specimen-blood-edta-bundle
InstanceOf: Specimen
Usage: #inline
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids"
* identifier.value = "EDTA-2024-001"
* type = $SCT#119361006 "Plasma specimen"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* collection.collectedDateTime = "2024-01-15T09:30:00+01:00"
* container.type = $SCT#767384004 "Evacuated blood collection tube with clot activator"
* container.capacity = 10 'mL' "milliliter"
* container.specimenQuantity = 10 'mL' "milliliter"

Instance: mii-exa-molgen-specimen-dna-library-bundle
InstanceOf: Specimen
Usage: #inline
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/specimen-ids"
* identifier.value = "LIB-2024-001"
* type = $SCT#119342007 "Saliva specimen"
* type.text = "DNA Library"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* parent = Reference(Specimen/mii-exa-molgen-specimen-blood-edta)
* processing.description = "DNA extraction and library preparation using Agilent SureSelect"
* processing.timeDateTime = "2024-01-16T14:00:00+01:00"

Instance: mii-exa-molgen-documentreference-bed-file-bundle
InstanceOf: DocumentReference
Usage: #inline
* status = #current
* type.text = "BED file - Agilent SureSelect V7 target regions"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* content.attachment.url = "https://example.org/files/agilent_v7_targets.bed"
* content.attachment.title = "Agilent SureSelect Human All Exon V7 Target Regions"
* content.attachment.contentType = #text/plain

Instance: mii-exa-molgen-documentreference-fastq-bundle
InstanceOf: DocumentReference
Usage: #inline
* status = #current
* type.text = "FASTQ files - paired-end sequencing data"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* content[+].attachment.url = "https://example.org/files/sample_R1.fastq.gz"
* content[=].attachment.title = "Forward reads"
* content[=].attachment.contentType = #application/gzip
* content[+].attachment.url = "https://example.org/files/sample_R2.fastq.gz"
* content[=].attachment.title = "Reverse reads"
* content[=].attachment.contentType = #application/gzip

Instance: mii-exa-molgen-genomic-study-comprehensive-wes-bundle
InstanceOf: mii-pr-molgen-genomic-study
Usage: #inline
* status = #completed
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(Procedure/mii-exa-molgen-genomic-study-analysis-wes-library-prep)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(Procedure/mii-exa-molgen-genomic-study-analysis-wes-sequencing)
* extension[+].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-ext"
* extension[=].valueReference = Reference(Procedure/mii-exa-molgen-genomic-study-analysis-wes-bioinformatics)

Instance: mii-exa-molgen-genomic-study-analysis-wes-library-prep-bundle
InstanceOf: mii-pr-molgen-genomic-study-analysis
Usage: #inline
* status = #completed
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(Specimen/mii-exa-molgen-specimen-blood-edta)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(Device/mii-exa-molgen-device-thermofisher-ionchef)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26810-4 "DNA hybridization"
// Protocol reference removed - genomic-study-analysis-protocol-performed only accepts Task/Procedure in STU3, not PlanDefinition

Instance: mii-exa-molgen-genomic-study-analysis-wes-sequencing-bundle
InstanceOf: mii-pr-molgen-genomic-study-analysis
Usage: #inline
* status = #completed
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* extension[specimen].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-specimen"
* extension[specimen].valueReference = Reference(Specimen/mii-exa-molgen-specimen-dna-library)
* extension[device].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-device"
* extension[device].extension[device].url = "device"
* extension[device].extension[device].valueReference = Reference(Device/mii-exa-molgen-device-illumina-novaseq)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26398-0 "Sequencing"

Instance: mii-exa-molgen-genomic-study-analysis-wes-bioinformatics-bundle
InstanceOf: mii-pr-molgen-genomic-study-analysis
Usage: #inline
* status = #completed
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* extension[method-type].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-method-type"
* extension[method-type].valueCodeableConcept = $LNC#LA26811-2 "Computational analysis"

Instance: mii-exa-molgen-anforderung-wes-bundle
InstanceOf: mii-pr-molgen-anforderung-genetischer-test
Usage: #inline
* status = #completed
* intent = #order
* code = $LNC#86205-2 "Whole exome sequence analysis in Blood or Tissue by Molecular genetics method"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* authoredOn = "2024-01-10"
* requester = Reference(Practitioner/mii-exa-molgen-practitioner)
* reasonCode = $SCT#110359009 "Intellectual disability (disorder)"


Instance: mii-exa-molgen-variante-comprehensive-pathogenic-bundle
InstanceOf: mii-pr-molgen-variante
Usage: #inline
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $LNC#69548-6 "Genetic variant assessment"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* valueCodeableConcept = $LNC#LA9633-4 "Present"
* component[gene-studied].code = $LNC#48018-6 "Gene studied [ID]"
* component[gene-studied].valueCodeableConcept = $HGNC#HGNC:7132 "KMT2A"
* component[representative-coding-hgvs].code = $LNC#48004-6 "DNA change (c.HGVS)"
* component[representative-coding-hgvs].valueCodeableConcept.text = "NM_005933.3:c.3463C>T"  // MANE Select transcript
* component[representative-protein-hgvs].code = $LNC#48005-3 "Amino acid change (pHGVS)"
* component[representative-protein-hgvs].valueCodeableConcept.text = "p.(Arg1155Ter)"

Instance: mii-exa-molgen-diagnostische-implikation-comprehensive-bundle
InstanceOf: mii-pr-molgen-diagnostische-implikation
Usage: #inline
* status = #final
* category[labCategory] = $ObsCat#laboratory "Laboratory"
* code = $GenTbd#diagnostic-implication "Diagnostic Implication"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* derivedFrom = Reference(Observation/mii-exa-molgen-variante-comprehensive-pathogenic)
* component[clinical-significance].code = $LNC#53037-8
* component[clinical-significance].valueCodeableConcept = $LNC#LA6668-3 "Pathogenic"

Instance: mii-exa-molgen-befundbericht-comprehensive-wes-bundle
InstanceOf: mii-pr-molgen-molekulargenetischer-befundbericht
Usage: #inline
* meta.profile = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report"
* extension[genomic-study].url = "http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-reference"
* extension[genomic-study].valueReference = Reference(Procedure/mii-exa-molgen-genomic-study-comprehensive-wes)
* basedOn = Reference(ServiceRequest/mii-exa-molgen-anforderung-wes)
* status = $DiagRepStatus#final
* category[Genetics] = $v2-0074#GE "Genetics"
* code = $LNC#51969-4 "Genetic analysis report"
* subject = Reference(Patient/mii-exa-molgen-patient-wes)
* performer = Reference(Practitioner/mii-exa-molgen-practitioner-lab)
* specimen = Reference(Specimen/mii-exa-molgen-specimen-blood-edta)
* result[variant] = Reference(Observation/mii-exa-molgen-variante-comprehensive-pathogenic)
* result[diagnostic-implication] = Reference(Observation/mii-exa-molgen-diagnostische-implikation-comprehensive)
* media[+].comment = "Coverage plot showing uniform coverage across all exons"
* media[=].link = Reference(Media/mii-exa-molgen-media-coverage-plot)
* conclusion = "Whole exome sequencing identified a pathogenic de novo variant in the KMT2A gene, consistent with Wiedemann-Steiner syndrome. Technical quality metrics met all acceptance criteria."
* conclusionCode = $LNC#LA6576-8 "Positive"

Instance: mii-exa-molgen-practitioner-bundle
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/practitioner-ids"
* identifier.value = "12345"
* name.family = "Schmidt"
* name.given = "Anna"
* name.prefix = "Dr."

Instance: mii-exa-molgen-practitioner-lab-bundle
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "https://www.medizininformatik-initiative.de/fhir/sid/practitioner-ids"
* identifier.value = "67890"
* name.family = "Weber"
* name.given = "Thomas"
* name.prefix = "Dr."