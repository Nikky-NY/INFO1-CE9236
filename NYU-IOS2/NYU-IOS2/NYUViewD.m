//
//  NYUViewD.m
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 27/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUViewD.h"

@implementation NYUViewD

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
         self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawStar {
    CGFloat w = self.bounds.size.width;
    NSLog(@"w = %f", w);
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
    //White star has 5 vertices (points).
	
    int angle =0;
    CGFloat t = 0;
    for (angle = 0; angle < 12; angle ++) {
        
        CGPoint center = CGPointMake( w/2 + (w/3) * cosf(t), h/2 + (w/3) * sinf(t)); //of union jack
        
        
        CGFloat radius = h / 20;	//of circle that the 5 vertices touch
        CGContextBeginPath(c);
        
        CGFloat theta = 0;		//Start with vertex pointing to right.
        int i =1;
       
        CGContextMoveToPoint(c,
                             center.x + radius * cosf(theta),
                             center.y - radius * sinf(theta)
                             );
        for (i=1; i<6; i++) {
            theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
            CGContextAddLineToPoint(c,
                                    center.x + radius * cosf(theta),
                                    center.y - radius * sinf(theta)
                                    );
        
        }
        //Works even though the star's outline intersects with itself.
        CGContextClosePath(c);
        CGContextSetRGBFillColor(c, 255.0, 215.0, 0.0, 1.0);
        CGContextFillPath(c);
        
        t += 2 * M_PI * 1 / 12;
    }
        
	
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat w = self.bounds.size.width;
    NSLog(@"w = %f", w);
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//seven red stripes
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake( 0 * w / 3, 0, w / 3, h));
	
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
    
    CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake( 2 * w / 3, 0, w / 3, h));
	
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    [self drawStar];
}

    
@end
