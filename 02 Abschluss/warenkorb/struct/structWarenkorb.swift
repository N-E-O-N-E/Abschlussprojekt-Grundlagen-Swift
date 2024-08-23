import Foundation

struct Warenkorb: Geschenkoptionen { // mit Protokoll
    
    var produkte: [String: Int] = [:]
    var geschenk: [Geschenk] = []
    var geschenkGrenzen = (1000.00, 1700.00, 2000.00)
    var rabatt: Double = 0
    var rabattpreis: Double = 0
    
    func berechneRabatt(rabatt: Double, preis: Double) -> Double {
    // Rabatt wird berechnet
        return preis - (preis * rabatt)
    }
    
    mutating func hinzufuegen(artikelNr: String, mengeNeu: Int) {
    // ändert im Dict den Value wenn die Artikelnummer stimmt
        
                if let menge = produkte[artikelNr] {
                    produkte[artikelNr] = menge + mengeNeu
                } else {
                    produkte[artikelNr] = mengeNeu
                }
            }
    
    func geschenkOption(warenkorbWert: Double) -> Geschenk? {
    // liefert ein Geschenk in Abhängigkeit des Warenkorbwertes aus dem Array Geschenkeliste
        
        if warenkorbWert <= geschenkGrenzen.0 {
            return geschenkListe[0]
        }
        else if warenkorbWert > geschenkGrenzen.0 && warenkorbWert <= geschenkGrenzen.1 {
            return geschenkListe[1]
        }
        else if warenkorbWert > geschenkGrenzen.1 {
            return geschenkListe[2]
        }
        return nil
    }
    
    mutating func geschenkHinzu(neuesGeschenk: Geschenk) {
    // ein Geschenk wird hinzugefügt und angezeit
        
        geschenk.append(neuesGeschenk)
        geschenk.forEach { Item in
            Item.anzeigen()
        }
        
    }
    
    // Empfängt ein Array vom Typ Produkt und eine String ArtikelNr. Liefert ein Produkt oder nil zurück.
    func findeArtikel(liste: [Produkt], artikelnummer: String) -> Produkt? {
        // Gibt das erste Element im Array zurück bei dem die übergebene Arikelnummer der "artikelNr" in der Liste (Array) entspricht.
        return liste.first { $0.artikelNr == artikelnummer }
    }

    func gesamtpreis(liste: [Produkt]) -> Double {
        var gesamtsumme = 0.0
        
        // durchläuft alle Artikelnummern/Mengen in den Produkten des Warenkorbes
        for (artikelnummer, menge) in produkte {
            
            // speichert den gefundenen Artikel vom Typ Produkt in match
            if let match = findeArtikel(liste: liste, artikelnummer: artikelnummer) {
                gesamtsumme += match.preis * Double(menge)
            } else {
                print("\tProdukt ArtikelNr. \(artikelnummer), nicht gefunden!")
            }
        }
        return gesamtsumme
    }
    
    mutating func warenkorbLeeren() {
    // Löscht alle Artikel im Warenkorb
        produkte.removeAll()
        geschenk.removeAll()
    }
    
    func anzeigen(aktiverKunde: Kunde) {
    // Zeit den Warenkorn für den Kunden an
        
print("""

    ███████╗██╗  ██╗ ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗      ██████╗ █████╗ ██████╗ ████████╗
    ██╔════╝██║  ██║██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝     ██╔════╝██╔══██╗██╔══██╗╚══██╔══╝
    ███████╗███████║██║   ██║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗    ██║     ███████║██████╔╝   ██║
    ╚════██║██╔══██║██║   ██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║    ██║     ██╔══██║██╔══██╗   ██║
    ███████║██║  ██║╚██████╔╝██║     ██║     ██║██║ ╚████║╚██████╔╝    ╚██████╗██║  ██║██║  ██║   ██║
    ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝
    ════════════════════════════════════════════════════════════════════════════════════════════════════

""")
        
        if produkte.isEmpty {
            print("\t🔴 Der Warenkornb ist noch leer!")
        } else {
            print("\t\(aktiverKunde.name), dein Warenkorb enthällt aktuell:")
            
            for (artikelkNr, menge) in produkte {
                let produktMatch = findeArtikel(liste: produkteListe, artikelnummer: artikelkNr)
                
                if let iMac = produktMatch as? IMac {
                    print("""

        Produkt:     \(iMac.name)
        Farbe:       \(iMac.caseColor)
        Stückpreis:  \(iMac.preis.formatierterPreis) €
        Menge:       \(menge) Stück
        Gesamt:      \(((iMac.preis) * Double(menge)).formatierterPreis) €
        Artikel-Nr:  \(artikelkNr)

""")
                }
                if let MacBookAir = produktMatch as? MacBookAir {
                    print("""

        Produkt:     \(MacBookAir.name)
        Prozessor:   \(MacBookAir.prozessor)
        Stückpreis:  \(MacBookAir.preis) €
        Menge:       \(menge) Stück
        Gesamt:      \(((MacBookAir.preis) * Double(menge)).formatierterPreis) €
        Artikel-Nr:  \(artikelkNr)

""")
                }
                if let iPhone = produktMatch as? IPhone {
                    print("""
    
        Produkt:     \(iPhone.name)
        Speicher:    \(iPhone.speicher) GB
        Stückpreis:  \(iPhone.preis) €
        Menge:       \(menge) Stück
        Gesamt:      \(((iPhone.preis) * Double(menge)).formatierterPreis) €
        Artikel-Nr:  \(artikelkNr)
    
""")
                }
                
            } // ende der schleife
            
            let warenWert = gesamtpreis(liste: produkteListe)
            print("\n\t💰 Gesamtwert deines Warenkorbes: \(warenWert.formatierterPreis) EUR")
            print("\n\t🔸 Aktuell hast du \(aktiverKunde.bonuspunkte) Bonuspunkte (\(aktiverKunde.bonuspunkte / 1000) €)")
            
        } // endElse
            
        geschenk.forEach { Item in
            Item.anzeigen()
        }
        
    } // endFunc
} // End Struct
