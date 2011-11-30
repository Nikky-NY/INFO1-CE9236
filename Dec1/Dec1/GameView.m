//
//  GameView.m
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameView.h"
#import "TileView.h"

@implementation GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"GAMEVIEW initWithFrame" );
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
		//Create the paddle.
		frame = CGRectMake(100, 480-38-22, 100, 20);
		paddle = [[UIView alloc] initWithFrame: frame];
		paddle.backgroundColor = [UIColor blackColor];
		[self addSubview: paddle];
        
		//Create the ball in the upper left corner of this View.
		frame = CGRectMake(150,480-38-22-37 , 30, 37);
        
		ball = [[UIImageView alloc] initWithFrame: frame];
        ball.image = [UIImage imageNamed:@"Droid2.png"];
		[self addSubview: ball];
        
		//Ball initially moves to lower right.
		dx = 2;
		dy = 2;
        
        CGRect life1 = CGRectMake(0, 480-38, 30, 37);
        CGRect life2 = CGRectMake(38, 480-38, 30, 37);
        CGRect life3 = CGRectMake(76, 480-38, 30, 37);
        
        life = [NSArray arrayWithObjects:
                [[TileView alloc] initWithFrame:life1 activated:YES image:@"Droid2.png"],
                  [[TileView alloc] initWithFrame:life2 activated:YES image:@"Droid2.png"],
                  [[TileView alloc] initWithFrame:life3 activated:YES image:@"Droid2.png"],
                nil];
        
        for (NSInteger i =0;i< life.count;i++){
            TileView *v = [life objectAtIndex:i];
            [self addSubview:v];
        }
        wall = [[NSMutableArray alloc] init];
        
        for (NSInteger xi=0; xi<10;xi++) {
            for (NSInteger yi=0; yi < 4; yi++) {
                NSInteger imgIndice = rand()%7;
                NSString *imgFileName =  [NSString stringWithFormat:@"Apple%d.png",  imgIndice ];
                [wall addObject: [[TileView alloc] initWithFrame: CGRectMake(xi*32,yi*32,32,32) activated:YES image:imgFileName]];
            }

        }
        
        for (NSInteger i =0;i< wall.count;i++){
            TileView *v = [wall objectAtIndex:i];
            [self addSubview:v];
        }
        
        NSString *ptext =@"---0";
        
		UIFont *font = [UIFont italicSystemFontOfSize: 18];
		//CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(200,480-38, 120,37);
		scoreLabel = [[UILabel alloc] initWithFrame: f];
		scoreLabel.font = font;
		scoreLabel.backgroundColor = [UIColor clearColor];
		scoreLabel.textColor = [UIColor blackColor];
        scoreLabel.textAlignment = UITextAlignmentCenter;
		scoreLabel.text = ptext;
		[self addSubview: scoreLabel];
        score = 0;
        nblife =3;
        
        
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

- (void) bounce {	
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball.frame;
	horizontal.origin.x += dx;
	
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball.frame;
	vertical.origin.y += dy;
	
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
	
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}
	
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball.frame, paddle.frame)) {
		
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
		}
		
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
		}
	}
    //If the ball is not currently intersecting the Apples,
    for (NSInteger p =0; p < wall.count; p ++) {
        TileView *v = [wall objectAtIndex:p];
        if (v.activated) {
            if (!CGRectIntersectsRect(ball.frame, v.frame)) {
                
                //but if the ball will intersect the paddle on the next move,
                if (CGRectIntersectsRect(horizontal, v.frame)) {
                    dx = -dx;
                    p = wall.count;
                    [v changeStatus];
                    score += 10;
                }
                
                if (CGRectIntersectsRect(vertical, v.frame)) {
                    dy = -dy;
                    [v changeStatus];
                     p = wall.count;
                    score += 10;
                }
            } 
        }
    }
	scoreLabel.text = [NSString stringWithFormat:@"%d",  score ];

}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView: self];
	CGFloat x = p.x;
	
	//Don't let the paddle move off the bottom or top of the View.
	CGFloat half = paddle.bounds.size.height / 2;
	x = MIN(x, self.bounds.size.width - half); //don't let y get too big
	x = MAX(x, half);                         //don't let y get too small
	
	paddle.center = CGPointMake(x, paddle.center.y);
	[self bounce];
}

- (void) move: (CADisplayLink *) displayLink {
	//NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
	
	ball.center = CGPointMake(ball.center.x + dx, ball.center.y + dy);
	[self bounce];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

@end
