import Foundation

struct Shop: Shopsystem {
    
    var produkte: [Produkt]
    var kunden: [Kunde]
    var tagesDeals: [Double]
    var status: ShopStatus {
        didSet {
            if status == .bestellbestaetigung  {
                print()
                print("\tDein Warenkorb wird geladen!\n")
                for _ in 1...5 {
                    print("\t🛍️", terminator: " ")
                    Thread.sleep(forTimeInterval: 0.2)
                }
                newScreen()
            } else if status == .bestellabschluss{
                print()
                print("\tDer Zahlungsprozess wird geladen!\n")
                for _ in 1...5 {
                    print("\t💰", terminator: " ")
                    Thread.sleep(forTimeInterval: 0.2)
                }
                newScreen()
            } else if status == .shopping{
                print()
                print("\tDaten werden geladen...\n")
                for _ in 1...5 {
                    print("\t⌛️", terminator: " ")
                    Thread.sleep(forTimeInterval: 0.2)
                }
                newScreen()
            }
        } // end didSet
    } // end Status
    
    init(produkte: [Produkt], kunden: [Kunde], status: ShopStatus) {
        self.produkte = produkte
        self.kunden = kunden
        self.tagesDeals = [0.05, 0.10, 0.15, 0.20, 0.25]
        self.status = status
    }
    
    mutating func startShopping(aktiverKunde: Kunde) {
        // Shopping startet mit einem übergebenen Typ Kunden -------------------------------------------------------------
        
        ladenAnzeigen() // Ladebalken
        var programmLaeuft = true
        
        repeat { // läuft solange programmLäuft auf true
            
            let shopUser: Kunde = aktiverKunde
            let randDeal = tagesDeals.randomElement()!
            
            print("""
            
                ╔════════════════════════════════════════════════════════════════════════════════════════╗
                ║  █████╗ ██████╗ ██████╗ ██╗     ███████╗    ███████╗████████╗ ██████╗ ██████╗ ███████╗ ║
                ║ ██╔══██╗██╔══██╗██╔══██╗██║     ██╔════╝    ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝ ║
                ║ ███████║██████╔╝██████╔╝██║     █████╗      ███████╗   ██║   ██║   ██║██████╔╝█████╗   ║
                ║ ██╔══██║██╔═══╝ ██╔═══╝ ██║     ██╔══╝      ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝   ║
                ║ ██║  ██║██║     ██║     ███████╗███████╗    ███████║   ██║   ╚██████╔╝██║  ██║███████╗ ║
                ║ ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚══════╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝ ║
                ╚════════════════════════════════════════════════════════════════════════════════════════╝
                        
            
                        ████████████████████████  WILLKOMMEN IM STORE  ███████████████████████████
            
            
            
            """)
            
            print("""
    
        Kundenprofil von \(shopUser.name) - Kunden-Nr.: \(shopUser.kundenNr)
        ---------------------------------------------------------
    
        1) 🙍‍♂️ Mein Kundenkonto
        2) 🛍️ Produkte aussuchen
        3) 🛒 Warenkorb anzeigen
        4) 💳 Bestellung abschließen
    
        5) 🚪 Benutzer abmelden
    
    """)
            print("\tViel Spaß beim Shoppen.\n\tTriff eine Auswahl ▶︎ ", terminator: " ")
            let usereingabe = readLine()!
            let auswahl = Int(usereingabe)
            
            switch auswahl {

            case 1: // Kundenkonto anzeigen ---------------------------------------------------------
                
                status = ShopStatus.shopping // wichtig für Ladeanimation
                
                print("""
    
         █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
        ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
        ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║
        ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║
        ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║
        ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝
        ═════════════════════════════════════════════════════════════
        
        🆔 KundenNr        \(shopUser.kundenNr)
        🔑 Passwort        \(shopUser.passwort)
        🙍‍♂️ Kunde           \(shopUser.name)
        💰 Kontostand      \(shopUser.kontostand.formatierterPreis) EUR
        🔸 Bonuspunkte     \(shopUser.bonuspunkte)
    
        Dein Bonuskonto entspricht aktuell
        einem Wert von: \(shopUser.bonuspunkte / 1000) EUR
    
    """)
                beliebigetaste()

            case 2: // Produktauswahl ----------------------------------------------------------------------------
                
                status = ShopStatus.shopping
                
                let maxIndex = produkteListe.count
                var betragBonuspunkte: Double
                
                repeat {
                    
                    produkteAnzeigen() // ruft die anzeige der produktliste auf
                    
                    print()
                    print("\t🔍 Wähle zwischen \(produkteListe.startIndex + 1) und \(produkteListe.endIndex) aus dem Sortiment.")
                    print("\t❓ Triff eine Auswahl oder mit <ENTER> zum Menü ▶︎ ", terminator: "")
                    
                    // stellt sicher das Kundeneingabe ein Int ist und ggf. ein leerer String
                    if let kundenauswahl = Int(readLine() ?? "") {
                        
                        if kundenauswahl <= maxIndex {
                            
                            let kundenauswahlProdukt = produkte[kundenauswahl - 1]
                            betragBonuspunkte = kundenauswahlProdukt.preis
                            // Betrag als grundlage zur punkteberechnung
                            
                            if kundenauswahlProdukt.lagerbestand >= 1 {
                                
                                print("\t🙂 Super, du hast dich für ein \(kundenauswahlProdukt.name.split(separator: " ")[1]) entschieden.")
                                sleep(1)
                                
                                kundenauswahlProdukt.anzeigen()
                                // Zeigt den zweiten Teil [1] des Poduktnamen an da er danach beim Leerzeichen abschneiden " "
                                
                                sleep(1)
                                
                                print("\t🤷‍♂️ Möchtest du mehr als ein Gerät kaufen? (j/n): ", terminator: " ")
                                let auswahl = readLine()!
                                
                                switch auswahl {
                                    
                                case "j":
                                    
                                    print("\t❓ Wieviele möchtest du kaufen ▶︎ ", terminator: " ")
                                    
                                    guard let mengeAuswahl = Int(readLine()!) else {
                                        keineGueltigeAuswahl()
                                        continue
                                    }
                                    // guard let fürht seinen Code aus wenn nichts eingebeben wird
                                    
                                    if mengeAuswahl > 0 { // mengenangabe größer 0
                                        
                                        if mengeAuswahl < kundenauswahlProdukt.lagerbestand { // menge kleiner als aktueller Lagerbestand
                                            
                                            print("\t🛍️ \(mengeAuswahl) Stk. wurden dem Warenkorb hinzugefügt!\n")
                                            
                                            kundenauswahlProdukt.reduziereLagerbestand(bestand: mengeAuswahl)
                                            
                                            shopUser.warenkorb.hinzufuegen(artikelNr: kundenauswahlProdukt.artikelNr, mengeNeu: mengeAuswahl)
                                            
                                            shopUser.bonuspunkteAktualisieren(betrag: betragBonuspunkte * Double(mengeAuswahl))
                                            
                                            beliebigetaste()
                                            break
                                            
                                        } else {
                                            
                                            print("\t⭕️ Leider ist unser Lagerbestnd zu gering.")
                                            print("\t🛍️ Es wurden dir nur \(kundenauswahlProdukt.lagerbestand) Stk in den Warenkorb gelegt!")
                                            
                                            shopUser.warenkorb.hinzufuegen(artikelNr: kundenauswahlProdukt.artikelNr, mengeNeu: kundenauswahlProdukt.lagerbestand)
                                            
                                            kundenauswahlProdukt.reduziereLagerbestand(bestand: kundenauswahlProdukt.lagerbestand)
                                            
                                            shopUser.bonuspunkteAktualisieren(betrag: betragBonuspunkte * Double(mengeAuswahl))
                                            
                                            beliebigetaste()
                                        }
                                        
                                    } else {
                                        keineGueltigeAuswahl()
                                    }
                                    
                                case "n":
                                    print()
                                    print("\t👍 Dein Produkt wurde 1x dem Warenkorb hinzugefügt! \n")
                                    shopUser.warenkorb.hinzufuegen(artikelNr: kundenauswahlProdukt.artikelNr, mengeNeu: 1)
                                    
                                    kundenauswahlProdukt.reduziereLagerbestand(bestand: 1)
                                    shopUser.bonuspunkteAktualisieren(betrag: betragBonuspunkte)
                                    
                                    beliebigetaste()
                                    break
                                    
                                default:
                                    keineGueltigeAuswahl()
                                    break
                                }
                                
                            } else {
                                print("\tLeider ist dieses Modell nicht mehr an Lager. Aktueller Lagerbestand: \(kundenauswahlProdukt.lagerbestand) Stück")
                                print("\tDie Artikelübersicht wird dir gleich wieder angezeigt! \n")
                                sleep(1)
                            }
                            
                        } else {
                            keineGueltigeAuswahl()
                            
                        }
                        
                    } else {
                        print("\t👍 Es geht zurück ins Hauptmenü!")
                        sleep(1)
                        break
                        //startShopping(aktiverKunde: shopUser)
                    }
                    
                } while true // läuft endlos bis break sie unterbricht
                
                
            case 3: // Warenkorb anzeigen --------------------------------------------------------------
                
                status = ShopStatus.bestellbestaetigung
                shopUser.warenkorb.anzeigen(aktiverKunde: shopUser)
                print()
                beliebigetaste()
                
                
            case 4: // Zahlung und Checkout --------------------------------------------------------------
                
                status = ShopStatus.bestellabschluss
                
                print("""
    
         ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗ ██████╗ ██╗   ██╗████████╗
        ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔═══██╗██║   ██║╚══██╔══╝
        ██║     ███████║█████╗  ██║     █████╔╝ ██║   ██║██║   ██║   ██║
        ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██║   ██║██║   ██║   ██║
        ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗╚██████╔╝╚██████╔╝   ██║
        ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝
        ══════════════════════════════════════════════════════════════════
    
    """)
                var gesamtpreis = shopUser.warenkorb.gesamtpreis(liste: produkteListe)
                let bonuspunkte = shopUser.bonuspunkte
                let bonuspunkteBetrag = Double(bonuspunkte / 1000)
                
                if gesamtpreis > 0 {
                    
                    print("\tHallo \(shopUser.name), Hier findest du eine kurze Übersicht.\n")
                    print("\tMenge\tArtikelname/Feature")
                    print("\t-------------------------------------------------")
                    
                    for (artikelNr, menge) in shopUser.warenkorb.produkte {
                        let produktMatch = shopUser.warenkorb.findeArtikel(liste: produkteListe, artikelnummer: artikelNr )
                        
                        if let iMac = produktMatch as? IMac {
                            let name_ = iMac.name
                            let feature_ = iMac.caseColor
                            print("\t\(menge)\t\t\(name_)\t\tFarbe: \(feature_)")
                        }
                        if let MacBookAir = produktMatch as? MacBookAir {
                            let name_ = MacBookAir.name
                            let feature_ = MacBookAir.prozessor
                            print("\t\(menge)\t\t\(name_)\t\tProzessor: \(feature_)")
                        }
                        if let iPhone = produktMatch as? IPhone {
                            let name_ = iPhone.name
                            let feature_ = iPhone.speicher
                            print("\t\(menge)\t\t\(name_)\t\tRAM: \(feature_) GB")
                        }
                        
                        
                    }
                    
                    print()
                    print("\tWarenkorb Gesamtwert: \(gesamtpreis.formatierterPreis) €")
                    print("\tAktuelle Bonuspunkte: \(bonuspunkte) (\(bonuspunkteBetrag) €)\n")
                    
                    // Geschenk auswahl auf Basis des Wertes aller Artikel
                    let auswahlGeschenk = shopUser.warenkorb.geschenkOption(warenkorbWert: gesamtpreis)
                    if let geschenk = auswahlGeschenk {
                        print("\t🎁 Geschenk erhalten!")
                        shopUser.warenkorb.geschenkHinzu(neuesGeschenk: geschenk)
                        
                    }
                    
                    beliebigetaste()
                    
                    let rabattPreis = shopUser.warenkorb.berechneRabatt(rabatt: randDeal, preis: gesamtpreis)
                    let prozentFormatiert = randDeal.alsProzent
                    
                    print("\n\t🔥 BlackWeek! Heute ist alles \(prozentFormatiert) reduziert!")
                    print("\t🔥 Heute zahlst du statt \(gesamtpreis.formatierterPreis) € nur \(rabattPreis.formatierterPreis) €\n")
                    
                    sleep(1)
                    
                    gesamtpreis = rabattPreis // neuer Preis mit Rabatt
                    let endpreis = gesamtpreis - bonuspunkteBetrag
                    
                    sleep(1)
                    
                    print("\tDeine Bonuspunkte werden jetzt auf den Warenkorbwert angerechnet! \n")
                    shopUser.bonuspunkteReduzieren(punkte: bonuspunkte)
                    
                    print("\t🔥 Es wurden dir Bonuspunkte im Wert von: \(gesamtpreis - endpreis) € gutgeschrieben!\n")
                    print("\t🔥 Du zahlst von \(gesamtpreis.formatierterPreis) € nur noch \(endpreis.formatierterPreis) €\n")
                    
                    sleep(1)
                    
                    shopUser.zahlungsmethodeAendern()
                    
                    sleep(1)
                    print()
                    shopUser.kontostandReduzieren(betrag: endpreis)
                    
                    print("\t>>>>> Die Zahlung war erfolgreich! Vielen Dank für deinen Einkauf! <<<<<")
                    print("\t████████████████████████████████████████████████████████████████████████\n\n")
                    
                    aktiverKunde.warenkorb.warenkorbLeeren()
                    
                    beliebigetaste()
                    
                } else {
                    print("\t🔴 Du hast keine Artikel im Warenkorb!\n")
                    beliebigetaste()
                    break
                    //startShopping(aktiverKunde: shopUser)
                }
                
            case 5: // Abmelden ----------------------------------------------------------------------------
                
                // Produkte aus dem Warenkorb müssen wieder zurückgebucht werden
                
                aktiverKunde.warenkorb.produkte.forEach { artikel in
                    produkteListe.forEach { treffer in
                        if treffer.artikelNr == artikel.key {
                            treffer.erhoeheLagerbestand(bestand: artikel.value)
                        }
                    }
                }
                
                aktiverKunde.warenkorb.warenkorbLeeren()
                programmLaeuft = false
                break
                
            default:
                print("\t❌ Du musst eine gültige Auswahl treffen!")
                sleep(1)
                break
                
            } // ende Switch
            
        } while programmLaeuft
        
    } //ende StartShopping funktion
    
} // endScruct
