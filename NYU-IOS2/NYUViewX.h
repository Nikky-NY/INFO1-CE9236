//
//  NYUViewX.h
//  NYU-IOS2
//
//  Created by Nicolas baudouin on 01/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYUViewX : UIView {
    IBOutlet  UILabel *timeLabel;
    IBOutlet UIButton *timeButton;
}

-(IBAction)showTime:(id)sender;
@end
