import Foundation

struct Geschenk {
    let name: String
    let wert: Double
    let beschreibung: String
    
    func anzeigen() {
        print("""

        Zugabe:         \(name)
        Warenwert:      \(wert.formatierterPreis) €
        Beschreibung:   \(beschreibung)

    """)
        sleep(1)
    }
}
