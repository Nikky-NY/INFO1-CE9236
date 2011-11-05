//
//  NYUviewA.m
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 28/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUviewA.h"

@implementation NYUviewA

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        
		//Trailing blank to avoid cutting off last letter
		//because italic leans to the right.
		NSString *text = @"GONE  WITH  THE  WIND ";
        
		CGRect b = self.bounds;
		UIFont *font = [UIFont italicSystemFontOfSize: b.size.height];
		CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(
                              b.size.width,
                              0,
                              size.width,
                              size.height
                              );
		
		label = [[UILabel alloc] initWithFrame: f];
		label.font = font;
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		label.text = text;
		[self addSubview: label];
        
    }
    return self;
}

- (void) drawRect: (CGRect) rect
{
    // Drawing code/
    NSLog(@"Drawing GONE");
    [UIView animateWithDuration: 25
                          delay: 23.75
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         label.center = CGPointMake(
                                                    -label.bounds.size.width / 2,
                                                    self.bounds.size.height / 2
                                                    );
                     }
                     completion: NULL
     ];
}


@end

