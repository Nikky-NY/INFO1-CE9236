//
//  NYUUlmView.m
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 01/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUUlmView.h"

@implementation NYUUlmView
@synthesize ulmImage;
@synthesize ulmString;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"ulm.gif"];
        self.opaque = NO;
        ulmImage = image;
        ulmString = @"ULM";
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ulmImage drawAtPoint:(CGPointZero)];
    NSLog(@"Passe la");
    //CGPoint position = CGPointMake(se, <#CGFloat y#>)
}

@end
