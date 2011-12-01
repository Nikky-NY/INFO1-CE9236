//
//  SetUpView.h
//  Dec1
//
//  Created by Nicolas baudouin on 30/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SetUpViewController;

@interface SetUpView : UIView {
    SetUpViewController *setupController;
    UILabel *setupLabel, *dxlabel, *dylabel;
    UISlider *xslider, *yslider;
}

- (id)initWithFrame:(CGRect)frame controller: (SetUpViewController *) c ;

@end
