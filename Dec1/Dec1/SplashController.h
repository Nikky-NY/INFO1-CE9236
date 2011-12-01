//
//  SplashController.h
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GameViewController.h"
#include "SetUpViewController.h"

@interface SplashController : UIViewController <UITabBarControllerDelegate>{
    
    NSTimer *timer;
    UIImageView *splashImageView;
    
    GameViewController *gameviewController;
    UITabBarController *tabBarController;
    
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) GameViewController *gameViewController;

@end
