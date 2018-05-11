//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "SoundManager.h"

static NSString * const kIntroSounds = @"intro";
static NSString * const kBackgroundSounds = @"background";
static NSString * const kButtonSounds = @"buttons";

@interface SoundMap : NSObject

+ (NSDictionary *)soundMap;

@end
