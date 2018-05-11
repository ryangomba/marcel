//  Copyright 2018 Ryan Gomba. All rights reserved.

import UIKit
import BFPaperButton

class Button: BFPaperButton {

  init() {
    super.init(frame: CGRect.zero)

    self.isRaised = false;
    self.cornerRadius = 0.0;
    self.tapCircleDiameter = bfPaperButton_tapCircleDiameterFull;
    self.layer.borderColor = UIColor.init(white: 1.0, alpha: 0.5).cgColor;
    self.layer.borderWidth = 0.5;
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
