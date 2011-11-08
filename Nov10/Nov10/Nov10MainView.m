//
//  Nov10MainView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10MainView.h"
#import "Nov10GameView.h"
#import "Nov10IntroView.h"
#import "Nov10AboutView.h"

@implementation Nov10MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        views = [NSArray arrayWithObjects:
                 [[Nov10AboutView alloc] initWithFrame: self.bounds],
                 [[Nov10IntroView alloc] initWithFrame: self.bounds],
                 [[Nov10GameView alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 1;	
		[self addSubview: [views objectAtIndex: index]];
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
    }
    return self;
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
    NSLog(@"Swipe:");
    NSInteger nextIndex = index;
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Swipe: right");
        if (index < 2 ) {
            nextIndex = index+1;
            [UIView transitionFromView: [views objectAtIndex: index]
                                toView: [views objectAtIndex: nextIndex]
                              duration: 2.25
                               options: UIViewAnimationOptionTransitionFlipFromRight
                            completion: NULL
             ];
        } else {
            nextIndex = 2;
        }
		

	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
            NSLog(@"Swipe:left");
        if (index > 0 ) {
            nextIndex = index-1;
            [UIView transitionFromView: [views objectAtIndex: index]
                                toView: [views objectAtIndex: nextIndex]
                              duration: 2.25
                               options: UIViewAnimationOptionTransitionFlipFromLeft
                            completion: NULL
             ];

        } else {
            nextIndex = 0;
        }
		
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		
	}
    index = nextIndex;
    
}

-(void)goButtonPressed {
    [[views objectAtIndex: 2] goButtonPressed];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
