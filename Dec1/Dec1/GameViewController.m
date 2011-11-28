//
//  GameViewController.m
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"initWithNibName GameViewController");
        //self.view.backgroundColor = [UIColor blueColor];
        self.view.frame = CGRectMake(0, 0,320,480);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.frame = frame;
         self.view.backgroundColor = [UIColor redColor];
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
	self.view = [[GameView alloc] initWithFrame: CGRectMake(0, 0, 320,480)];//[UIScreen mainScreen].applicationFrame];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0,320,480);
    displayLink = [CADisplayLink displayLinkWithTarget: self.view
                                              selector: @selector(move:)
                   ];
    
    //Call move: every time the display is refreshed.
    [displayLink setFrameInterval: 1];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

@end
