//
//  N17AppDelegate.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@class N17mainView;



@interface N17AppDelegate : UIResponder <UIApplicationDelegate> {
     N17mainView *mainView;
    MPMoviePlayerController *controller;
      SystemSoundID sid, sid1, sid2,sid3;
}


@property (strong, nonatomic) UIWindow *window;

@end
