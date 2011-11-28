//
//  SplashController.h
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GameViewController.h"

@interface SplashController : UIViewController {
    
    NSTimer *timer;
    UIImageView *splashImageView;
    
    GameViewController *gameviewController;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) GameViewController *gameViewController;

@end
