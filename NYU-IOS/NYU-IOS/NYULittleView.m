//
//  NYULittleView.m
//  NYU-IOS
//
//  Created by Nicolas baudouin on 20/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYULittleView.h"

@implementation NYULittleView


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect {
	// Drawing code
	UIFont *font = [UIFont systemFontOfSize: 20];
	[@"Hello!" drawAtPoint: CGPointZero withFont: font];
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
		self.center = [[touches anyObject] locationInView: self];
	}
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	self.backgroundColor = [UIColor yellowColor];
}
 

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
}

@end
