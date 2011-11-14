//
//  N17topViewBack.m
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17topViewBack.h"

@implementation N17topViewBack


- (void) touchUpInside: (id) sender {
	UIPageControl *c = sender;
    
	//label.text = [NSString stringWithFormat:
    //              @"page %2d of %d",
    //              c.currentPage + 1, c.numberOfPages
    //              ];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        CGRect cgButton = CGRectMake(40,5, 80,30);
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		button.frame = cgButton;
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @" AA " forState: UIControlStateNormal];
        
		[button addTarget: [UIApplication sharedApplication].delegate
                     action: @selector(touchUpInside:)
           forControlEvents: UIControlEventTouchUpInside
         ];
        [button setHidden:NO];
        [self addSubview: button];
        
        CGRect cgSlider = CGRectMake(40, frame.size.height - 30, frame.size.width - 80, 20);
        slider = [[UISlider alloc] initWithFrame:cgSlider];
        [slider setHidden:YES];
        [self addSubview: slider];
        
        
        page = [[UIPageControl alloc] initWithFrame: cgSlider];
        
		[page addTarget: self
                    action: @selector(pageChanged:)
          forControlEvents: UIControlEventTouchUpInside
         ];
        
		page.backgroundColor = [UIColor blackColor];
		page.hidesForSinglePage = NO;	//default is NO
		page.numberOfPages = 5;
		page.currentPage = 0;			//default is 0
        [page setHidden: NO];
		[self addSubview: page];
        
        CGRect cgSegment = CGRectMake(40, 5, frame.size.width - 80, 30);
        NSArray *items = [NSArray arrayWithObjects:
                          @"ShotGun",
                          @"Lazer",
                          @"Bomb",
                          nil
                          ];
		
        segment = [[UISegmentedControl alloc] initWithItems: items];
        segment.segmentedControlStyle = UISegmentedControlStylePlain;
        [segment setHidden:YES];
        segment.frame = cgSegment;
        //[segment setEnabled: NO forSegmentAtIndex: 2];

        [self addSubview: segment];
        
        sw = [[UISwitch alloc] initWithFrame:CGRectZero];
        sw.center = CGPointMake(frame.size.width - 80, 20);
        [sw setHidden:NO];
        
        [self addSubview:sw];
                                     
        CGRect cgImage = CGRectMake(40, 40, frame.size.width - 80, frame.size.height -80);
        UIImage *img = [UIImage imageNamed: @"spy.png"];
        image = [[UIImageView alloc] initWithImage:img];
        image.frame = cgImage;
        [self addSubview: image];


        
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
