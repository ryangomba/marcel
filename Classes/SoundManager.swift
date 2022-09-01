import UIKit
import AVKit

class SoundManager: NSObject {
    class func configureAudioSession() {
        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            options: .allowBluetooth
        )
    }
}
