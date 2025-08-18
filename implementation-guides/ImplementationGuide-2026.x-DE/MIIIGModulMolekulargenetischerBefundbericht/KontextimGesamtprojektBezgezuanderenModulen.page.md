## Kontext im Gesamtprojekt / Bezüge zu anderen Modulen

### Beziehung zum Modul Person ###
Die Zuordnung der Ergebnisse des Befundes zu einem/einer PatientIn, der/die in der Anforderung des Befundes spezifiert wird, sowie die Zuordnung des/der AnforderIn (GesundheitsdienstleisterIn) des Befundes und der Ansprechsperson am durchführenden Labor erfolgt über Referenzen vom Modul MOLEKULARGENETISCHER BEFUNDBERICHT zum MODUL [PERSON](https://simplifier.net/mii-basismodul-person-2024).

### Beziehung zum Modul Bioproben ###
Das Modul MOLEKULARGENETISCHER BEFUNDBERICHT referenziert für die Erfassung der Charakteristika der zur Analyse verwendeten Probe das Modul [BIOBANK](https://simplifier.net/medizininformatikinitiative-modulbiobank) .

### Beziehung zum Modul Fall ###
Die Anforderung der molekulargenetischen Tests erfolgt auf Grundlage der Vorstellung eines/einer PatientIn bei einem/einer GesundheitsdienstleisterIn (*encounter*) und wird referenziert über das Modul [FALL](https://simplifier.net/medizininformatikinitiative-modulfall) .

### Beziehung zum Modul Pathologiebefund ###
Molekulargenetische Tests können auf Basis von auffälligen Ergebnissen eines vorliegenden Pathologiebefundes angefordert werden. Dieser sollte dann als supportingInfo referenziert werden über das Modul [Pathologiebefund](https://simplifier.net/medizininformatikinitiative-modulpathologie).

### Beziehung zum Modul Onkologie ###
Das Modul nutzt die Varianten-Profil des oBDS. In den Krebsregisterdaten gibt es zwei Datenelemente ( Beschreibung und Ausprägung einer Genetischen Variante), wobei die Beschreibung der Variante nicht strukturiert im HGVS-Format, sondern als Freitext. Die Standorte haben hier die Möglichkeit, die Variante direkt aus dem oBDS zu übernehmen oder nach Möglichkeit mit weiteren lokal verfügbaren strukturierten Informationen anzureichern

### Beziehung zum Modul Molekulares Tumorboard ###
Das Modul Molekulares Tumorboard nutzt dieses Modul als Grundlage für die Modellierung eines NextGenerationSequencing-Reports, insbesondere zur Darstellung der verschiedenen Varianten und molekularen Biomarker.

### Beziehung zum Modul Seltene Erkrankungen ###
Das neue Modul Seltene Erkrankungen besitzt keine eigenständigen Profile für Molekualrgentische Untescuchungen, sondnern verweist bei der Darstellung von molekulargenetischen Daten auf dieses Modul, insbesondere weil die Anforderungen für Gendiagnotik seltener Erkrankungen bereits bei der Erstellung dem Moduls Molekuargenetischer Befundbericht berücksichtigt wurden. 