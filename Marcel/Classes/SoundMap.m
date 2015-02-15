//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "SoundMap.h"

@implementation SoundMap

+ (NSDictionary *)soundMap {
    static NSDictionary *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{
                kButtonSounds: @[
                    [SoundSet soundSetWithSounds:@[@"uhh", @"ahh"]],
                    [SoundSet soundSetWithSounds:@[@"guess-bread", @"guess-pen", @"guess-raisin", @"guess-toenails"]],
                    [SoundSet soundSetWithSounds:@[@"hot-between", @"hot-zone"]],
                    [SoundSet soundSetWithSounds:@[@"treats-all", @"treats-look", @"treats-snoozin"]],
                    [SoundSet soundSetWithSounds:@[@"compared-to-what"]],
                    [SoundSet soundSetWithSounds:@[@"lentil", @"daily-life"]],
                    [SoundSet soundSetWithSounds:@[@"what-they-say"]],
                    [SoundSet soundSetWithSounds:@[@"grape-i-know", @"grape-bs", @"grape-but-you-could"]],
                    [SoundSet soundSetWithSounds:@[@"cheese", @"soda", @"lint", @"beg"]],
                    [SoundSet soundSetWithSounds:@[@"party"]],
                    [SoundSet soundSetWithSounds:@[@"alan"]],
                    [SoundSet soundSetWithSounds:@[@"muffin-a", @"muffin-sleep"]],
                ],
        };
    });
    return map;
}

@end
