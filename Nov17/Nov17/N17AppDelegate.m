//
//  N17AppDelegate.m
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17AppDelegate.h"
#import "N17mainView.h"

@implementation N17AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 /*
    NSBundle *bundle = [NSBundle mainBundle];
	if (bundle == nil) {
		NSLog(@"Could not access main bundle.");
		return YES;
	}
    
	NSString *filename = [bundle pathForResource: @"MI" ofType: @"mp4"];
	if (filename == nil) {
		NSLog(@"could not find file MI.mp4");
		return YES;
	}
    
	NSURL *url = [NSURL fileURLWithPath: filename];
	if (url == nil) {
		NSLog(@"could not create URL for file %@", filename);
		return YES;
	}
    
	controller = [[MPMoviePlayerController alloc] init];
	if (controller == nil) {
		NSLog(@"could not create MPMoviePlayerController");
		return YES;
	}
    
	[controller setContentURL: url];
	controller.scalingMode = MPMovieScalingModeNone;
	controller.controlStyle = MPMovieControlStyleFullscreen;
	controller.movieSourceType = MPMovieSourceTypeFile; //vs.stream
    
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	
	[center
     addObserver: self
     selector: @selector(playbackDidFinish:)
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: controller
     ];
*/
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
    
    NSString *filename = [bundle pathForResource: @"grenade" ofType: @"mp3"];
    //NSLog(@"filename == \"%@\"", filename);
    
    NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
    //NSLog(@"url == \"%@\"", url);
    
    OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
    if (error != kAudioServicesNoError) {
        NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
    }
    
    /*filename = [bundle pathForResource: @"laser" ofType: @"mp3"];
    // NSLog(@"filename == \"%@\"", filename);
    
    url = [NSURL fileURLWithPath: filename isDirectory: NO];
    //NSLog(@"url == \"%@\"", url);
    
    error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid1);
    if (error != kAudioServicesNoError) {
        NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
    }
    filename = [bundle pathForResource: @"gun" ofType: @"mp3"];
    //NSLog(@"filename == \"%@\"", filename);
    
    url = [NSURL fileURLWithPath: filename isDirectory: NO];
    //NSLog(@"url == \"%@\"", url);
    
    error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid2);
    if (error != kAudioServicesNoError) {
        NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
    }
*/
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIScreen *screen = [UIScreen mainScreen];
	mainView = [[N17mainView alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	//self.window.backgroundColor = [UIColor whiteColor];
    
	[self.window addSubview: mainView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)buttonPressed: (id) sender {
    NSLog(@"Koi ?");
    AudioServicesPlaySystemSound(sid);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
