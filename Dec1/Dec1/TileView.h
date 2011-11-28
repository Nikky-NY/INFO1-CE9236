//
//  TileView.h
//  Dec1
//
//  Created by Nicolas baudouin on 26/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIImageView {
    BOOL activated;
}
- (id)initWithFrame: (CGRect) base activated: (BOOL) a image: (NSString *) s ;
- (void)changeStatus;

@property (nonatomic, atomic) CGRect position;
@property (nonatomic, atomic) BOOL activated;
@end
