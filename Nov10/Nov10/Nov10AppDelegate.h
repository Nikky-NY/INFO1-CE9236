//
//  Nov10AppDelegate.h
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Nov10MainView;

@interface Nov10AppDelegate : UIResponder <UIApplicationDelegate>{
    Nov10MainView *mainView;
}

@property (strong, nonatomic) UIWindow *window;

@end
