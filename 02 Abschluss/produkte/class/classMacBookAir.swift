import Foundation

class MacBookAir: Produkt {
    
    let prozessor: String
    
    init(artikelNr: String, name: String, preis: Double, lagerbestand: Int, prozessor: String) {
        self.prozessor = prozessor
        super.init(artikelNr: artikelNr, name: name, preis: preis, lagerbestand: lagerbestand)
    }
    
    override func anzeigen() {
        print("\tName: \(name), Preis: \(preis) EUR, Prozessor: \(prozessor)")
    }
    
}
