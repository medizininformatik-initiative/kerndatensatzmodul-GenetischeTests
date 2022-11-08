Logical: SD_MII_MolGen_Logical_Model
Parent: Base
Id: sd-mii-molgen-logical-model
Title: "SD MII MolGen Logical Model"
Description: "Das Logical Model ist die grafische Darstellung des Art-Decor Modells"

* ^status = #draft

* Probeninformation 1..1 BackboneElement
    * Patient 1..1 BackboneElement "Abgebildet im KDS Person-Modul" //Reference(Patient)??
        * Name BackboneElement
            * Vorname
            * Nachname
            * Familienname
            * Vorsatzwort
            * Namenszusatz
            * Präfix
            * ArtDesPräfix
            * Geburtsname
        * Demographie BackboneElement
            * AdministrativesGeschlecht
            * Geburtsdatum
            * Adresse BackboneElement
                * Postfach BackboneElement
                    * Postfachnummer
                    * Straße
                    * Wohnort
                    * PLZ
                    * Land
                * Strassenanschrift BackboneElement
                    * Land
                    * PLZ
                    * Wohnort
                    * Straße
            * Vitalstatus BackboneElement
                * PatientVerstorben
                * Todeszeitpunkt
                * Informationsquelle
                * LetzterLebendzeitpunkt
    * Probe 0..* BackboneElement "Abgebildet im KDS Biobank-Modul" //Reference(Specimen)?? Kardinalität 0..* durch den Befundbericht
        * Probenart 1..1 SU CodeableConcept "Art der Probe"
        * Entnahmestelle 0..1 SU CodeableConcept "Lokalisation der Körperstelle, von der die Probe stammt"
        * Form 1..1 SU CodeableConcept "Form der Probe" // nicht gefunden
        * Probenmenge 0..1 SU Quantity "" //Keine Beschreibung auf Art-Decor
        * Additiv 0..1 SU CodeableConcept "	Zusatzstoffe im Container"
        * ZusatzLösungsmittelVolumenMengeAnteil 0..1 SU Quantity "Zusatz/Lösungsmittel Volumen/Menge/Anteil" //Kardinalität nicht gefunden!
        * AngegebenerAnteilTumorNeoplastischeZellen 0..1 SU Quantity "Angegebener Anteil Tumor / Neoplastische Zellen" //Kardinalität nicht gefunden!
        * ProbenID 0..* SU Identifier "Einrichtungsinterner Identifier der Probe." // Kardinalität 0..*?
        * EntnamheZeitpunkt 0..1 SU dateTime "Zeitpunkt der Ent- / Abnahme der Probe. Kann zur Berechnung der kalten Ischaemiezeit verwendet werden."
        * EingangsdatumProbe 0..1 SU dateTime "Eingangsdatum Probe" //specimen.receivedTime?
    * SonstigeEigenschaften 0..* SU Annotation "Freitextangabe weiterer Probeneigenschaften"
    * VerbleibNachTestung //nicht gefunden
* IndikationAnforderung 1..* BackboneElement // Kardinalität aus UML
    * Indikation 0..* BackboneElement
        * Indikation 0..* SU CodeableConcept "Indikation; (mögliche) Erkrankung Terminologien: ICD-10, SNOMED, Orpha, HPO - Bsp.: Verdacht auf… / Ausschluss von… / Mögliche Therapie für ..."
        * AktuellerGesundheitszustand 0..* SU Reference(FamilyMemberHistory) "	Aktueller Gesundheitszustand; Angabe aktueller Beschwerden oder nachgewiesener Erkrankung - Terminologie: HPO"
        * KrankengeschichtePatient 0..* SU Reference(FamilyMemberHistory) "Krankengeschichte Patient"
        * KrankengeschichteFamilie 0..* SU Reference(FamilyMemberHistory) "Krankengeschichte Familie"
        * Anlageträger 0..* SU Reference(FamilyMemberHistory) "Anlageträgerstatus der Familie - Ist gefordert wenn Verwandte des Index-Falles ebenfalls sequenziert wurden - Terminologie: PED"
        * ZuvorDurchgeführteTestsMethode 0..* SU Reference(ServiceRequest) "Zuvor durchgeführte Tests Methode"
        * ZuvorDurchgeführteTestsGen 0..* SU Reference(ServiceRequest) "Zuvor durchgeführte Tests Gen (HGVS)"
        * ErgebnisseVorherigerTests 0..* SU Reference(Observation) "Ergebnisse vorheriger Tests"
        * Berichtsverweise 0..* SU Reference(DiagnosticReport) "Sofern vorhanden, Verweis auf internen vorherigen Bericht (Angabe der Report-ID)"
    * Anforderer 0..* BackboneElement "Anforderer" //Reference(Practioner)?
        * AnfordererName 0..* SU HumanName "Anforderer Name (Titel, Nachname, Zunahme, Vorname)"
        * AnfordererAdresse 0..* SU Address "Adresse (Adresszeile, Stadt, Postleitzahl, Land)"
        * AnfordererKontaktdetails 0..* SU ContactPoint "Adresse (Angabe von Telefonnummer, Emailadresse und Faxnummer)"
    * Anforderung 0..1 BackboneElement
        * ZuTestendeGeneID 0..* SU code or string "Zu testende Gene, ID"
        * EinheitlicherBewertungsmaßstab 0..* SU Reference(ChargeItem) ""
        * Anforderungstext 0..1 SU code or string "Freitext für die Angabe von entweder originaler, unveränderter Anforderungstext, oder alternativ: zusätzliche Anforderungen oder angeforderter Test"
    * DatumDerAnforderung 0..1 SU dateTime "Angabe des Eingangsdatums"
    * Bemerkungen // !!!!
* Methoden 1..* BackboneElement
    * Methode 0..1 SU CodeableConcept "Methode und Referenz zur Methode - beinhaltet alle sequenzbasierenden Analytik-Methoden, während nicht sequenzbasierende Aufarbeitungsmethoden in das Modul Pathologie zuzuordnen sind."
    * RelevanteParameter 0..* SU Reference(Observation) "Relevante Parameter (Angabe von Primer / Zyklenanzahl, Panel)"
    * GeräteSoftwareKits 0..1 SU Reference(Device) "Angaben verwendeter Geräte / Software / Kits inklusive Target enrichment für die Analyse (u.U. Angabe von  Hersteller; Versionsnummer)"
    * GetesteteGeneID 0..* SU CodeableConcept "Getestete Gene ID"
    * Referenzsequenz 0..1 SU CodeableConcept "Transkript Referenzsequenz (Ensembl und RefSeq)"
    * ReadDepthCoverage 0..1 SU CodeableConcept "Read depth/Coverage - Anzahl der Ablesungen eines bestimmten Nukleotids im Genom in einem Experiment"
    * IntronSpanningIVS 0..1 SU string "Intron spanning  oder  IVS (InterVening Sequence, z.B. Introns)" //?
    * StartUndEndnukleotid 0..1 SU string "Start- und Endnukleotid"
    * SensitivitätDetektionslimit 0..1 SU CodeableConcept 
    * LimitierungenBemerkungen 0..* SU string "Limitierungen/Bemerkungen, Freitext"
* Ergebnisse 1..1 BackboneElement
    * Zusammenfassung 1..1 SU CodeableConcept "Zusammenfassung"
    * Veränderungen 0..* BackboneElement
        * ProteinebenepHGVS 0..1 SU CodeableConcept "Veränderungen auf Proteinebene: Terminologie: HGVS - Angabe möglich von: Formal Protein (pHGVS) 3-letter code:  Bsp.: p.(Cys47Tyr),  p.(Val600Glu) - Formal Protein (pHGVS) 1-letter code:  Bsp.: p.(C47Y) - Trivialname (Kurzform):  Bsp.: C47Y" //?
        * DNALevelcHGVS 0..1 SU CodeableConcept "Veränderung auf DNA-Level, formale Beschreibung  mittels cHGVS" //?
        * TranskriptID 0..1 SU CodeableConcept "Transkript- ID (Code) - Terminologie: NCBI, Ensembl, GTR, LRG" //CodeableConcept / Count in ArtDecor?
        * LokalisationDNAPosition 0..1 SU CodeableConcept "Lokalisation / DNA-Position" //?
        * Referenzgenom 0..* SU CodeableConcept "Referenzgenom - Der Genome Build hat zwei Formate, entweder hg und eine Nummer (hg18, hg19, hg38) oder GRCh/NCBI und eine Nummer (NCBI35, NCBI36, GRCh37, GRCh38)."
        * AltAllel 0..1 SU string "Jedes alternative (ALT) Allel an dem untersuchten Lokus"
        * DNAMutationtyp 0..1 SU CodeableConcept "Varianten-Typ bzw. Mutationsart - Terminologie: Sequence Ontology (include codes from http://sequenceontology.org where concept IsA SO:0002072)"
        * MutationskonsequenzFunktionell 0..1 SU CodeableConcept "Mutationskonsequenz (funktionell) - Terminologie: Sequence Ontology" //?
        * Allelfrequenz 0..1 SU Quantity "Allelfrequenz"
        * KlassifikationDerVariante 0..1 SU CodeableConcept "Klassifikation der Variante z.B. mit ACMG-Terminologie"
        * VariantenID 0..1 SU CodeableConcept "Varianten ID; eindeutige Beschreibung der Variante - Terminologie: ClinVar, HGMD, COSMIC, PMID, dbSNP"
        * Chromosom 0..* SU CodeableConcept "Chromosom"
        * Exon 0..* SU string "Exon"
        * ZytogenetischeLokalisationLokus 0..* SU CodeableConcept "Variante - Terminologie: ISCN"
        * ZytogenetischeLokalisationStartUndEnde 0..1 SU Count "Zytogenetische Lokalisierung (Start- und Ende)"
        * Kopienzahlvariationen 0..1 SU Quantity "Kopienzahlvariationen der betroffenen Gene"
    * Mutationslast 0..1 SU Quantity "Somat. Mutationen / Mutationslast"
    * Mikrosatelliteninstabilität 0..1 SU CodeableConcept "Mikrosatelliteninstabilität"
    * Daten 0..* SU Reference(DocumentReference) or string or Reference(Media) "Rohdaten / Link auf die Datei/Dateien"
* InterpretationExpertenmeinung BackboneElement //? - Kardinalität nicht gefunden
    * KlinischeSignifikanz 0..1 SU CodeableConcept "Finale Interpretation / Einschätzung"
    * Referenzen 0..1 SU Reference(RelatedArtifact) "Referenzen"
    * ClinicalAnnotationLevelOfEvidence 0..* CodeableConcept "Clinical Annotation Level Of Evidence"
    * AssoziierterPhänotyp 0..* SU CodeableConcept "Mit Präsenz einer Variante assoziierter Phänotyp"
    * Vererbungsmodus 0..1 SU CodeableConcept "Art der Vererbung für beschriebenen Phänotyp"
    * Zusammenfassung 0..1 SU CodeableConcept "Zusammenfassung als Freitext, kann inhaltlich folgende Punkte beinhalten: Antwort auf ursprüngliche Fragestellung ausformuliert Therapeutikum/Wirkstoff/Wirkstoffklasse Effekt/Auswirkung" //?!
    * Medikamentenbewertung //!!!!
    * EmpfehlungenTherapieAllg 0..1 SU CodeableConcept "Empfehlungen: Andere/Allgemeine Empfehlungen (Freitext / Links) / Generelle ergänzende Referenz(en) (Bsp: PuMed-link / PMID)" //?
    * Medikationsempfehlung 1..1 SU CodeableConcept "Medikationsempfehlung - Terminologie: LOINC"
* WeiteresFormales 0..* BackboneElement
    * Beratung 0..1 SU CodeableConcept "1)Fand eine Beratung vorab statt (Ja, Nein, Unbekannt)  2)Wird eine weitere genetische Beratung des Patienten/Angehörigen empfohlen (Ja, Nein, Unbekannt)  3) Weitere empfohlene Analysen oder welche Art der Analyse liegt vor? Bsp.: Test auf erbliche Veranlagung/ Andere Ursache Bsp.: Ist Bestätigungsanalyse, Bestätigungsanalyse empfohlen"
    * BerichtID 0..* SU Identifier "Identifikationsnummer des Berichtes"
    * Anhaenge 0..* SU Reference(Media) or string "	Anhänge (und Seitenzahl) z.B. Tabellarische Übersicht Panel"
    * Berichtstatus 1..1 SU code "Berichtstatus (z.B. vorab oder final)" //In ArtDecor als String
    * DatumDesBerichts 0..1 SU Instant "Datum des Berichtes /Zeitstempel (Bericht verfasst / freigegeben am)"
    * LaborInstitutionAnsprechpartner 0..* BackboneElement //Reference(Practioner)??
        * Laborakkreditierungen 0..* SU Identifier or CodeableConcept "	Labor-Akkreditierungen" //Practitioner.qualification.identifier oder .code?
        * NameAnsprechpartner 0..* SU HumanName "Name Ansprechpartner (Titel - Nachname - Zuname - Vorname)"
        * Adresse 0..* SU Address "Adresszeile 1  & 2, Angabe von Stadt, Postleitzahl, Land"
        * KontaktTelEmailFax 0..* SU ContactPoint "Angabe von Telefonnummer, Faxnummer und Email" //?
