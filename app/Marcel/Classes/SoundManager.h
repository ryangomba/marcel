//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

@interface SoundSet : NSObject

@property (nonatomic, strong, readonly) AVPlayer *player;
@property (nonatomic, strong, readonly) NSArray *sounds;

+ (instancetype)soundSetWithSounds:(NSArray *)sounds;

- (void)playNextSound;

@end

@interface SoundManager : NSObject

+ (void)configureAudioSession;

@end
