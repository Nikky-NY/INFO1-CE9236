//
//  NYUView.m
//  NYU-IOS
//
//  Created by nicolas baudouin on 12/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUView.h"
#import "NYUDate.h"
#import "NYULittleView.h"

@implementation NYUView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor yellowColor];
        self.backgroundColor = [UIColor colorWithRed: 1.0 green: 0.4 blue: 0.2 alpha: 1.0];
        
        CGRect f = CGRectMake(
                              self.bounds.origin.x + (self.bounds.size.width) / 2 - 100,
                              self.bounds.origin.y + 4 *(self.bounds.size.height) / 5,
                              200,
                              40
                              );
        
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];

		button.frame = f;
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: @"Try This Out" forState: UIControlStateNormal];
        
		[button addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: button];
        
        CGRect f2 = CGRectMake(0, 0, 80, 40);
		littleView = [[NYULittleView alloc] initWithFrame: f2];
		[self addSubview: littleView];
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIFont *f = [UIFont systemFontOfSize: 32.0];
    NSString *s = NSLocalizedString(@"Greetings", @"displayed with drawAtPoint:");
    CGPoint p = CGPointZero;

    [[UIColor whiteColor] set];
    [s drawAtPoint: p withFont: f ];
    
    NYUDate *d = [[NYUDate alloc] initWithDay:13 Month:10 Year:2011];
    CGPoint p2 = CGPointMake(0.0, 40.0);
    [[UIColor blackColor] set];
    [d.description drawAtPoint: p2 withFont: f];
    
    CGPoint p3 = CGPointMake(0.0, 80.0);
    [d.dateFormat drawAtPoint: p3 withFont: f];
    
    [[UIColor blueColor] set];
    UIDevice *dev = [UIDevice currentDevice];	
    
	NSString *sm = dev.model;
	NSString *suuid = dev.uniqueIdentifier;
	NSString *sos = dev.systemName;	
	NSString *sver = dev.systemVersion;	
    CGPoint p4 = CGPointMake(0.0, 120.0);
    [sm drawAtPoint: p4 withFont: f];
    CGPoint p5 = CGPointMake(0.0, 160.0);
    [suuid drawAtPoint: p5 withFont: f];
    CGPoint p6 = CGPointMake(0.0, 200.0);
    [sos drawAtPoint: p6 withFont: f];
    CGPoint p7 = CGPointMake(0.0, 240.0);
    [sver drawAtPoint: p7 withFont: f];
    CGFloat radius = .3 * self.bounds.size.width;
    

    CGRect r = CGRectMake(self.bounds.size.width - 2 * radius,
                          self.bounds.size.height /3 -2, // * radius, 
                          2 * radius, 2 * radius);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    CGContextAddEllipseInRect(ctx, r);
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 0.5);
    CGContextFillPath(ctx);
    
    CGContextStrokePath(ctx);
    CGContextSetShadow(ctx, CGSizeMake(10, -20), 10);
    CGContextBeginPath(ctx);
    CGContextAddEllipseInRect(ctx, r);
    CGContextSetLineWidth(ctx, 10.0);
	CGContextSetRGBStrokeColor(ctx, 0.0, 0.0, 1.0, 1);
	CGContextStrokePath(ctx);
    //CGContextSetShadow(ctx, CGSizeMake(10, -20), 10);
    
    //The actor George C. Scott played General George S. Patton (1970).
	UIImage *image = [UIImage imageNamed: @"Paton.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
	
	//upper left corner of image
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGPoint p8 = CGPointMake(
                            (w - image.size.width) / 2,
                            h - image.size.height - 80
                            );

    
	//[image drawAtPoint: p8];
    [image drawAtPoint:p8 blendMode:kCGBlendModeNormal alpha: 0.6];
  
    
    
    
} 

-(void)dealloc {
  //  [super dealloc];
}

@end
