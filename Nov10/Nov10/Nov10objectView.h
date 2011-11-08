//
//  Nov10objectView.h
//  Nov10
//
//  Created by Nicolas baudouin on 06/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Nov10GameView;

@interface Nov10objectView : UIImageView {
    Nov10GameView *gameView;
    CGRect basePos, targetPos;
    //position;
}

//- (id)initWithView: (Nov10GameView *) v position: (CGRect *) p;
- (id)initWithView: (Nov10GameView *) v basePos: (CGRect) base targetPos: (CGRect) target activated: (BOOL) a image: (NSString *) s;
@property (nonatomic, atomic) CGRect basePos;
@property (nonatomic, atomic) CGRect targetPos;

@end
