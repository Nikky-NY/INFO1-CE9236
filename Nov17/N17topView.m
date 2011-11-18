//
//  N17topView.m
//  Nov17
//
//  Created by Nicolas baudouin on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "N17topView.h"
#import "N17topViewFront.h"
#import "N17topViewBack.h"

@implementation N17topView


-(void)buttonPressed: (id) sender {
    NSLog(@" SUPERVIEW buttonPressed");
    
}


-(void)moveToFrontView{
    NSInteger nextIndex = 0;
    NSLog(@"index %d", index);
    if (index == 0) { nextIndex = 1;}
    else {
        nextIndex = 0;
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: nextIndex]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
        index = nextIndex;
        nextIndex = 1;
    }
    
    index = nextIndex;
}
-(void)selectTheTopView:(NSInteger) indice {
    NSLog(@"Indice = %d", indice);
    NSInteger nextIndex = 0;
    if (index == 0) { nextIndex = 1;}
    else {
        nextIndex = 0;
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: nextIndex]
                          duration: 2.25
                           options: UIViewAnimationOptionTransitionFlipFromRight
                        completion: NULL
         ];
        index = nextIndex;
        nextIndex = 1;
    }
    
    [[views objectAtIndex: 1] selectTheDisplay:indice];

    
    [UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: nextIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionFlipFromRight
                    completion: NULL
     ];
    index = nextIndex;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed: @"Phone.png"];
        index = 0;
        views = [NSArray arrayWithObjects:
                 [[N17topViewFront alloc] initWithView: self Image:image Frame:frame],
                 [[N17topViewBack alloc] initWithFrame:frame],
                 nil
                 ];
        [self addSubview: [views objectAtIndex: index]];
        
        /*UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(handleSingle:)
                                             ];
        singleTap.numberOfTapsRequired = 1;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(handleDouble:)
                                             ];
        doubleTap.numberOfTapsRequired = 2;
        
        //Don't call handleSingle: until we know for sure
        //that this tap is not the first tap of a double tap.
        [singleTap requireGestureRecognizerToFail: doubleTap];
        
        [self addGestureRecognizer: singleTap];
        [self addGestureRecognizer: doubleTap];*/
    }
    return self;
}
/*
- (void) handleSingle: (UITapGestureRecognizer *) recognizer {
    
    NSInteger nextIndex = 0;
    if (index == 0) { nextIndex = 1;}
    else {nextIndex = 0;}
        
    [UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: nextIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionFlipFromRight
                    completion: NULL
     ];
    index = nextIndex;
    
    [self performSelector: @selector(wearOff) withObject: nil afterDelay: 2];
}

- (void) handleDouble: (UITapGestureRecognizer *) recognizer {
    
    [self performSelector: @selector(wearOff) withObject: nil afterDelay: 2];
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
