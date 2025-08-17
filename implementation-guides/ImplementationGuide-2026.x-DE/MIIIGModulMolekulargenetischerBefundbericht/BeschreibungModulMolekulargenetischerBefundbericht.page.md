## Beschreibung Modul

Ausführliche Begründung der Modellierung und Intention der FHIR-Profile

Die vorliegende Spezifikation beschreibt die
FHIR-Repräsentation des Kerndatensatz-Erweiterungsmoduls **'Diagnostik | Molekulargenetischer Befundbericht'** der Medizininformatik-Initiative. 

Im Folgenden werden die Use-Cases des Moduls sowie die dazugehörigen FHIR-Profile und Terminologie-Ressourcen in ihrer verbindlichen Form beschrieben.


{{render:ig-bilder-KDS-Module}}

### Scope
#### Out of scope
Die Spezifikation wird zukünftig die strukturierte Erfassung von: 
* Prozessierungsschritten (Bioinformatik-Pipeline inkl. verwendeter Datenbanken und Software) und 
* Ergebnissen von FISH-Analysen 
* RNA-Fusionen und weiterer komplexer Varianten adressieren.</br>

#### In scope
In der aktuellen Version ernmöglicht die Spezifikation die strukturierte Darstellung von:</br>
* Punktvarianten (engl. Single nucleotide variants, SNVs)</br>
* Kopienzahlvarianten (engl. Copy number variation, CNV)</br>
* DNA-Fusionen, in eingeschränkter Form</br>


 

Ein **genetischer Befund** umfasst die Darlegung von Informationen zu genetischen Charakteristika einer humanen Probe. Die Probe kann für Menschen aus „normalem“, transplantiertem oder reproduktivem Gewebe (Spermien, Eizellen) stammen oder aus „abnormalem“ Gewebe, wie beispielweise Tumorgewebe. Außerdem kann die Probe auch in Form von Körperflüssigkeiten wie Blut, Cerebrospinalflüssigkeit oder Urin vorliegen. 
Sequenzinformationen von Pilzen, Viren und Bakterien werden nicht im Molekulargenetischen Befundbericht, sondern im Mikrobiologie-Modul abgebildet.

Typischerweise wird über die DNA (chromosomale oder manchmal auch mitochondriale DNA) der Probe berichtet, der Befund kann jedoch auch Informationen zu RNA und Proteinen enthalten.

Der Begriff **Sequenz** bezieht sich auf eine Reihe von verbundenen Basen-Molekülen, die ein Polymer aus Untereinheiten bilden. Die Basen der DNA und RNA (bzw. ihre monomeren Untereinheiten) sind Nukleotide. Die zur Analyse stehenden Untereinheiten von Proteinen sind Aminosäuren. In Zellen liegen die Polymere, aus denen DNA, RNA und Proteine aufgebaut sind, in unzähligen Molekülen vor. DNA-Polymere strukturieren sich durch Verdichtungen und Bildung weiterer Organisationseinheiten in Chromosomen.

Da DNA-, RNA- und auch Aminosäure-Sequenzen außergewöhnlich lang sein können, wird der Befund typischerweise auf Basis der festgestellten Unterschiede zwischen der Sequenz der zum Test stehenden PatientInnenprobe und einer **Referenzsequenz** verfasst. 
Diese Unterschiede bezeichnet man als **Varianten**. Normalerweise werden Variationen nicht mit der kompletten Sequenz aufgelistet, da die klinische Relevanz der genomischen Tests auf dem Vorliegen einer Abweichung von der Norm innerhalb der Sequenz basiert. Anzumerken ist jedoch, dass eine Sequenz trotzdem Relevanz haben kann, auch wenn keine Veränderungen zur Referenzsequenz vorliegen.

Ergebnisse auf genomischer Ebene (z.B. Wildtyp, einzelne Variante, und gleichzeitig auftretende Varianten) können kollektiv als Haplotypen und Genotypen dargestellt werden. Haplotypen beschreiben genomische Befunde, die nur auf einem Chromosomensatz auftreten. Unter Genotypen versteht man Kombinationen von Haplotypen oder Variationen auf ähnlicher Position beider parentaler Chromosomen.

### Hauptelemente des Befundes ###

Weltweit sind genomische Tests eine Komponente des Leistungsrepertoires von Laboren. Diese Tests stehen LeistungsbringerInnen im Gesundheitswesen zur Diagnose, Prognosestellung und Behandlung von PatientInnen zur Hilfe. Damit ein genetischer Test durchgeführt werden kann, muss sowohl eine Anforderung eines Gesundheitsversorgers als auch eine PatientInnen-Probe vorliegen. 

Das Einzigartige an genomischen Tests ist, dass der Wissenstand kontinuierlich wächst und so genomische Tests aus der Vergangenheit unter Umständen zu einem zukünftigen Zeitpunkt erneut analysiert werden können, um neue Einsichten zu gewinnen. In diesen Fällen werden die genomischen Daten, die erneut analysiert werden sollen, selbst als PatientInnenprobe behandelt und erfordern eine neue Anforderung durch den/die GesundheitsversorgerInnen zur Re-Analyse. 

Wenn ein Labor einen neuen Test in das Angebotsrepertoir aufnimmt und so ÄrztInnen zur Anforderung freistellt, gibt es im Hintergrund eine Vielzahl an Voraussetzungen, die erfüllt werden müssen, bevor eine Anforderung bearbeitet wird und Tests mit der PatientInnen-Probe starten können. Das Labor muss den Test validieren, das beinhaltet die Prüfung der analytischen Sensitivität, Spezifität und Befundung. 

Auf technischer Seite wird in FHIR Ressourcen die Traglast des genomischen Befundberichts durch die HL7 International ***‚DiagnosticReport‘*** FHIR Ressource getragen. Der DiagnosticReport trägt alle Informationen, die durch die genomische Analyse und andere verwandte Elemente wie Anforderung, Probe, etc. erzeugt werden, zusammen. Er organisiert diese Informationen, bietet eine Zusammenfassung und liefert Anmerkungen und Einschätzungen zu den Ergebnissen. 
Er ist die primäre Beantwortung des ***‚ServiceRequest‘***, welcher die Anforderung zur Durchführung der genomischen Tests ist und eine weitere zu verwendende FHIR Ressource darstellt. 

Praktisch können mehrere Anforderungen zu einer einzelnen Sammelanforderung gebündelt werden. Dadurch können mehrere Tests gleichzeitig angefordert werden und die Ergebnisse gruppiert zusammengetragen werden. Ein genomischer Testbefund kann außerdem Ergebnisse verschiedener Testmethoden enthalten. Zum Beispiel können basierend auf dem Ergebnis eines allgemeineren Testes spezifische Tests durchgeführt werden, um zusätzliche Informationen zu gewinnen.

Die Struktur des DiagnosticReport entsteht durch Unterverzeichnisse bzw. Gruppen. Die Struktur dieser Gruppen wird meistens bestimmt durch die Art der Tests/Panels, die angefordert wurden, kann sich jedoch auch nach durchführendem Labor unterscheiden. In manchen Fällen liegt in den Befunden gar keine Unterteilung vor.

Hauptelemente des Befundes sind die Ergebnisse, Interpretationen, Implikationen und Empfehlungen.

Ergebnisse (***Genomic Findings***) im Befund stellen Einblicke (***Observations***) zu den genomischen Charakteristika der untersuchten Probe dar. Es könnten zum Beispiel eine chromosomale Abnormalität (wie die Duplikation eines Chromosoms) oder ein bestimmter Genotyp, Haplotyp oder eine Variante festgestellt werden. Genomische Implikationen (***Genomic Implications***) geben eine Übersicht der Auswirkungen eines oder mehrerer genomischer Ergebnisse, wie ein „schlechtes Ansprechen auf Medikation“. Zu den Hinweisen über Implikationen können Empfehlungen wie „Reduzierung der Dosierung des Medikamentes“ mit angegeben werden.

Die genomische ***Interpretation*** ist eine Gesamtbeurteilung der Ergebnisse der genomischen Tests, die in den Kontext zu dem Anforderungstext gesetzt werden, wie zum Beispiel das eine positives oder negatives Ergebnis vorliegt.

Während einige oder alle dieser Informationen in dem Befund kommuniziert werden können, ist es wichtig anzumerken, dass der behandelnde Mediziner das Gesamtbild zum PatientInnenbefinden kennt, welches über radiologische Befunde und Kenntnisse der PatientInnenhistorie sowie die Auswertung des molekulargenetischen Befundberichtes gebildet wird.

### Detektion und Befundung von Varianten ###

DNA-, RNA- und Aminosäuresequenzen können mittels einer Reihe an Methoden untersucht werden, die unter anderem die direkte Sequenzierung bestimmter Genomregionen, die Gesamtgenomsequenzierung (Whole Genome Sequencing), Microarrays und Massenspektrometrie umfassen.

Der Vergleich der genomischen Sequenz des/der PatientIn mit einer Referenzsequenz unter Anwendung unterschiedlichster Techniken dient der Erkennung von Unterschieden bzw. genomischen Varianten. Jede dieser Techniken kommt mit Einschränkungen, die abgewogen werden müssen, wie die Anwendbarkeit, Kosten, Zeitaufwand, Verfügbarkeit und Präzision. Zum Beispiel können einige Techniken nur für DNA- aber nicht RNA- oder Protein-Sequenzen angewandt werden. Andere können nur bestimmte Veränderungstypen detektieren. 

Auch wenn Variantenbefunde anhand eines Referenzvergleiches viele Anwendungsfälle abdecken, gibt es einige Varianten in der Bevölkerung, für die keine „reguläre“ Referenzsequenz existiert. In diesen Fällen wird oft über die gesamte Sequenz berichtet. Eine bekannte Sequenz kann an dieser Stelle auch als designierte Referenz für den Vergleich herangezogen werden.

Sequenzunterschiede können in verschiedenen Granularitätsebenen auftreten, die von chromosomalen oder polychromosomalen Abnormalitäten zu zusätzlichen oder fehlenden Chromosomen reichen, aber auch großflächige Unterschiede (wie im Fall von Mikrosatellitinstabilitäten) und einzelne Nukleotidveränderungen (Single Nucleotide Polymorphism/Variations, kurz SNP oder SNV) umfassen.

Bekannte genomische Varianten werden oft mit einem **Kode** bezeichnet und innerhalb von Kodesystemen katalogisiert. Damit kann auf einfache Weise das Wissen mit Informationen für eine bestimmte Probe verknüpft werden. Befunde können auf den passenden Kode verweisen und damit hat der/die MedizinerIn dann die Möglichkeit, relevante Informationen, die mit dem Kode assoziiert sind, nachzuschlagen. Jedoch werden manchmal Varianten detektiert, denen noch kein standardisierter Kode zugeordnet wurde. In diesen Fällen wird die Beschreibung der Variante und ihrer Lokalisation im Befund kommuniziert. Selbst wenn ein Kode für die Variante existiert, werden oft detaillierte Beschreibungen des Variantentyps mit in den Befundbericht aufgenommen.


