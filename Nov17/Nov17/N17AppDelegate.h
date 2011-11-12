//
//  N17AppDelegate.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class N17mainView;



@interface N17AppDelegate : UIResponder <UIApplicationDelegate> {
     N17mainView *mainView;   
}

@property (strong, nonatomic) UIWindow *window;

@end
