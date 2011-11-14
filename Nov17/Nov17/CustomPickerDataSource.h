//
//  CustomPickerDataSource.h
//  Nov17
//
//  Created by Nicolas baudouin on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "N17bottomView.h"


@interface CustomPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
	NSArray	*customPickerArray;
    N17bottomView *masterView;
}

-(id)initWithView: (N17bottomView *) v;
@property (nonatomic, retain) NSArray *customPickerArray;

@end
