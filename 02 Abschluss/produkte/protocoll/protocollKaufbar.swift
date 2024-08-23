import Foundation

// wird in Produkt verwendet

protocol Kaufbar {
    var preis: Double { get }
    var lagerbestand: Int { get }

    func reduziereLagerbestand(bestand: Int)
}
