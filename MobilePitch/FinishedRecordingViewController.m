//
//  FinishedRecordingViewController.m
//  MobilePitch
//
//  Created by Nathan Wallace on 10/25/15.
//  Copyright © 2015 Spark Dev Team. All rights reserved.
//

#import "FinishedRecordingViewController.h"

@interface FinishedRecordingViewController ()

@property (weak, nonatomic) UILabel *timeLabel;

@end

@implementation FinishedRecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timeLabel.text = self.finalTime;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submitButtonTapped {
    
}

- (void)cancelButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadView {
    UIView *view = [[UIView alloc] init];
    self.view = view;
    
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        self.view.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.view.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self.view addSubview:blurEffectView];
    }
    else {
        self.view.backgroundColor = [UIColor blackColor];
    }
    
    // Total time label
    UILabel *totalTimeLabel = [[UILabel alloc] init];
    totalTimeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:totalTimeLabel];
    // Appearance
    totalTimeLabel.text = @"Total Time:";
    totalTimeLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
    totalTimeLabel.textColor = [UIColor whiteColor];
    totalTimeLabel.textAlignment = NSTextAlignmentCenter;
    
    // Time label
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:timeLabel];
    self.timeLabel = timeLabel;
    // Appearance
    timeLabel.text = @"00:00";
    timeLabel.font = [UIFont monospacedDigitSystemFontOfSize:56 weight:UIFontWeightSemibold];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    // Submit button
    UIButton *submitButton = [[UIButton alloc] init];
    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:submitButton];
    [submitButton addTarget:self action:@selector(submitButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    // Appearance
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:48 weight:UIFontWeightSemibold];
    [submitButton setTitleColor:[UIColor colorWithRed:0.984 green:0.741 blue:0.098 alpha:1] forState:UIControlStateNormal];
    submitButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    // Quip label
    UILabel *quipLabel = [[UILabel alloc] init];
    quipLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:quipLabel];
    // Appearance
    quipLabel.text = @"Great Job! You killed it.";
    quipLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightLight];
    quipLabel.textColor = [UIColor whiteColor];
    quipLabel.textAlignment = NSTextAlignmentCenter;
    
    // Cancel button
    UIButton *cancelButton = [[UIButton alloc] init];
    cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(cancelButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    // Appearance
    [cancelButton setTitle:@"Try Again" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
    [cancelButton setTitleColor:[UIColor colorWithRed:0.984 green:0.741 blue:0.098 alpha:1] forState:UIControlStateNormal];
    cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    // AUTOLAYOUT
    NSDictionary *views = NSDictionaryOfVariableBindings(totalTimeLabel, timeLabel, submitButton, quipLabel, cancelButton);
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-62-[totalTimeLabel]-11-[timeLabel]->=50-[submitButton]-11-[quipLabel]->=50-[cancelButton]-36-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    [view addConstraints:verticalConstraints];
    
    [totalTimeLabel.centerXAnchor constraintEqualToAnchor:view.centerXAnchor].active = YES;
    
    [submitButton.centerYAnchor constraintEqualToAnchor:view.centerYAnchor].active = YES;
    
}

@end