import UIKit

class SoundMap: NSObject {
    public static let shared = SoundMap()
    public let soundSets: [SoundSet]

    override init() {
        self.soundSets = [
            SoundSet.init(sounds: ["uhh", "ahh"]),
            SoundSet.init(sounds: ["guess-bread", "guess-pen", "guess-raisin", "guess-toenails"]),
            SoundSet.init(sounds: ["hot-between", "hot-zone"]),
            SoundSet.init(sounds: ["treats-all", "treats-look", "treats-snoozin"]),
            SoundSet.init(sounds: ["compared-to-what"]),
            SoundSet.init(sounds: ["lentil", "daily-life"]),
            SoundSet.init(sounds: ["what-they-say"]),
            SoundSet.init(sounds: ["grape-i-know", "grape-bs", "grape-but-you-could"]),
            SoundSet.init(sounds: ["cheese", "soda", "lint", "beg"]),
            SoundSet.init(sounds: ["party"]),
            SoundSet.init(sounds: ["alan"]),
            SoundSet.init(sounds: ["muffin-a", "muffin-sleep"]),
        ]
        super.init()
    }

}
