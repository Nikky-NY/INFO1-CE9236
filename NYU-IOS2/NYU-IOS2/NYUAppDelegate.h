//
//  NYUAppDelegate.h
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer

@interface NYUAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> {
     AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
