//
//  NYUAppDelegate.h
//  NYU-IOS
//
//  Created by nicolas baudouin on 12/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NYUView;

@interface NYUAppDelegate : UIResponder <UIApplicationDelegate> {
    NYUView *view;
}

- (void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
