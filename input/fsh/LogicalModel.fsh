Logical: MII_LM_MolGen_LogicalModel
Parent: Element
Id: mii-lm-molgen-logical-model
Title: "MII LM MolGen LogicalModel"
Description: "LogicalModel des MII Moduls Molekulargenetischer Befundbericht"
//* ^status = #draft
* Probeninformation 1..1 BackboneElement "Probeninformation"
  * Patient 1..1 Reference(Patient) "Patient" "Abgebildet im KDS Modul Person"
  * Probe 0..* Reference(Specimen) "Probe" "Abgebildet im KDS Modul Biobank"
* Anforderung 0..* BackboneElement "Anforderung"
  * Indikation 0..* BackboneElement "Indikation"
    * Indikation 0..* CodeableConcept "Indikation" "Indikation; (mögliche) Erkrankung Terminologien: ICD-10, SNOMED, Orpha, HPO - Bsp.: Verdacht auf… / Ausschluss von… / Mögliche Therapie für ..."
    * Gesundheitszustand 0..* Reference(Condition) "Gesundheitszustand" "Aktueller Gesundheitszustand; Angabe aktueller Beschwerden oder nachgewiesener Erkrankung - Terminologie: HPO"
    * Krankengeschichte-Familie 0..* Reference(FamilyMemberHistory) "Krankengeschichte Familie"
    * Anlagetraeger 0..* Reference(FamilyMemberHistory or Condition or Observation) "Anlageträger" "Anlageträgerstatus der Familie - Ist gefordert wenn Verwandte des Index-Falles ebenfalls sequenziert wurden - Terminologie: PED"
    * RelevanteVorergebnisse 0..* Reference(Condition or Observation or DiagnosticReport or DocumentReference) "Relevante Vorergebnisse" "Angabe zuvor durchgeführter relevanter Tests (inklusive z.B. Methode, getestete Gene, und Ergebnisse)"
  * Anforderer 0..* Reference(Practitioner or PractitionerRole or Organization or Patient or RelatedPerson or Device) "Anforderer" "Informationen zur Person, die die molekulargenetischen Untersuchungen in Auftrag gibt"
    * Zu-testende-Gene 0..* CodeableConcept "Zu testende Gene" "Angabe der zu testenden Gene"
    * Einheitlicher-Bewertungsmassstab 0..* Reference(ChargeItem) "Einheitlicher Bewertungsmaßstab" "Der Einheitliche Bewertungsmaßstab definiert den Inhalt der abrechnungsfähigen vertragsärztlichen Leistungen Einheitlicher Bewertungsmaßstab (EBM): Angabe der Ziffern"
    * Anforderungstext 0..1 string "Anforderungstext" "Freitext für die Angabe von entweder originaler, unveränderter Anforderungstext, oder alternativ: zusätzliche Anforderungen oder angeforderter Test"
  * Datum-der-Anforderung 0..1 dateTime "Datum der Anforderung" "Angabe des Datums der Anforderung"
  * Bemerkungen 0..1 Annotation "Bemerkungen"
* Methoden 0..* BackboneElement "Methoden"
  * Methode 0..1 CodeableConcept "Methode" "Methode und Referenz zur Methode - beinhaltet alle sequenzbasierenden Analytik-Methoden, während nicht sequenzbasierende Aufarbeitungsmethoden in das Modul Pathologie zuzuordnen sind."
  * Relevante-Parameter 0..* Reference(Observation or RelatedArtifact or DocumentReference) "Relevante Parameter" "Relevante Parameter (Angabe von Primer / Zyklenanzahl, Panel)"
  * Geräte-Software-Kits 0..1 Reference(Device) "Geräte / Software / Kits" "Angaben verwendeter Geräte / Software / Kits inklusive Target enrichment für die Analyse (u.U. Angabe von  Hersteller; Versionsnummer)"
  * Getestete-Gene 0..* CodeableConcept "Getestete Gene" "Angabe der getesteten Gene"
  * Referenzsequenz 0..1 CodeableConcept "Referenzsequenz" "Transkript Referenzsequenz (Ensembl und RefSeq)"
  * Read-Depth-Coverage 0..1 CodeableConcept "Read depth/Coverage" "Anzahl der Ablesungen eines bestimmten Nukleotids im Genom in einem Experiment"
  * Intron-Spanning-IVS 0..* string "Intron spanning / IVS" "Intron spanning  oder  IVS (InterVening Sequence, z.B. Introns)"
  * Start-und-Endnukleotid 0..1 Range "Start- und Endnukleotid" "Start- und Endnukleotid"
  * Sensitivitaet-Detektionslimit 0..1 Quantity "Sensitivität/Detektionslimit" "Sensitivität/Detektionslimit"
  * Limitierungen-Bemerkungen 0..* Annotation "Limitierungen/Bemerkungen" "Limitierungen/Bemerkungen, Freitext"
* Ergebnisse 0..* BackboneElement "Ergebnisse"
  * Zusammenfassung 0..1 CodeableConcept "Zusammenfassung"
  * Zusammenfassung from http://loinc.org/vs/LL541-4
  * Veraenderungen 0..* BackboneElement "Veränderungen"
    * Veraenderung-Proteinebene 0..1 CodeableConcept "Veränderungen auf Proteinebene: Terminologie: HGVS - Angabe möglich von: Formal Protein (pHGVS) 3-letter code:  Bsp.: p.(Cys47Tyr),  p.(Val600Glu) - Formal Protein (pHGVS) 1-letter code:  Bsp.: p.(C47Y) - Trivialname (Kurzform):  Bsp.: C47Y" //?
    * DNA-Veraenderungen 0..1 CodeableConcept "Veränderung auf DNA-Level, formale Beschreibung  mittels cHGVS"
    * Genomische-DNA-Veraenderung 0..1 CodeableConcept "Genomische DNA Veränderung gHGVS"
    * Transkript-ID 0..1 CodeableConcept "Transkript- ID (Code) - Terminologie: NCBI, Ensembl, GTR, LRG" 
    * Referenzgenom 0..* CodeableConcept "Referenzgenom - Der Genome Build hat zwei Formate, entweder hg und eine Nummer (hg18, hg19, hg38) oder GRCh/NCBI und eine Nummer (NCBI35, NCBI36, GRCh37, GRCh38)."
    * Ref-Allel 0..1 string "Referenzallel"
    * Alt-Allel 0..1 string "Jedes alternative (ALT) Allel an dem untersuchten Lokus"
    * DNA-Mutationstyp 0..1 CodeableConcept "Varianten-Typ bzw. Mutationsart - Terminologie: Sequence Ontology (include codes from http://sequenceontology.org where concept IsA SO:0002072)"
    * Mutationskonsequenz-Funktionell 0..1 CodeableConcept "Mutationskonsequenz (funktionell) - Terminologie: Sequence Ontology"
    * Mutationskonsequenz-Funktionell from http://loinc.org/vs/LL380-7
    * Proben-Allelfrequenz 0..1 Quantity "Allelfrequenz"
    * Ursprung-der-Variante 0..1 CodeableConcept "Ursprung der Variante"
    * Ursprung-der-Variante from http://loinc.org/vs/LL378-1
    * Varianten-ID 0..* CodeableConcept "Varianten ID; eindeutige Beschreibung der Variante - Terminologie: ClinVar, HGMD, COSMIC, PMID, dbSNP"
    * Chromosom 0..* CodeableConcept "Chromosom"
    * Chromosom from http://loinc.org/vs/LL2938-0
    * Exon 0..* string "Exon"
    * Zytogenetische-Lokalisation 0..* CodeableConcept "Variante - Terminologie: ISCN"
    * Kopienzahlvariationen 0..1 Quantity "Kopienzahlvariationen der betroffenen Gene"
  * Mutationslast 0..1 Quantity "Somat. Mutationen / Mutationslast"
  * Mikrosatelliteninstabilität 0..1 CodeableConcept "Mikrosatelliteninstabilität"
  * Mikrosatelliteninstabilität from http://loinc.org/vs/LL3994-2 (extensible)
  * Daten 0..* Reference(DocumentReference) "Rohdaten / Link auf die Datei/Dateien"
* Interpretation 0..* BackboneElement "Interpretation"
  * Klinische-Signifikanz 0..1 CodeableConcept "Finale Interpretation / Einschätzung"
  * Klinische-Signifikanz from http://loinc.org/vs/LL4034-6 (extensible)
  * Referenzen 0..* Reference(RelatedArtifact) "Referenzen"
  * ClinicalAnnotationLevelOfEvidence 0..* CodeableConcept "Clinical Annotation Level Of Evidence"
  * ClinicalAnnotationLevelOfEvidence from http://hl7.org/fhir/uv/genomics-reporting/ValueSet/evidence-level-example-vs (example)
  * Assoziierter-Phaenotyp 0..* CodeableConcept "Mit Präsenz einer Variante assoziierter Phänotyp"
  * Vererbungsmodus 0..1 CodeableConcept "Art der Vererbung für beschriebenen Phänotyp"
  * Vererbungsmodus from http://hl7.org/fhir/uv/genomics-reporting/ValueSet/condition-inheritance-mode-vs (preferred)
  * Zusammenfassung 0..1 string "Zusammenfassung als Freitext, kann inhaltlich folgende Punkte beinhalten: Antwort auf ursprüngliche Fragestellung ausformuliert Therapeutikum/Wirkstoff/Wirkstoffklasse Effekt/Auswirkung" //?!
  * Medikamentenbewertung 0..* CodeableConcept "Medikamentenbewertung"
  * Empfehlungen 0..1 CodeableConcept "Empfehlungen: Andere/Allgemeine Empfehlungen (Freitext / Links) / Generelle ergänzende Referenz(en) (Bsp: PuMed-link / PMID)" //?
  * Empfehlungen from http://loinc.org/vs/LL1037-2 (extensible)
  * Medikationsempfehlung 0..1 CodeableConcept "Medikationsempfehlung - Terminologie: LOINC"
  * Medikationsempfehlung from http://loinc.org/vs/LL4049-4 (required)
* Weiteres 0..* BackboneElement "WeiteresFormales"
  * Bericht-ID 0..* Identifier "Identifikationsnummer des Berichtes"
  * Anhaenge 0..* Reference(Media or DocumentReference) "Anhänge z.B. Tabellarische Übersicht Panel"
  * Berichtstatus 1..1 code "Berichtstatus (z.B. vorab oder final)"
  * Berichtstatus from http://hl7.org/fhir/ValueSet/diagnostic-report-status (required)
  * Datum-des-Berichts 0..1 instant "Datum des Berichtes /Zeitstempel (Bericht verfasst / freigegeben am)"
  * Labor-Institution-Ansprechpartner 0..* BackboneElement "LaborInstitutionAnsprechpartner"
    * Laborakkreditierungen 0..* CodeableConcept "Labor-Akkreditierungen" 
    * Name-Ansprechpartner 0..* HumanName "Name Ansprechpartner (Titel - Nachname - Zuname - Vorname)"
    * Adresse 0..* Address "Adresszeile 1  & 2, Angabe von Stadt, Postleitzahl, Land"
    * Kontakt 0..* ContactPoint "Angabe von Telefonnummer, Faxnummer und Email"

Mapping: MolGen-LogicalModel
Id: FHIR
Title: "MolGen LogicalModel FHIR Mapping"
Source: MII_LM_MolGen_LogicalModel
* Probeninformation
  * Patient -> "Patient"
  * Probe -> "Specimen"
