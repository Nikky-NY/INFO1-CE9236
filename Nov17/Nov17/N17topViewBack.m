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
    NSLog(@"touchUpInside");
    if ( sender == page) {
        switch (page.currentPage) {
            case 0:
                image.image = [displayImages objectForKey: @"max"];
                break;
                
            default:
                image.image = [displayImages objectForKey: @"fred"];
                break;
        }  
    }

 
}
-(void) selectTheDisplay:(NSInteger) indice {
    switch (indice) {
        case 0:
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLablel setHidden:YES];
            image.image = [displayImages objectForKey: @"fred"];
            break;
        case 1:
            [button setHidden:NO];
            [slider setHidden:NO];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLablel setHidden:YES];
             
            break;
        case 2 :
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:NO];
            [topLabel setHidden:YES];
            [downLablel setHidden:NO];
            break;
        case 3 :
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: NO];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLablel setHidden:YES];
            image.image = [displayImages objectForKey: @"max"];
            break;
        case 4:
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:NO];
            [segment setSelectedSegmentIndex:0];
            [sw setHidden:YES];
            [topLabel setHidden:YES];
            [downLablel setHidden:NO];
            image.image = [displayImages objectForKey: @"flint"];
            break;
        default:
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLablel setHidden:NO];
            break;
    }   
}

-(void)buttonPressed: (id) sender {
    NSLog(@"buttonPressed");
    
}

-(void) switchValueChanged: (id) sender {
      NSLog(@"switchValueChanged");
}
-(void) pageChanged: (id) sender {
    NSLog(@"Page Changed Nah % d", page.currentPage);
    switch (page.currentPage) {
        case 0:
            image.image = [displayImages objectForKey: @"max"];
            topLabel.text = @"Max";
            break;
        case 1:
            image.image = [displayImages objectForKey: @"austin"];
            topLabel.text = @"Austin Power";
            break;
        case 2 :
             image.image = [displayImages objectForKey: @"bond"];
            topLabel.text = @"Licensed to kill";
            break;
        case 3 :
             image.image = [displayImages objectForKey: @"rambo"];
            topLabel.text = @"Brute Force Mode";
            break;
        default:
            image.image = [displayImages objectForKey: @"fred"];
            topLabel.text = @"Flint Stone ??";
            break;
    }
    
}
-(void) valueChanged: (id) sender {
         NSLog(@"valueChanged");
    switch (segment.selectedSegmentIndex) {
        case 0:
            image.image = [displayImages objectForKey: @"flint"];
            downLablel.text = @"Flint Lock Style !";
            break;
        case 1:
            image.image = [displayImages objectForKey: @"laser"];
            downLablel.text = @"Men in Black Style !";
            break;
        case 2 :
            image.image = [displayImages objectForKey: @"baz"];
            downLablel.text =@"Rambo Style !";
            break;
        default:
            image.image = [displayImages objectForKey: @"flint"];
             downLablel.text = @"Flint Lock Style !";
            break;
    }

    
}

-(void) sliderValueChanged: (id) sender {
    NSLog(@"sliderValueChanged");
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        displayImages = [NSDictionary dictionaryWithObjectsAndKeys:
                        [UIImage imageNamed:@"max.jpg"],@"max",
                        [UIImage imageNamed:@"austin.jpg"],@"austin",
                        [UIImage imageNamed:@"fred.jpg"],@"fred",
                        [UIImage imageNamed:@"spy.png"],@"spy",
                        [UIImage imageNamed:@"flintlock.jpg"],@"flint",
                        [UIImage imageNamed:@"bond.jpg"],@"bond",
                         [UIImage imageNamed:@"bazooka.jpg"],@"baz",
                         [UIImage imageNamed:@"rambo.jpg"],@"rambo",
                         [UIImage imageNamed:@"laser.jpg"],@"laser",
                                                 nil
                        ];

        
        
        self.backgroundColor = [UIColor blackColor];
        CGRect cgButton = CGRectMake(40,5, 80,30);
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		button.frame = cgButton;
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @" AA " forState: UIControlStateNormal];
        
		[button addTarget: self //[UIApplication sharedApplication].delegate
                     action: @selector(buttonPressed:)
           forControlEvents: UIControlEventTouchUpInside
         ];
        [button setHidden:NO];
        [self addSubview: button];
        
        
        CGRect cgtl = CGRectMake(130, 5, 130, 30);
        topLabel = [[UILabel alloc] initWithFrame:cgtl];
        [topLabel setHidden:YES];
        [self addSubview:topLabel];
        
        CGRect cgSlider = CGRectMake(40, frame.size.height - 30, frame.size.width - 80, 30);
        
        downLablel = [[UILabel alloc] initWithFrame:cgSlider];
        [downLablel setHidden:YES];
        [self addSubview:downLablel];
        
        slider = [[UISlider alloc] initWithFrame:cgSlider];
        [slider setHidden:YES];
        
        [slider addTarget: self //[UIApplication sharedApplication].delegate
                   action: @selector(sliderValueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
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
        [self touchUpInside: page];
        
        CGRect cgSegment = CGRectMake(40, 5, frame.size.width - 80, 30);
        NSArray *items = [NSArray arrayWithObjects:
                          @"Flint",
                          @"Lazer",
                          @"Baz",
                          nil
                          ];
		
        segment = [[UISegmentedControl alloc] initWithItems: items];
        segment.segmentedControlStyle = UISegmentedControlStylePlain;
        [segment setHidden:YES];
        segment.frame = cgSegment;
        //[segment setEnabled: NO forSegmentAtIndex: 2];
        [segment addTarget: self // [UIApplication sharedApplication].delegate
                    action: @selector(valueChanged:)
          forControlEvents: UIControlEventValueChanged
         ];

        [self addSubview: segment];
        
        sw = [[UISwitch alloc] initWithFrame:CGRectZero];
        sw.center = CGPointMake(frame.size.width - 80, 20);
        [sw setHidden:NO];
        [sw addTarget: self // [UIApplication sharedApplication].delegate
                     action: @selector(switchValueChanged:)
           forControlEvents: UIControlEventValueChanged
         ];
        [self addSubview:sw];
                                     
        CGRect cgImage = CGRectMake(40, 40, frame.size.width - 80, frame.size.height -80);
        image = [[UIImageView alloc] initWithImage:[displayImages objectForKey:@"spy"]];
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
