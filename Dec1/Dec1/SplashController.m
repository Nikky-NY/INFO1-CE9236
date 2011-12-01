//
//  SplashController.m
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashController.h"

@implementation SplashController
@synthesize timer,splashImageView,gameViewController;

- (void)tabBarController:(UITabBarController *)theTabBarController didSelectViewController:(UIViewController *)viewController {
    NSUInteger indexOfTab = [theTabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"Tab1 index = %u ", indexOfTab);
    if (indexOfTab == 1) {
        SetUpViewController *s = [theTabBarController.viewControllers objectAtIndex:0];
        GameViewController * g = viewController; //= [theTabBarControlle.viewControllers objectAtIndex:indexOfTab];
        [g updatedx:[s dx] dy:[s dy]];
        [g startLoop];
    } else {
        GameViewController * g = [theTabBarController.viewControllers objectAtIndex:1];
        [g stopLoop];
    }
}
- (void)tabBar:(UITabBar *)theTabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger indexOfTab = [[theTabBar items] indexOfObject:item];
    NSLog(@"Tab2 index = %u", indexOfTab);
    if (indexOfTab == 1) {
        [[self.tabBarController.viewControllers objectAtIndex:indexOfTab] startLoop];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"initWithNibName SplashController");
        self.view.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:appFrame];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Game.png"]];
    splashImageView.frame = CGRectMake(0, 0, 320,480);
    [self.view addSubview:splashImageView];
    
    
    tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = [NSArray arrayWithObjects:
                                        [[SetUpViewController alloc] initWithNibName:nil  bundle:[NSBundle mainBundle]],
                                        [[GameViewController alloc] initWithNibName:nil  bundle:[NSBundle mainBundle]],
                                        nil
                                        ];
	
	tabBarController.view.alpha = 0.0;
    tabBarController.delegate= self;
	[self.view addSubview:tabBarController.view];
    //gameViewController = [[GameViewController alloc] initWithNibName:nil  bundle:[NSBundle mainBundle]];
    //gameViewController.view.alpha = 0.0;

    //[self.view addSubview:gameViewController.view];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeSplash) userInfo:nil repeats:NO];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}


- (void)fadeSplash
{
	[UIView beginAnimations:nil context:nil]; 
	[UIView setAnimationDuration:0.75];        
	[UIView setAnimationDelegate:self];        
	[UIView setAnimationDidStopSelector:@selector(finishedFading)]; 
	self.view.alpha = 0.0;       	
    [UIView commitAnimations];   
}


- (void) finishedFading
{
	
	[UIView beginAnimations:nil context:nil]; // begins animation block
	[UIView setAnimationDuration:0.75];        // sets animation duration
	self.view.alpha = 1.0;   // fades the view to 1.0 alpha over 0.75 seconds
	//gameViewController.view.alpha = 1.0;
    tabBarController.view.alpha = 1.0;
	[UIView commitAnimations];   // commits the animation block.  This Block is done.
	[splashImageView removeFromSuperview];
}

@end
