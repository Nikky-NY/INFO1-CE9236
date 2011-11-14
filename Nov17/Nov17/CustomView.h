//
//  CustomView.h
//  Nov17
//
//  Created by Nicolas baudouin on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
{
	NSString *title;
	UIImage *image;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIImage *image;

+ (CGFloat)viewWidth;
+ (CGFloat)viewHeight;

@end
