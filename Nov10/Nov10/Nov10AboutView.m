//
//  Nov10AboutView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10AboutView.h"

@implementation Nov10AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        rules = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rules.jpg"]];
        rules.frame = CGRectMake(0, 220, 320, 233);
      //  [rules sizeToFit];
        [self addSubview:rules];
        NSString *text = @"Rock Paper Scissors Lizard Spoke \n\n Scissors cut paper & decapitate lizard \n Paper covers rock disproves Spock\n Rock crushes lizard  & scissors\n Lizard poisons Spock & eats paper \n Spock smashes scissors & vaporizes rock ";
        
		UIFont *font = [UIFont italicSystemFontOfSize: 16];
		//CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(0,0, 320,220);
		rulesLabel = [[UILabel alloc] initWithFrame: f];
		rulesLabel.font = font;
		rulesLabel.backgroundColor = [UIColor clearColor];
		rulesLabel.textColor = [UIColor whiteColor];
        rulesLabel.numberOfLines = 7;
        rulesLabel.textAlignment = UITextAlignmentCenter;
		rulesLabel.text = text;
		[self addSubview: rulesLabel];
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
