//
//  N17bottomView.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomPickerDataSource;
@class N17topView;


@interface N17bottomView : UIView {
    UILabel *bottomLabel;
    UIPickerView *picker;
    CustomPickerDataSource *customPickerDataSource;
    N17topView *top;
}

-(void) setTop:(N17topView *)t;
-(void) doit:(NSInteger) r;

@end
