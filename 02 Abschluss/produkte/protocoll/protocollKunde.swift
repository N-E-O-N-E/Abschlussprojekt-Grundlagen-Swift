import Foundation


protocol Kundendaten {
    
    var kundenNr: String { get set }
    var name: String { get }
    var passwort: String { get set }
    var kontostand: Double { get set }
    var bonuspunkte: Int { get set }
    var warenkorb: Warenkorb { get set }
    var zahlungsart: Zahlungsmethode { get set}
    
    func kundeHinzufuegen(neuerKunde: Kunde)
    
    func kontostandReduzieren(betrag: Double)
    
    func bonuspunkteAktualisieren(betrag: Double)
    
    func bonuspunkteReduzieren(punkte: Int)
    
}
