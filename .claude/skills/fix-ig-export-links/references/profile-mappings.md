# MII MolGen Link Transformations

## Canonical Box Links (FQL Table)

The canonical box in profile pages contains two types of links:

### Canonical URL Column
Links to the profile's own canonical URL are transformed to Simplifier resolve:

| Original Pattern | Transformed To |
|-----------------|----------------|
| `/resolve?&scope=package:de.medizininformatikinitiative.kerndatensatz.molgen@VERSION&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/...` | `https://simplifier.net/resolve?canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/...&fhirVersion=R4` |

### Basis Column (Base Profile)
Links to base FHIR profiles are transformed to hl7.org:

| Original Pattern | Transformed To |
|-----------------|----------------|
| `/resolve?&scope=...&canonical=http://hl7.org/fhir/StructureDefinition/Observation` | `https://hl7.org/fhir/R4/Observation.html` |
| `/resolve?&scope=...&canonical=http://hl7.org/fhir/StructureDefinition/ServiceRequest` | `https://hl7.org/fhir/R4/ServiceRequest.html` |

## MII MolGen Profiles

All profiles under `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/` are handled by a single generic pattern that transforms them to Simplifier resolve links.

### Profile List
- diagnostische-implikation
- therapeutische-implikation
- molekulare-konsequenz
- variante
- genotyp
- haplotype
- sequence-phase-relationship
- molekulargenetischer-befundbericht
- anforderung-genetischer-test
- empfohlene-folgemassnahme
- medikationsempfehlung
- familienanamnese
- mikrosatelliteninstabilitaet
- mutationslast
- polygener-risiko-score
- mii-pr-molgen-genomic-study
- mii-pr-molgen-genomic-study-analysis
- mii-pr-molgen-molekularer-biomarker
- LogicalModelMolGen
