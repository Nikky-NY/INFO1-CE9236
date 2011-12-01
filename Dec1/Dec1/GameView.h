//
//  GameView.h
//  Dec1
//
//  Created by Nicolas baudouin on 22/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameViewController;

@interface GameView : UIView {
    UIImageView *paddle;
	UIImageView *ball;
	NSInteger dx, dy;	//direction and speed of ball's motion
    NSArray *life;
    NSMutableArray *wall;
    NSInteger score;
    NSInteger nblife;
    UILabel *scoreLabel;
    CGRect bottom;
    NSInteger appleNumber;
    UILabel * gameResult;
    GameViewController *viewController;
    
}

@property (nonatomic, atomic) NSInteger dx;
@property (nonatomic, atomic) NSInteger dy;

-(void) setmyDx: (NSInteger) x Dy :(NSInteger) y;

- (id)initWithFrame:(CGRect)frame Controller :(GameViewController *) cont;

@end
