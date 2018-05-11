//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "Button.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame raised:NO]) {
        self.cornerRadius = 0.0;
        self.tapCircleDiameter = bfPaperButton_tapCircleDiameterFull;
        self.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.25].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

@end
