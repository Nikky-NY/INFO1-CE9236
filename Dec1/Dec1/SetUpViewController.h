//
//  SetUpViewController.h
//  Dec1
//
//  Created by Nicolas baudouin on 30/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetUpViewController : UIViewController {
    NSInteger dx, dy;
}

@property (nonatomic, atomic) NSInteger dx;
@property (nonatomic, atomic) NSInteger dy;

-(void) setmyDx: (float) x Dy :(float) y ;

@end
