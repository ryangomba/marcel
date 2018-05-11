//  Copyright 2018 Ryan Gomba. All rights reserved.

import UIKit
import AVKit

let COLUMN_COUNT = 3

class MainViewController: UIViewController {

  var buttons: [Button] = []
  var player: AVPlayer!

  init() {
    super.init(nibName: nil, bundle: nil)

    var hue: CGFloat = 0.46
    for _ in 0...SoundMap.shared.soundSets.count - 1 {
      let button = Button.init()
      button.backgroundColor = UIColor.init(hue: hue, saturation: 0.85, brightness: 0.85, alpha: 1.0)
      button.addTarget(self, action: #selector(onTap), for: UIControlEvents.touchUpInside)
      self.buttons.append(button)
      hue += 0.01
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // status bar

  override var prefersStatusBarHidden: Bool {
    return true
  }

  // lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    for button in self.buttons {
      self.view.addSubview(button)
    }
  }

  // actions

  func onTap(button: Button) {
    if let index = self.buttons.index(of: button) {
      let soundSet = SoundMap.shared.soundSets[index]
      soundSet.playNextSound()
    }
  }

  // layout

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    let numColumns = COLUMN_COUNT;
    let numRows = ceil(CGFloat(self.buttons.count) / CGFloat(numColumns))
    let buttonWidth = ceil(self.view.bounds.size.width / CGFloat(numColumns))
    let buttonHeight = ceil(self.view.bounds.size.height / CGFloat(numRows))

    for (i, button) in self.buttons.enumerated() {
      let buttonX = buttonWidth * CGFloat(i % numColumns)
      let buttonY = buttonHeight * CGFloat(i / numColumns)
      button.frame = CGRect.init(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
    }
  }

}
