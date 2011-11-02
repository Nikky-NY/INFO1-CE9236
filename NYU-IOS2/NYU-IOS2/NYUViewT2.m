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
        [self annimateUlmViewToTopCorner];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ulmView drawRect:CGRectZero];
}


-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint {
    
}
-(void)animateUlmViewToCenter {
    
}
-(void)annimateUlmViewToTopCorner {
    NYUUlmView *anUlmView = [[NYUUlmView alloc] initWithFrame:CGRectZero ];
    self.ulmView = anUlmView;
    [self addSubview:ulmView];
    NSLog(@"Passe ici");
    //ulmView
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if ([touch view] != ulmView) {
        // update String //
        
    }
}

@end
