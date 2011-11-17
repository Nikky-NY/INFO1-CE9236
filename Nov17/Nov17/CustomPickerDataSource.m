//
//  CustomPickerDataSource.m
//  Nov17
//
//  Created by Nicolas baudouin on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerDataSource.h"
#import "CustomView.h"

@implementation CustomPickerDataSource

@synthesize customPickerArray;

- (id)initWithView: (N17bottomView *) v {
	// use predetermined frame size
	self = [super init];
	if (self)
	{
        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
        masterView = v;
        CustomView *hide = [[CustomView alloc] initWithFrame:CGRectZero];
        hide.title = @"Hide";
        hide.image = [UIImage imageNamed:@"hat.png"];
        [viewArray addObject:hide];
        
        CustomView *binoculars = [[CustomView alloc] initWithFrame:CGRectZero];
        binoculars.title = @"Binoculars";
        binoculars.image = [UIImage imageNamed:@"binoculars.png"];
        [viewArray addObject:binoculars];
        
        CustomView *bomb = [[CustomView alloc] initWithFrame:CGRectZero];
        bomb.title = @"Bomb !";
        bomb.image = [UIImage imageNamed:@"bomb.png"];
        [viewArray addObject:bomb];
        
        CustomView *help = [[CustomView alloc] initWithFrame:CGRectZero];
        help.title = @"Get Help !";
        help.image = [UIImage imageNamed:@"help.png"];
        [viewArray addObject:help];
        
        CustomView *gun = [[CustomView alloc] initWithFrame:CGRectZero];
        gun.title = @"Choose gun !";
        gun.image = [UIImage imageNamed:@"gun2.png"];
        [viewArray addObject:gun];
        
        CustomView *tape = [[CustomView alloc] initWithFrame:CGRectZero];
        tape.title = @"M.I. Tape";
        tape.image = [UIImage imageNamed:@"microphone-icon.png"];
        [viewArray addObject:tape];
        
        CustomView *target = [[CustomView alloc] initWithFrame:CGRectZero];
        target.title = @"Target lock";
        target.image = [UIImage imageNamed:@"QuestionMarkBlack.png"];
        [viewArray addObject:target];
        
        CustomView *foo = [[CustomView alloc] initWithFrame:CGRectZero];
        foo.title = @"foo()  ...";
        foo.image = [UIImage imageNamed:@"QuestionMarkBlack.png"];
        [viewArray addObject:foo];

        CustomView *foo83 = [[CustomView alloc] initWithFrame:CGRectZero];
        foo83.title = @"foo() 83.";
        foo83.image = [UIImage imageNamed:@"QuestionMarkBlack.png"];
        [viewArray addObject:foo83];
        
        
        
        self.customPickerArray = viewArray;
    }
    return self;
}



#pragma mark -
#pragma mark UIPickerViewDataSource

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return [CustomView viewWidth];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return [CustomView viewHeight];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [customPickerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

#pragma mark -
#pragma mark UIPickerViewDelegate

// tell the picker which view to use for a given component and row, we have an array of views to show
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
forComponent:(NSInteger)component reusingView:(UIView *)view
{
	return [customPickerArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	// If the user chooses a new row, update the label accordingly.
	//[self updateLabel];
    NSLog(@"On y est %d %d", row, component);
    [masterView doit:row];
}

@end
