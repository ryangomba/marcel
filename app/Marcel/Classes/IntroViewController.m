//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "IntroViewController.h"

#import <AVFoundation/AVFoundation.h>

#import "ViewController.h"

@interface IntroViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation IntroViewController

#pragma mark -
#pragma mark NSObject

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark -
#pragma mark Status Bar

- (BOOL)prefersStatusBarHidden {
    return YES;
}


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:184.0/255.0
                                                green:250.0/255.0
                                                 blue:235.0/255.0
                                                alpha:1.0];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(onTap)];
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:self.imageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onAudioDidFinish)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:self.player.currentItem];
}


#pragma mark -
#pragma mark Properties

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.image = [UIImage imageNamed:@"marcel"];
        _imageView.contentMode = UIViewContentModeCenter;
    }
    return _imageView;
}

- (AVPlayer *)player {
    if (!_player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"intro" withExtension:@"m4a"];
        AVAsset *asset = [AVAsset assetWithURL:url];
        AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithAsset:asset];
        _player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    }
    return _player;
}


#pragma mark -
#pragma mark Listeners

- (void)onTap {
    [self.player pause];
    [self moveOn];
}

- (void)onAudioDidFinish {
    [self moveOn];
}


#pragma mark -
#pragma mark Private

- (void)moveOn {
    ViewController *vc = [[ViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}


#pragma mark -
#pragma mark Layout

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.imageView.frame = self.view.bounds;
}

@end
