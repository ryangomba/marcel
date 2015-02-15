//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

#import "SoundMap.h"
#import "Button.h"

static NSInteger const kColumnCount = 3;

@interface ViewController ()

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController

#pragma mark -
#pragma mark NSObject

- (instancetype)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        //
    }
    return self;
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

    for (UIButton *button in self.buttons) {
        [self.view addSubview:button];
    }
}


#pragma mark -
#pragma mark Properties

- (NSArray *)buttons {
    if (!_buttons) {
        CGFloat hue = 0.46;
        NSArray *soundSets = [SoundMap soundMap][kButtonSounds];
        NSMutableArray *buttons = [NSMutableArray array];
        for (NSInteger i = 0; i < soundSets.count; i++) {
            Button *button = [[Button alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor colorWithHue:hue saturation:0.85 brightness:0.85 alpha:1.0];
            [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
            [buttons addObject:button];
            hue += 0.01;
        }
        _buttons = buttons;
    }
    return _buttons;
}


#pragma mark -
#pragma mark Listeners

- (void)onTap:(UIButton *)button {
    NSInteger index = [self.buttons indexOfObjectIdenticalTo:button];
    SoundSet *soundSet = [SoundMap soundMap][kButtonSounds][index];
    [soundSet playNextSound];
}


#pragma mark -
#pragma mark Layout

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSInteger numColumns = kColumnCount;
    NSInteger numRows = ceilf(self.buttons.count / (CGFloat)numColumns);
    NSInteger buttonWidth = ceilf(self.view.bounds.size.width / numColumns);
    NSInteger buttonHeight = ceilf(self.view.bounds.size.height / numRows);
    
    [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger i, BOOL *stop) {
        CGFloat buttonX = buttonWidth * (i % numColumns);
        CGFloat buttonY = buttonHeight * (i / numColumns);
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    }];
}

@end
