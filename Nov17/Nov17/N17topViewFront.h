//
//  N17topViewFront.h
//  Nov17
//
//  Created by Nicolas baudouin on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class N17mainView;

@interface N17topViewFront : UIImageView{
    N17mainView * bigView;
}

- (id)initWithView: (UIView *) v Image:(UIImage *)image Frame : (CGRect) f;

@end
