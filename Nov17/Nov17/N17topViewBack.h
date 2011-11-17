//
//  N17topViewBack.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface N17topViewBack : UIView {
    UIButton *button;
    UIImageView *image;
    UISlider *slider;
    UISegmentedControl *segment;
    UISwitch *sw;
    UIPageControl *page;
    NSDictionary * displayImages;
    UILabel *topLabel;
    UILabel *downLabel;
    SystemSoundID sid, sid1, sid2,sid3;
    
}
-(void) selectTheDisplay:(NSInteger) indice;


@end
