//
//  Nov10IntroView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10IntroView.h"

@implementation Nov10IntroView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
            self.backgroundColor = [UIColor purpleColor];
        
        NSString *text = @"Rock Paper Scissors Lizard Spoke \n Swipe Left for Game <-- \n Swipe Right for Rules -->\n\n ENJOY !!!";
        
		UIFont *font = [UIFont italicSystemFontOfSize: 18];
		//CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(0,0, 320,220);
		introLabel = [[UILabel alloc] initWithFrame: f];
		introLabel.font = font;
		introLabel.backgroundColor = [UIColor clearColor];
		introLabel.textColor = [UIColor whiteColor];
        introLabel.numberOfLines = 5;
        introLabel.textAlignment = UITextAlignmentCenter;
		introLabel.text = text;
		[self addSubview: introLabel];
        
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
