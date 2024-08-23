
import Foundation
import AVFoundation

// Als Struct eingebettet damit die Musik konstant läuft
struct Hintergrundmusik {
    
    var audioPlayer: AVAudioPlayer?
    
    mutating func play() {
        
        let basePath: String = "/Users/markuswirtz/Library/CloudStorage/OneDrive-Persönlich/Dokumente/Entwicklung/Projekte/02-abschluss-N-E-O-N-E/02 Abschluss/"
        let upbeat: String = "\(basePath)/upbeat.mp3"
        let url: URL = URL(fileURLWithPath: upbeat)
        
        do {
            audioPlayer?.prepareToPlay() // ließt die datei vorsichtshalber neu ein
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // endlos
            audioPlayer?.setVolume(0.04, fadeDuration: 100) // lautstärke minimal im Hintergrund
            audioPlayer?.play()
            
        } catch {
            print("Fehler mit der Audiodatei!")
        }
    }
    
    mutating func stop() {
        audioPlayer?.stop()
        newScreen()
    }
    
    mutating func maxMusik() {
        if audioPlayer!.volume < 1.0 {
            audioPlayer!.volume += 0.04
            newScreen()
        } else {
            audioPlayer!.volume = 1.0
            newScreen()
        }
    }
    
    mutating func minMusik() {
        if audioPlayer!.volume >= 0.04 {
            audioPlayer!.volume -= 0.04
            newScreen()
        } else {
            audioPlayer!.volume = 0.0
            newScreen()
        }
    }
    
}//ende Struct
