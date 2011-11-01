//
//  NYUDate.m
//  NYU-IOS
//
//  Created by nicolas baudouin on 13/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NYUDate.h"

@implementation NYUDate

@synthesize dateFormat;

-(id)initWithDay:(int) d Month:(int) m  Year:(int) y {
    
    self = [super init];
    if (self != nil) {
        year = y;
        month = m;
        day = d;
    }
    
    dateFormat = NSLocalizedString(@"DateFormat", @"for date");
    
    return self;
}

-(int)day {
    return self.day;
}
-(int)month {
    return self.month;
}
-(int)year {
    return self.year;
}
-(void)setDay: (int)d {
    self.day = d;
}
-(void)setMonth: (int)m {
    self.month = m;
}
-(void)setYear: (int)y {
    self.year = y;
}

-(BOOL) isEqual: (NYUDate *) another {
    return year == another.year && month == another.month && day == another.day;
}

-(int) monthLength {  // to be modified
    if (month == 1) {
        return 31;
    }
    else {
        return 30;
    }
}

-(void) next {
    if (day < [self monthLength]) {
        ++day;
        return;
    }
    day = 1;
    if (month < 12) {
        ++month;
        return;
    }
    month = 1;
    ++ year;
}

- (NSString *) description {
    if ([dateFormat isEqualToString:@"DD/MM/YYYY"] ) {
        return [NSString stringWithFormat:@"%d/%d/%d", day,month,year];
    }
    return [NSString stringWithFormat:@"%d/%d/%d", month,day, year];
}

// this a class method !!!!!!
+ (int) yearLength {
    return 12;
}

-(void) dealloc {
    //[super dealloc];
}

@end
