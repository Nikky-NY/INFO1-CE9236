//
//  Nov10objectView.m
//  Nov10
//
//  Created by Nicolas baudouin on 06/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10objectView.h"
#import "Nov10GameView.h"

@implementation Nov10objectView

- (id)initWithView: (Nov10GameView *) v basePos: (CGRect) base targetPos: (CGRect) target image: (NSString *) s{
    
    UIImage *image = [UIImage imageNamed: s];
    self = [super initWithImage:image];
    if (self) {
        self.userInteractionEnabled = YES;
        gameView = v;
        basePos = base;
        targetPos = target;
        [gameView place: self atPosition: basePos];
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.2
                        delay: 0
                        options: UIViewAnimationCurveEaseInOut
     animations:^{
         [gameView place:self atPosition: targetPos];  
     } completion:NULL];
    
}


@end
