import Foundation

class IMac: Produkt {
    
    let caseColor: String
    
    init(artikelNr: String, name: String, preis: Double, lagerbestand: Int, caseColor: String) {
        self.caseColor = caseColor
        super.init(artikelNr: artikelNr, name: name, preis: preis, lagerbestand: lagerbestand)
    }
    
    override func anzeigen() {
        print("\tName: \(name), Preis: \(preis) EUR, Farbe: \(caseColor)")
    }
    
    
    
    
}
