//
//  TileView.m
//  Dec1
//
//  Created by Nicolas baudouin on 26/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TileView.h"

@implementation TileView
@synthesize position;
@synthesize activated;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame: (CGRect) base activated: (BOOL) a image: (NSString *) s {
    UIImage *image = [UIImage imageNamed: s];
    self = [super initWithImage:image];
    if (self) {
        activated = a;
        self.frame = base;
    
    }
    return self;
}

- (void)changeStatus {
    if (activated) {
        activated = NO;
        [self setHidden:YES];
        [self setNeedsDisplay];
    } else {
        activated = YES;
        [self setHidden:NO];
        [self setNeedsDisplay];
    }
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
