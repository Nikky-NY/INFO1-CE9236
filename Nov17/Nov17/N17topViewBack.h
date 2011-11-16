//
//  N17topViewBack.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface N17topViewBack : UIView {
    UIButton *button;
    UIImageView *image;
    UISlider *slider;
    UISegmentedControl *segment;
    UISwitch *sw;
    UIPageControl *page;
    NSDictionary * displayImages;
    UILabel *topLabel;
    UILabel *downLablel;
    
}
-(void) selectTheDisplay:(NSInteger) indice;


@end
