//
//  Nov10GameView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10GameView.h"
#import "Nov10objectView.h"

@implementation Nov10GameView


@synthesize goButton;

-(void) place: (Nov10objectView *) objView atPosition: (CGRect) pos {
    objView.frame = CGRectMake(pos.origin.x ,pos.origin.y,pos.size.width,pos.size.height);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
            self.backgroundColor = [UIColor whiteColor];
        /*computerObjects = [NSArray arrayWithObjects:
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stone.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper.png"]],
                            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Scissors.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lizard.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spock.png"]],

                           nil];
         
        for (NSInteger i =0;i< computerObjects.count;i++){
            UIImageView *v = [computerObjects objectAtIndex:i];
            v.frame = CGRectMake(64 * i, 6, 64, 64);
            [self addSubview:v];
        } */
        CGRect cg1 = CGRectMake(0,6,64,64);
        CGRect cg2 = CGRectMake(64,6,64,64);
        CGRect cg3 = CGRectMake(128,6,64,64);
        CGRect cg4 = CGRectMake(192,6,64,64);
        CGRect cg5 = CGRectMake(256,6,64,64);
        CGRect computerTarget = CGRectMake(256,76, 64,64);
        
        computerObjects = [NSArray arrayWithObjects:
                    [[Nov10objectView alloc] initWithView:self basePos:cg1 targetPos:computerTarget image:@"Stone.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg2 targetPos:computerTarget image:@"paper.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg3 targetPos:computerTarget image:@"Scissors.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg4 targetPos:computerTarget image:@"Lizard.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg5 targetPos:computerTarget image:@"spock.png"],
                    nil];
        
        for (NSInteger i =0;i< computerObjects.count;i++){
            Nov10objectView *v = [computerObjects objectAtIndex:i];
            //v.frame = CGRectMake(64 * i, 6, 64, 64);
            [self addSubview:v];
        }
        
        cg1 = CGRectMake(0,390,64,64);
        cg2 = CGRectMake(64,390,64,64);
        cg3 = CGRectMake(128,390,64,64);
        cg4 = CGRectMake(192,390,64,64);
        cg5 = CGRectMake(256,390,64,64);
        CGRect playerTarget = CGRectMake(256,320, 64,64);
        
        /*playerObjects = [NSArray arrayWithObjects:
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stone.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paper.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Scissors.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lizard.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spock.png"]],
                           
                           nil];
         */
        playerObjects = [NSArray arrayWithObjects:
                    [[Nov10objectView alloc] initWithView:self basePos:cg1 targetPos:playerTarget image:@"Stone.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg2 targetPos:playerTarget image:@"paper.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg3 targetPos:playerTarget image:@"Scissors.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg4 targetPos:playerTarget image:@"Lizard.png"],
                    [[Nov10objectView alloc] initWithView:self basePos:cg5 targetPos:playerTarget image:@"spock.png"],
                    nil];
        //computer0.center = CGPointMake(128,128);
        //[self addSubview: computer0];
        for (NSInteger i =0;i< playerObjects.count;i++){
            Nov10objectView *v = [playerObjects objectAtIndex:i];
            //v.frame = CGRectMake(64 * i, 460 - 6 - 64, 64, 64);
            [self addSubview:v];
            
        
        }

                //[[TileView alloc] initWith
    }
    return self;
}

- (IBAction)goButtonPressed:(id)sender{
    // do something to Go !!!
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
