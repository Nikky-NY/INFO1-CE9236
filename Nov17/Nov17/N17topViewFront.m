//
//  N17topViewFront.m
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17topViewFront.h"

@implementation N17topViewFront

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (id)initWithView: (UIView *) v Image:(UIImage *)image Frame : (CGRect) f{
    self = [super initWithImage:image];
    if (self) {
        self.frame = f;
        bigView = v;
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
