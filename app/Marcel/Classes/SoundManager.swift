//  Copyright 2018 Ryan Gomba. All rights reserved.

import UIKit
import AVKit

class SoundManager: NSObject {

  class func configureAudioSession() {
    try? AVAudioSession.sharedInstance().setCategory(
      AVAudioSessionCategoryPlayback,
      with: AVAudioSessionCategoryOptions.allowBluetooth
    )
  }

}
