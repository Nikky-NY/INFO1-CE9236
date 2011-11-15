//
//  N17bottomView.m
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17bottomView.h"
#import "CustomPickerDataSource.h"
#import "N17topView.h"


@implementation N17bottomView

-(void)doit: (NSInteger) r{
    NSLog(@"do it % d", r);
    [top selectTheTopView:r];
}
-(void) setTop:(N17topView *)t {
    top = t;
};

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        self.backgroundColor = [UIColor redColor];
        NSString *text = @"Agent 008 Choose Ur gadget";
        
        UIFont *font = [UIFont italicSystemFontOfSize: 16];
        //CGSize size = [text sizeWithFont: font];
        
        CGRect f = CGRectMake(0,0, 320,40);
        bottomLabel = [[UILabel alloc] initWithFrame: f];
        bottomLabel.font = font;
        bottomLabel.backgroundColor = [UIColor clearColor];
        bottomLabel.textColor = [UIColor whiteColor];
        bottomLabel.numberOfLines = 1;
        bottomLabel.textAlignment = UITextAlignmentCenter;
        bottomLabel.text = text;
        [self addSubview: bottomLabel];
        picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
        picker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        // setup the data source and delegate for this picker
        customPickerDataSource = [[CustomPickerDataSource alloc] initWithView: self];
        picker.dataSource = customPickerDataSource;
        picker.delegate = customPickerDataSource;
        
        // note we are using CGRectZero for the dimensions of our picker view,
        // this is because picker views have a built in optimum size,
        // you just need to set the correct origin in your view.
        //
        // position the picker at the bottom
        //picker.center = CGPointMake(160, 230 + 216/2);
        picker.showsSelectionIndicator = YES;
        // add this picker to our view controller, initially hidden
        picker.hidden = NO;
        [self addSubview:picker];
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
