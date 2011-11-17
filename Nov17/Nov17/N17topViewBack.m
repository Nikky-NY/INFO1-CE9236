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
            [downLabel setHidden:NO];
            topLabel.text = @" As FlintStone ?";
            downLabel.text = @"Press Hide";
            image.image = [displayImages objectForKey: @"fred"];
            [button setTitle: @"HIDE" forState: UIControlStateNormal];

            break;
        case 1:
            [button setHidden:NO];
            [slider setHidden:NO];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLabel setHidden:YES];
            topLabel.text = @"Use lenses";
            image.image = [displayImages objectForKey: @"bigBond"];
            [button setTitle: @"ZOOM" forState: UIControlStateNormal];
            break;
        case 2 :
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:NO];
            [topLabel setHidden:YES];
            [downLabel setHidden:NO];
            downLabel.text = @"Arm the bomb then blow";
            image.image = [displayImages objectForKey: @"bigBomb"];
            [button setTitle: @"BLOW" forState: UIControlStateNormal];

            break;
        case 3 :
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: NO];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLabel setHidden:YES];
            image.image = [displayImages objectForKey: @"max"];
            topLabel.text = @"Max";
            [page setCurrentPage:0];
            [button setTitle: @"CALL" forState: UIControlStateNormal];

            break;
        case 4:
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:NO];
            [segment setSelectedSegmentIndex:0];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLabel setHidden:YES];
            image.image = [displayImages objectForKey: @"flint"];
            topLabel.text = @"Flint Lock Style !";
            [button setTitle: @"SHOOT" forState: UIControlStateNormal];


            break;
        default:
            [button setHidden:NO];
            [slider setHidden:YES];
            [page setHidden: YES];
            [segment setHidden:YES];
            [sw setHidden:YES];
            [topLabel setHidden:NO];
            [downLabel setHidden:YES];
            image.image = [displayImages objectForKey: @"image"];
            topLabel.text = @"Not iplemented !";
            [button setTitle: @"KO" forState: UIControlStateNormal];
            break;
    }   
}

-(void)buttonPressed: (id) sender {
    NSLog(@"Koi ?");
    AudioServicesPlaySystemSound(sid);
}

-(void) switchValueChanged: (id) sender {
      NSLog(@"switchValueChanged");
}
-(void) pageChanged: (id) sender {
    NSLog(@"Page Changed Nah % d", page.currentPage);
    switch (page.currentPage) {
        case 0:
            image.image = [displayImages objectForKey: @"max"];
            topLabel.text = @"Maxwell Smart";
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
            topLabel.text = @"Flint Lock Style !";
            break;
        case 1:
            image.image = [displayImages objectForKey: @"laser"];
            topLabel.text = @"Men in Black Style !";
            break;
        case 2 :
            image.image = [displayImages objectForKey: @"baz"];
            topLabel.text =@"Rambo Style !";
            break;
        default:
            image.image = [displayImages objectForKey: @"flint"];
             topLabel.text = @"Flint Lock Style !";
            break;
    }

    
}

-(void) sliderValueChanged: (id) sender {
    NSLog(@"sliderValueChanged %f", slider.value /2);

    
    image.transform = CGAffineTransformMakeScale(slider.value/2,slider.value/2);
                                            

//    [image.image scale: f] ;
  //  image.image.sca
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSBundle *bundle = [NSBundle mainBundle];
        NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
        
        NSString *filename = [bundle pathForResource: @"grenade" ofType: @"mp3"];
        //NSLog(@"filename == \"%@\"", filename);
        
        NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
        //NSLog(@"url == \"%@\"", url);
        
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
        if (error != kAudioServicesNoError) {
            NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
        }
        
       filename = [bundle pathForResource: @"laser" ofType: @"mp3"];
       // NSLog(@"filename == \"%@\"", filename);
        
        url = [NSURL fileURLWithPath: filename isDirectory: NO];
        //NSLog(@"url == \"%@\"", url);
        
        error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid1);
        if (error != kAudioServicesNoError) {
            NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
        }
        filename = [bundle pathForResource: @"gun" ofType: @"mp3"];
        //NSLog(@"filename == \"%@\"", filename);
        
        url = [NSURL fileURLWithPath: filename isDirectory: NO];
        //NSLog(@"url == \"%@\"", url);
        
        error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid2);
        if (error != kAudioServicesNoError) {
            NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
        }


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
                         [UIImage imageNamed:@"James-Bond.jpg"],@"bigBond",
                           [UIImage imageNamed:@"bigbomb.jpg"],@"bigBomb",
                           [UIImage imageNamed:@"images.jpg"],@"image",
                                                 nil
                        ];

        
        //[self.superview selectTheTopWindow:0];
        self.backgroundColor = [UIColor blackColor];
        CGRect cgButton = CGRectMake(40,5, 80,30);
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		button.frame = cgButton;
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @" GO " forState: UIControlStateNormal];
        
		[button addTarget: self //[UIApplication sharedApplication].delegate
                     action: @selector(buttonPressed:)
           forControlEvents: UIControlEventTouchUpInside
         ];
        [button setHidden:NO];
        [self addSubview: button];
        
        
        CGRect cgtl = CGRectMake(130, 5, 150, 30);
        topLabel = [[UILabel alloc] initWithFrame:cgtl];
        topLabel.textAlignment = UITextAlignmentCenter;
        [topLabel setHidden:YES];
        [self addSubview:topLabel];
        
        CGRect cgSlider = CGRectMake(40, frame.size.height - 35, frame.size.width - 80, 30);
        
        downLabel = [[UILabel alloc] initWithFrame:cgSlider];
        downLabel.textAlignment = UITextAlignmentCenter;
        [downLabel setHidden:YES];
        [self addSubview:downLabel];
        
        slider = [[UISlider alloc] initWithFrame:cgSlider];
        
        slider.minimumValue = 1;
		slider.maximumValue = 2;
		slider.value = 0.5;
		slider.continuous = YES;	//default is YES
        [slider setThumbImage: [UIImage imageNamed:@"binoculars.png"] forState:UIControlStateNormal];
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
        segment.frame = cgSlider; // cgSegment;
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
