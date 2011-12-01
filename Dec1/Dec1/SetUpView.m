//
//  SetUpView.m
//  Dec1
//
//  Created by Nicolas baudouin on 30/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SetUpView.h"
#import "SetUpViewController.h"

@implementation SetUpView


-(void) sliderValueChanged: (id) sender {
    NSLog(@"sliderValueChanged %f", xslider.value);
    dxlabel.text = [NSString stringWithFormat:@"dx = %.0f",xslider.value];
    dylabel.text = [NSString stringWithFormat:@"dy = %.0f",yslider.value];
    [setupController setmyDx : xslider.value Dy :yslider.value];
}

- (id)initWithFrame:(CGRect)frame controller: (SetUpViewController *) c 
{
    NSLog(@"Set Up View InitWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        setupController = c;
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        NSString *ptext =@"SET UP";
        
		UIFont *font = [UIFont italicSystemFontOfSize: 18];
		//CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(0,0, 320,20);
		setupLabel = [[UILabel alloc] initWithFrame: f];
		setupLabel.font = font;
		setupLabel.backgroundColor = [UIColor clearColor];
		setupLabel.textColor = [UIColor whiteColor];
        setupLabel.textAlignment = UITextAlignmentCenter;
		setupLabel.text = ptext;
		[self addSubview: setupLabel];
        
        CGRect cgSlider = CGRectMake(140, 100 , 120, 30);
        
        xslider = [[UISlider alloc] initWithFrame:cgSlider];
        
        xslider.minimumValue = 1;
		xslider.maximumValue = 8;
		xslider.value = 2;
		xslider.continuous = YES;	//default is YES
       // [xslider setThumbImage: [UIImage imageNamed:@"binoculars.png"] forState:UIControlStateNormal];
       // [xslider setHidden:YES];
        
        [xslider addTarget: self //[UIApplication sharedApplication].delegate
                   action: @selector(sliderValueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: xslider];
        
        cgSlider = CGRectMake(20, 100 , 70, 30);
        dxlabel = [[UILabel alloc] initWithFrame: cgSlider];
		dxlabel.font = font;
		dxlabel.backgroundColor = [UIColor clearColor];
		dxlabel.textColor = [UIColor whiteColor];
        dxlabel.textAlignment = UITextAlignmentCenter;
		dxlabel.text = @"dx = 2";
		[self addSubview: dxlabel];
        
        cgSlider = CGRectMake(20, 200 , 70, 30);
        dylabel = [[UILabel alloc] initWithFrame: cgSlider];
		dylabel.font = font;
		dylabel.backgroundColor = [UIColor clearColor];
		dylabel.textColor = [UIColor whiteColor];
        dylabel.textAlignment = UITextAlignmentCenter;
		dylabel.text = @"dy = 2";
		[self addSubview: dylabel];
        
        cgSlider = CGRectMake(140, 200 , 120, 30);
        
        yslider = [[UISlider alloc] initWithFrame:cgSlider];
        
        yslider.minimumValue = 1;
		yslider.maximumValue = 8;
		yslider.value = 2;
		yslider.continuous = YES;	//default is YES
        // [xslider setThumbImage: [UIImage imageNamed:@"binoculars.png"] forState:UIControlStateNormal];
        // [xslider setHidden:YES];
        
        [yslider addTarget: self //[UIApplication sharedApplication].delegate
                    action: @selector(sliderValueChanged:)
          forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview: yslider];
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
