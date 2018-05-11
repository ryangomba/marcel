//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "SoundManager.h"

@interface SoundSet ()

@property (nonatomic, strong, readwrite) AVPlayer *player;
@property (nonatomic, strong, readwrite) NSArray *sounds;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation SoundSet

+ (instancetype)soundSetWithSounds:(NSArray *)sounds {
    SoundSet *soundSet = [[SoundSet alloc] init];
    soundSet.player = [[AVPlayer alloc] init];
    soundSet.sounds = sounds;
    return soundSet;
}

- (void)playNextSound {
    NSString *soundName = self.sounds[self.currentIndex];
    NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:@"m4a"];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self.player play];
    
    if (++self.currentIndex >= self.sounds.count) {
        self.currentIndex = 0;
    }
}

@end

@implementation SoundManager

+ (void)configureAudioSession {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                     withOptions:AVAudioSessionCategoryOptionAllowBluetooth
                                           error:nil];
}

@end
