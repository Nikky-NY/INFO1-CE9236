//
//  NYUViewT2.m
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 01/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUViewT2.h"
#import "NYUUlmView.h"
#import "QuartzCore/QuartzCore.h"


@implementation NYUViewT2

@synthesize ulmView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect f = CGRectMake(0, 0, 80, 80);
		ulmView = [[NYUUlmView alloc] initWithFrame: f];
		[self addSubview: ulmView];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
}


-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint {
    
}

-(void)animateUlmViewToCenter {
    
}

-(void)animateUlmViewToTopCorner {
    CGPoint topPoint = CGPointMake(40, 40);
    ulmView.center = topPoint;
    NSLog(@"Passe ici");
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
     NSLog(@"View");
    /*if ([touch view] != ulmView) {
        // do somethig ... String //
     
        return;
    }*/
    
    [UIView beginAnimations: nil context: NULL];
    
    //Describe the animation itself.
    [UIView setAnimationDuration: 1.0];	//in seconds; default is 0.2
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount: 1.0];	//The default is 1.0.

    CGAffineTransform s = CGAffineTransformMakeScale(1.5, 1.5);
    CGAffineTransform r = CGAffineTransformMakeRotation(90 * M_PI / 180);
    CGAffineTransform c = CGAffineTransformConcat(r, s);
    ulmView.transform = c;
    CGPoint touchPoint = [touch locationInView:self];
    ulmView.center = touchPoint;
    
    s = CGAffineTransformMakeScale(1, 1);
    r = CGAffineTransformMakeRotation(0 * M_PI);
    c = CGAffineTransformConcat(r, s);
    ulmView.transform = c;
    
    [UIView commitAnimations];
    //[self animateFirstTouchAtPoint:touchPoint];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if ([touch view] == ulmView) {
        CGPoint lastTouchPoint = [touch locationInView:self];
        ulmView.center = lastTouchPoint;
        return;
    }
    else {
        // do something ?
        [self animateUlmViewToTopCorner ];
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if ([touch view] == ulmView) {
        //self.userInteractionEnabled = NO;
        [self animateUlmViewToTopCorner ];
        return;
    }
    else {
        // do something ?
    }

}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


@end
