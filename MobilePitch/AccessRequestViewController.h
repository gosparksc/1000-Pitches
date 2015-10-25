//
//  AccessRequestViewController.h
//  MobilePitch
//
//  Created by Nathan Wallace on 10/24/15.
//  Copyright © 2015 Spark Dev Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccessRequestViewControllerDelegate <NSObject>

- (void)updateAuthorizationStatus:(BOOL)granted;

@end

@interface AccessRequestViewController : UIViewController

@property (weak, nonatomic) id<AccessRequestViewControllerDelegate> delegate;

@end
