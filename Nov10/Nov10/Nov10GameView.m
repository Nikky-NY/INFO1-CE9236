//
//  Nov10GameView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10GameView.h"

@implementation Nov10GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
            self.backgroundColor = [UIColor blueColor];
        computer0  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stone.png"]];
        computer0.center = CGPointMake(128,128);
        [self addSubview: computer0];
        //[[TileView alloc] initWith
    }
    return self;
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
