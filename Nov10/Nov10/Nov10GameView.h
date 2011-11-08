//
//  Nov10GameView.h
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Nov10objectView;


@interface Nov10GameView : UIView {
    NSArray *computerObjects;
    NSArray *playerObjects;
    NSInteger computerChoice;
    NSInteger playerChoice;
    UIImageView * computer0;
    UIButton * goButton;
    UILabel *playerLabel, *computerLabel;

}

-(void)goButtonPressed;
-(void)playerIsDone;

-(void) place: (Nov10objectView *) objView atPosition: (CGRect ) pos;


@property (nonatomic, retain) UIButton *goButton;

@end
