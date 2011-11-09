//
//  Nov10GameView.h
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NO_CHOICE 99;
@class Nov10objectView;


@interface Nov10GameView : UIView {
    NSArray *computerObjects;
    NSArray *playerObjects;
    NSArray *resultsMatrix;
    NSInteger computerChoice, computerCount;
    NSInteger playerChoice, playerCount;
    UIImageView * computer0;
    UIButton * goButton;
    UILabel *playerLabel, *computerLabel, *resultLabel, *playerCountLabel, *computerCountLabel;

}

-(void)goButtonPressed;
-(void)playerIsDone: (NSInteger) choice;
@property NSInteger computerChoice;
@property NSInteger playerChoice;
@property NSInteger computerCount;
@property NSInteger playerCount;

-(void) place: (Nov10objectView *) objView atPosition: (CGRect ) pos;


@property (nonatomic, retain) UIButton *goButton;

@end
