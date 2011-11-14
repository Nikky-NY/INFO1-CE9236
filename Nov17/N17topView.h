//
//  N17topView.h
//  Nov17
//
//  Created by Nicolas baudouin on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface N17topView : UIView {
    NSArray *views;
	NSUInteger index;
}
-(void)doit2;
-(void)selectTheTopView:(NSInteger) indice;

@end
