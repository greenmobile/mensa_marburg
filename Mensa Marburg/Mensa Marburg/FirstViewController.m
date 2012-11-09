//
//  FirstViewController.m
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "FirstViewController.h"
#import "Mensa.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadMensae];
    [self printMensae];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - feedReader

-(void)reedFeeds{
    
}

#pragma mark - loading from CoreData

-(void)loadMensae{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    Mensa *myMensa = [Mensa MR_createInContext:localContext];
    myMensa.name = @"Mensa Erlenring";

    Mensa *myMensa2 = [Mensa MR_createInContext:localContext];
    myMensa2.name = @"Mensa Lahnberge";
    
    [localContext MR_save];
}

-(void)printMensae{
    NSArray *Mensae = [Mensa MR_findAll];
    NSLog(@"%@",Mensae);
}

@end
