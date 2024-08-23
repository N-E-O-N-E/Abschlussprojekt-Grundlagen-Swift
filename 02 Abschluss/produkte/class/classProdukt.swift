import Foundation

open class Produkt: Kaufbar {
    var lagerbestand: Int
    let artikelNr: String
    let name: String
    let preis: Double
    
    init(artikelNr: String, name: String, preis: Double, lagerbestand: Int) {
        self.artikelNr = artikelNr
        self.name = name
        self.preis = preis
        self.lagerbestand = lagerbestand
    }
    
    func reduziereLagerbestand(bestand: Int) {
        lagerbestand -= bestand
    }
    
    func erhoeheLagerbestand(bestand: Int) {
        lagerbestand += bestand
    }
    
    func anzeigen() {
        print("Lagerbestand: \(lagerbestand)\t\(name) für \(preis) EUR")
    }
}
