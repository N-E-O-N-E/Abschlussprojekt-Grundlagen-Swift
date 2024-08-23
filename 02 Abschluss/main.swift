import Foundation

func start() {
    var programmLaeuft = true
    var captchaPruefung = false
    
    repeat {
        
        
        
        print("""
        
            ██     ██ ██ ██      ██      ██   ██  ██████  ███    ███ ███    ███ ███████ ███    ██
            ██     ██ ██ ██      ██      ██  ██  ██    ██ ████  ████ ████  ████ ██      ████   ██
            ██  █  ██ ██ ██      ██      █████   ██    ██ ██ ████ ██ ██ ████ ██ █████   ██ ██  ██
            ██ ███ ██ ██ ██      ██      ██  ██  ██    ██ ██  ██  ██ ██  ██  ██ ██      ██  ██ ██
             ███ ███  ██ ███████ ███████ ██   ██  ██████  ██      ██ ██      ██ ███████ ██   ████
        
            ██████████████ Herzlich Willkommen in unserem neuen Apple OnlineStore. ██████████████
                                                                            🔈 Musik (p)(s)(+)(-)
                                                    .88
                                                  .888'
                                                  888'
                                                  88'
                                     .88888888888. .88888888888.
                                   .88888888888888888888888888888.
                                 .88888888888888888888888888888888.
                                .&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                 `00000000000000000000000000000000'
                                  `000000000000000000000000000000'
                                    `###########################'
                                      `#######################'
                                        `#########''########'
        
            █████████████████████  (L)ogin  (R)egistrieren  (B)eenden  ███████████████████████████
        """)
        
        print("\tWähle einen Menüpunkt ▶︎ ", terminator: "")
        guard let auswahl = readLine(), !auswahl.isEmpty else {
            print("\t❌ Du musst eine gültige Auswahl treffen!")
            newScreen()
            continue // bricht nicht ab
        }
        
        switch auswahl.lowercased() {
            
        case "l":
            
            ladenAnzeigen()
            
            print("""
                
                                                            .88
                                                          .888'
                                                          888'
                                                          88'
                                             .88888888888. .88888888888.
                                           .88888888888888888888888888888.
                                         .88888888888888888888888888888888.
                                        .&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                        `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                         `00000000000000000000000000000000'
                                          `000000000000000000000000000000'
                                            `###########################'
                                              `#######################'
                                                `#########''########'
            
              
                                       ██       ██████   ██████  ██ ███    ██
                                       ██      ██    ██ ██       ██ ████   ██
                                       ██      ██    ██ ██   ███ ██ ██ ██  ██
                                       ██      ██    ██ ██    ██ ██ ██  ██ ██
                                       ███████  ██████   ██████  ██ ██   ████
            
                ██████████████ Herzlich Willkommen in unserem neuen Apple OnlineStore. ██████████████
                                                                                                  
            """)
            
            print("\tWie ist deine Kundennummer:", terminator: " ")
            let eingabe_Kundennummer = readLine() ?? ""
            
            print("\tWie ist dein Passwort:", terminator: " ")
            let eingabePasswort = readLine() ?? ""
            
            if let gefundenerKunde = findeKundeLogin(kundeListe: kundenListe, kundenNr: eingabe_Kundennummer.capitalized, passwort: eingabePasswort) {
                
                if captchaPruefung == false {
                    
                    let richtigesCaptcha = captchaBilder()
                    
                    print("\tWas siehst du für ein Bild ▶︎ ", terminator: "")
                    
                    let eingabe = readLine()?.lowercased() ?? ""
                    
                    if eingabe == richtigesCaptcha.lowercased() {
                        print("\tSuper, CAPTCHA gelöst!")
                        
                        captchaPruefung = true
                        shop_1.startShopping(aktiverKunde: gefundenerKunde)
                        
                    } else {
                        print("\tCAPTCHA fehlgeschlagen. Bitte versuche es nochmal.")
                        
                    }
                }
                else {
                    shop_1.startShopping(aktiverKunde: gefundenerKunde)
                }
                
            } else {
                print("\t❌ Anmeldung fehlgeschlagen!")
                newScreen()
                sleep(1)
            }
            
        case "r":
            
            ladenAnzeigen()
            
            print("""
            
                                                            .88
                                                          .888'
                                                          888'
                                                          88'
                                             .88888888888. .88888888888.
                                           .88888888888888888888888888888.
                                         .88888888888888888888888888888888.
                                        .&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                        `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                         `00000000000000000000000000000000'
                                          `000000000000000000000000000000'
                                            `###########################'
                                              `#######################'
                                                `#########''########'
            
            
                               ██████  ███████  ██████  ██ ███████ ████████ ██████
                               ██   ██ ██      ██       ██ ██         ██    ██   ██
                               ██████  █████   ██   ███ ██ ███████    ██    ██████
                               ██   ██ ██      ██    ██ ██      ██    ██    ██   ██
                               ██   ██ ███████  ██████  ██ ███████    ██    ██   ██ ██
                                                                    
                ██████████████ Herzlich Willkommen in unserem neuen Apple OnlineStore. ██████████████
                                                                                                  
            """)
            
            func aktivenKundenAnlegen() -> Kunde? {
                
                print("\tGib deinen Vor- und Nachnamen für das neue Konto ein:", terminator: " ")
                guard let name = readLine(), !name.isEmpty else {
                    print("\t❌ Du musst einen gültigen Namen eingeben!")
                    newScreen()
                    sleep(1)
                    return nil
                }
                print("\tVergib ein Passwort:", terminator: " ")
                guard let passwort = readLine(), !passwort.isEmpty else {
                    print("\t❌ Du musst ein gültiges Passwort eingeben!")
                    newScreen()
                    sleep(1)
                    return nil
                }
                
                let neuerKunde = Kunde(kundenNr: "K" + "\(Int.random(in: 100...999))", name: name, passwort: passwort)
                
                return neuerKunde
            }
            
            if let gueltigerKunde = aktivenKundenAnlegen() {
                gueltigerKunde.kundeHinzufuegen(neuerKunde: gueltigerKunde)
                shop_1.startShopping(aktiverKunde: gueltigerKunde)
            }
            
        case "b":
            print("\n    >>> Vielen Dank für deinen Besuch. Bis Bald 🙋‍♂️")
            sleep(1)
            musik.stop()
            newScreen()
            programmLaeuft = false
            
        case "+":
            musik.maxMusik()
        case "-":
            musik.minMusik()
        case "p":
            musik.play()
        case "s":
            musik.stop()
            
        default:
            print("\n    !!! Fehler bei Laden - einen Moment geduld... !!! ")
            newScreen()
            
        } // endSwitch
        
    } while programmLaeuft
    
} //endFuncStart

beliebigetaste()
musik.play()
intro()
ladenAnzeigen()
start()
