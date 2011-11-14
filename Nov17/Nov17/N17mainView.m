//
//  N17mainView.m
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17mainView.h"
#import "N17bottomView.h"
#import "N17topView.h"

@implementation N17mainView

-(void)buttonPressed{
    [[views objectAtIndex: 1] buttonPressed];
}

-(void) switchValueChanged {
    [[views objectAtIndex: 1] switchValueChanged];
}
-(void) pageChanged{
    [[views objectAtIndex: 1] switchValueChanged];
}
-(void) sliderValueChanged{
    [[views objectAtIndex: 1]sliderValueChanged];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect bounds = self.bounds;
        CGRect topBounds = CGRectMake(0, 0, bounds.size.width , bounds.size.height / 2);
        CGRect bottomBounds = CGRectMake(0, bounds.size.height / 2, bounds.size.width , bounds.size.height / 2);
        N17topView *topV = [[N17topView alloc] initWithFrame:topBounds];
        N17bottomView *botV = [[N17bottomView alloc] initWithFrame: bottomBounds];
        views = [NSArray arrayWithObjects:
                 botV, //[[N17bottomView alloc] initWithFrame: bottomBounds],
                 topV, // [[N17topView alloc] initWithFrame:topBounds],
                 nil
                 ];
        [botV setTop:topV];
		index = 1;	
		[self addSubview: [views objectAtIndex: 0]];
        [self addSubview: [views objectAtIndex: 1]];
        

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
