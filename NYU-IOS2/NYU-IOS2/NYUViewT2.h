//
//  NYUViewT2.h
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 01/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NYUUlmView;

@interface NYUViewT2 : UIView {
    NYUUlmView *ulmView;
    
}

@property ( nonatomic, retain) NYUUlmView *ulmView;

-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint;
-(void)animateUlmViewToCenter;
-(void)animateUlmViewToTopCorner;

@end
