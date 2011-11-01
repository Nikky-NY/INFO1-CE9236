//
//  NYUDate.h
//  NYU-IOS
//
//  Created by nicolas baudouin on 13/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYUDate : NSObject {
    int day;
    int month;
    int year;
    NSString *dateFormat;
}

@property (nonatomic, retain) NSString *dateFormat;

-(int)day;
-(int)month;
-(int)year;

-(void)setDay: (int)d;
-(void)setMonth: (int)m;
-(void)setYear: (int)y;

-(int) monthLength;
-(void) next;
-(BOOL) isEqual: (NYUDate *) another;

-(id)initWithDay:(int) d Month: (int) m  Year :(int) y;

@end
