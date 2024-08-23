# Konsolenprogramm - Simulation: "Apple Online Store"


---
#### Syntax Institut
##### Teilnehmer: Markus Wirtz
##### Modul: Grundlagen der Programmierung
##### Sprache: Swift
##### IDE: XCode
###
---
Der “Apple Online Store Simulator” ist ein rein fiktives Konsolenprogramm, das im Rahmen meiner 
Abschlussprüfung erstellt wurde. Dieses Programm dient ausschließlich der Demonstration von in der 
Modulprüfung “Grundlagen der Programmierung mit Swift” erlernten Fähigkeiten. Es besteht keinerlei 
Verbindung zu Apple Inc., und das Programm wurde weder von Apple in Auftrag gegeben noch unterstützt. 
Sämtliche Inhalte, Namen und Produkte innerhalb des Simulators dienen lediglich Prüfungszwecken. 

### Das Programm
- Simulation eines interaktives Online-Shop Systems mit eingeschränktem Funktionsumfang
- Umsetzung unter Berücksichtigung der Prüfungsanforderungen (Mindest- und Weiterführende)

## Features
- Login mit zufälligem Captcha
- Registrierungsmöglichkeit 
- Shop mit regelbarer Hintergrundmusik im Hauptmenü
  - Einblick Kundenkonto
  - Produktauswahl für Warenkorb
  - Warenkorb Übersicht
  - Checkout mit verrechnung von:
    - Kontostand, Bonuspunkten, Aktionsrabatt
  - Kaufen/Abmelden oder Beenden als Programmausstieg

- Verwendung von Superklassen und Klassen (Vererbung)
- Verwendung von Structs
- Einsatz von Enums und Protokollen
- Nutzung von Extensions

## Programmablauf

Im Simulator geht es darum sich im ersten Schritt anzumelden bzw. ein neuens Nutzerkonto anzulegen. 
Hier werden Parameter teilweise automatisch generiert. Dies betrifft z.B. Konto- oder Bonuspunktebestand.

Im weiteren verlauf der Simulation kann der Nutzer sein Kundenkonto einsehen, aus einer kleinen Auswahl an
Produkten wählen um diese dann in seinem Warenkorb zu betrachten. Zu jeder zeit im Shop kann der Nutzer an
unterschiedlichen Stellen seinen Kontostand, seinen Punktestand für evtl. Bonuspunkte oder andere
Informationen einsehen. 

Im anschließenden Abschlussprozess werden alle Artikel aufgelistet die der Nutzer kaufen kann. 
Es werden Bonuspunkte und ggf. zufällige Aktionsrabatte mit dem Gesamtpreis verrechnet.
Weiterhin bekommt der Nutzer in abhängigkeit seines Warenkorbwertes ein Geschenk.

An Ende wird der Kunde nach einer Änderung der standardmäßigen Zahlungmethode gefragt.
Eine Zahlungsbestätigung folgt informativ und der Nutzer kann zurück in den Programmfluss.
Beendet wird das Programm über einen Kauf und die Abmeldung oder ein Beenden im Hauptmenü.

Der Simulator deckt alle in den Prüfungsverordnung geforderten Mindestanforderungen, sowie
weiterführende Anforderungen ab und ist daher im Funktionsumfang deutlich eingeschränkt.

Alle verwendeten Bestandteile wie Sounds und ASCII Bilder standen OpenSource bzw. Lizenzfrei zur Verfügung.

---
#### Grundlagen der Programmierung Abschluss - UML V 1.1
[NEONE_Grundlagen_Abschluss_SyntaxUML.pdf](https://github.com/user-attachments/files/16689986/NEONE_Grundlagen_Abschluss_SyntaxUML.pdf)

![NEONE_Grundlagen_Abschluss_SyntaxUML](https://github.com/user-attachments/assets/17d20f36-e050-48c4-98d0-8cf625dba27c)


#### Grundlagen der Programmierung Abschluss - UserFlow V 1.1
[NEONE_Grundlagen_Abschluss_UserFlow PDF](https://github.com/user-attachments/files/16688201/NEONE_Grundlagen_Abschluss_UserFlow.pdf)

![NEONE_Grundlagen_Abschluss_UserFlow](https://github.com/user-attachments/assets/dfaa76b0-c117-47e8-806f-d477b0657cec)

---
Markus Wirtz
