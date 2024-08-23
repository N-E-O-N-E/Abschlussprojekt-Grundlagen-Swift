import Foundation


// Wird im Warenkorb verwendet

protocol Geschenkoptionen {
    
    var geschenk: [Geschenk] { get set}
    var geschenkGrenzen: (Double, Double, Double) { get set }
    
    func geschenkOption(warenkorbWert: Double) -> Geschenk?
    mutating func geschenkHinzu(neuesGeschenk: Geschenk)
}
