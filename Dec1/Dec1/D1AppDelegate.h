//
//  D1AppDelegate.h
//  Dec1
//
//  Created by Nicolas baudouin on 21/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SplashController; 

@interface D1AppDelegate : UIResponder <UIApplicationDelegate>{
    SplashController * viewController;
}

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, retain) SplashController *viewController;

@end
