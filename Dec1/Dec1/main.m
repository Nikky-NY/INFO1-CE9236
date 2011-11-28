//
//  main.m
//  Dec1
//
//  Created by Nicolas baudouin on 21/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "D1AppDelegate.h"

int main(int argc, char *argv[])
{
    srand(time(NULL));
    @autoreleasepool {
        int retVal;
         retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([D1AppDelegate class]));
        return retVal;
    }
}
