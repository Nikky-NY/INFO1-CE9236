//
//  Nov10GameView.m
//  Nov10
//
//  Created by Nicolas baudouin on 05/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Nov10GameView.h"
#import "Nov10objectView.h"

@implementation Nov10GameView


@synthesize goButton;
@synthesize computerChoice;
@synthesize playerChoice;
@synthesize playerCount;
@synthesize computerCount;

-(void) place: (Nov10objectView *) objView atPosition: (CGRect) pos{
    NSLog(@"place");
    objView.frame = CGRectMake(pos.origin.x ,pos.origin.y,pos.size.width,pos.size.height);
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        computerChoice = NO_CHOICE;
        playerChoice = NO_CHOICE;
        computerCount = 0;
        playerCount = 0;
        resultsMatrix = [[NSArray alloc] initWithObjects:
                         [[NSArray alloc] initWithObjects:@"Nil",@"Comp",@"Play",@"Play",@"Comp",nil],
                         [[NSArray alloc] initWithObjects:@"Play",@"Nil",@"Comp",@"Comp",@"Play",nil],
                         [[NSArray alloc] initWithObjects:@"Comp",@"Play",@"Nil",@"Play",@"Comp",nil],
                         [[NSArray alloc] initWithObjects:@"Comp",@"Play",@"Comp",@"Nil",@"Play",nil],
                         [[NSArray alloc] initWithObjects:@"Play",@"Comp",@"Play",@"Comp",@"Nil",nil]
                        ,nil];
        
        /*  computer            Rock    Paper   Scissor     Lizard    Spock
            Player      Rock    Nil     Comp    Play        Play      Comp
            Player      Paper   Play    Nil     Comp        Comp      Play
            Player      Scissor Comp    Play    Nil         Play      Com
            Player      Lizard  Comp    Play    Comp        Nil       Play
            Player      Spock   Play    Comp    Play        Comp      Nil
         */
         
         
         
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        CGRect cg1 = CGRectMake(0,6,64,64);
        CGRect cg2 = CGRectMake(64,6,64,64);
        CGRect cg3 = CGRectMake(128,6,64,64);
        CGRect cg4 = CGRectMake(192,6,64,64);
        CGRect cg5 = CGRectMake(256,6,64,64);
        CGRect computerTarget = CGRectMake(256,76, 64,64);
        
        computerObjects = [NSArray arrayWithObjects:
                           [[Nov10objectView alloc] initWithView:self basePos:cg1 targetPos:computerTarget activated:NO image:@"Stone.png" number: 0],
                           [[Nov10objectView alloc] initWithView:self basePos:cg2 targetPos:computerTarget activated:NO image:@"paper.png" number: 1],
                           [[Nov10objectView alloc] initWithView:self basePos:cg3 targetPos:computerTarget activated:NO image:@"Scissors.png"number :2],
                           [[Nov10objectView alloc] initWithView:self basePos:cg4 targetPos:computerTarget activated:NO image:@"Lizard.png" number: 3],
                           [[Nov10objectView alloc] initWithView:self basePos:cg5 targetPos:computerTarget activated:NO image:@"spock.png" number: 4],
                    nil];
        
        for (NSInteger i =0;i< computerObjects.count;i++){
            Nov10objectView *v = [computerObjects objectAtIndex:i];
            [self addSubview:v];
        }
        
        cg1 = CGRectMake(0,390,64,64);
        cg2 = CGRectMake(64,390,64,64);
        cg3 = CGRectMake(128,390,64,64);
        cg4 = CGRectMake(192,390,64,64);
        cg5 = CGRectMake(256,390,64,64);
        CGRect playerTarget = CGRectMake(256,320, 64,64);
        
        playerObjects = [NSArray arrayWithObjects:
                         [[Nov10objectView alloc] initWithView:self basePos:cg1 targetPos:playerTarget activated:YES image:@"Stone.png" number : 0],
                         [[Nov10objectView alloc] initWithView:self basePos:cg2 targetPos:playerTarget activated:YES image:@"paper.png" number : 1],
                         [[Nov10objectView alloc] initWithView:self basePos:cg3 targetPos:playerTarget activated:YES image:@"Scissors.png" number: 2],
                         [[Nov10objectView alloc] initWithView:self basePos:cg4 targetPos:playerTarget activated:YES image:@"Lizard.png" number: 3],
                         [[Nov10objectView alloc] initWithView:self basePos:cg5 targetPos:playerTarget activated:YES image:@"spock.png" number:4],
                    nil];
       
        
        for (NSInteger i =0;i< playerObjects.count;i++){
            Nov10objectView *v = [playerObjects objectAtIndex:i];
            [playerObjects objectAtIndex:i];
            [self addSubview:v];
            
        
        }
        CGRect cgButton = CGRectMake(10, 210, 100,40);
        goButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		goButton.frame = cgButton;
        
		[goButton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[goButton setTitle: @" Restart " forState: UIControlStateNormal];
        
		[goButton addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        [goButton setHidden:YES];
        
		[self addSubview: goButton];
        
        
        
        NSString *ptext = @"PLAYER";
        NSString *ctext =@"COMPUTER";
        NSString *unknow =@"-----------";
        
		UIFont *font = [UIFont italicSystemFontOfSize: 18];
		//CGSize size = [text sizeWithFont: font];
		
		CGRect f = CGRectMake(0,320, 150,64);
		playerLabel = [[UILabel alloc] initWithFrame: f];
		playerLabel.font = font;
		playerLabel.backgroundColor = [UIColor clearColor];
		playerLabel.textColor = [UIColor blackColor];
        playerLabel.textAlignment = UITextAlignmentCenter;
		playerLabel.text = ptext;
		[self addSubview: playerLabel];
        
        f = CGRectMake(160,320, 64,64);
		playerCountLabel = [[UILabel alloc] initWithFrame: f];
		playerCountLabel.font = font;
		playerCountLabel.backgroundColor = [UIColor clearColor];
		playerCountLabel.textColor = [UIColor redColor];
        playerCountLabel.textAlignment = UITextAlignmentCenter;
		playerCountLabel.text = [NSString stringWithFormat:@"%d",  playerCount ];
		[self addSubview: playerCountLabel];

        
        f = CGRectMake(0,76, 150,64);
        computerLabel = [[UILabel alloc] initWithFrame: f];
		computerLabel.font = font;
		computerLabel.backgroundColor = [UIColor clearColor];
		computerLabel.textColor = [UIColor blackColor];
        computerLabel.textAlignment = UITextAlignmentCenter;
		computerLabel.text = ctext;
		[self addSubview: computerLabel];
        
        f = CGRectMake(160,76, 64,64);
        computerCountLabel = [[UILabel alloc] initWithFrame: f];
		computerCountLabel.font = font;
		computerCountLabel.backgroundColor = [UIColor clearColor];
		computerCountLabel.textColor = [UIColor redColor];
        computerCountLabel.textAlignment = UITextAlignmentCenter;
		computerCountLabel.text = [NSString stringWithFormat:@"%d",  computerCount ];
		[self addSubview: computerCountLabel];
        
        f = CGRectMake(120,210, 200,40);
		resultLabel = [[UILabel alloc] initWithFrame: f];
		resultLabel.font = font;
		resultLabel.backgroundColor = [UIColor clearColor];
		resultLabel.textColor = [UIColor blackColor];

        resultLabel.textAlignment = UITextAlignmentCenter;
		resultLabel.text = unknow;
		[self addSubview: resultLabel];
        

    }
    return self;
}

-(void)playerIsDone: (NSInteger) choice {
    playerChoice = choice;
    computerChoice = rand() % computerObjects.count; 
    Nov10objectView *comp = [computerObjects objectAtIndex: computerChoice];
    [UIView animateWithDuration:0.2
                          delay: 0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         [self place:comp atPosition: comp.targetPos];  
                     } completion:NULL     ];
    [goButton setHidden:NO];
    NSString * result = [[resultsMatrix objectAtIndex:playerChoice]objectAtIndex:computerChoice];
    if (result == @"Nil"){
        resultLabel.text = @"Nil !!!";
    }
    else if (result == @"Play") {
         resultLabel.text = @"Player Win !";
        playerCount ++;
        playerCountLabel.text = [NSString stringWithFormat:@"%d",  playerCount ];
    }
    else {
         resultLabel.text = @"Computer Win !";
        computerCount ++;
        computerCountLabel.text = [NSString stringWithFormat:@"%d",  computerCount ];
    }
        
    //[comp touchesBegan: nil withEvent: nil];
}

-(void)goButtonPressed {
    // do something to Go !!!
    for (NSInteger i =0;i< computerObjects.count;i++){
        Nov10objectView *v = [computerObjects objectAtIndex:i];
        CGRect pos = [v basePos];
        [UIView animateWithDuration:0.2
                              delay: 0
                            options: UIViewAnimationCurveEaseInOut
                         animations:^{
                             [self place:v atPosition: pos];  
                         } completion:NULL];

    }
    for (NSInteger i =0;i< playerObjects.count;i++){
        Nov10objectView *v = [playerObjects objectAtIndex:i];
        CGRect pos = [v basePos];
        [UIView animateWithDuration:0.2
                              delay: 0
                            options: UIViewAnimationCurveEaseInOut
                         animations:^{
                             [self place:v atPosition: pos];  
                         } completion:NULL];        
    }
    [goButton setHidden:YES];
    computerChoice = NO_CHOICE;
    playerChoice = NO_CHOICE;
     resultLabel.text = @"-----------";
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
