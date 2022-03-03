Profile: SD_MII_MolGen_Variante
Parent: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id: sd-mii-molgen-variante
Title: "SD MII MolGen Variante"
Description: "Dieses Profil ermöglicht eine vollständige Beschreibung der gefundenen Variante unter Verwendung von Eigenschaften aus einer Vielzahl von Testmethoden."
* ^url = "https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/variante"
* subject only https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference 
* subject only Reference(Patient or Group)
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains dna-region 0..1
* component[dna-region].code = LNC#47999-8
* component[dna-region].code ^short = "47999-8"
* component[dna-region] ^short = "DNA region name [Identifier]"
* component[dna-region] ^definition = "A human readable name for the region of interest. Typically Exon #, Intron # or other."
* component[dna-region].value[x] only string
* component[dna-region].value[x] 1..1