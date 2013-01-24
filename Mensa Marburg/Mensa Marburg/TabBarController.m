//
//  TabBarController.m
//  Mensa Marburg
//
//  Created by Tillmann on 28.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "TabBarController.h"
#import "MenuViewController.h"
#import "Mensa.h"

@interface TabBarController (){
    NSArray *myMensae;
    NSArray *ViewController;
}

@end

@implementation TabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        //load Mensae
    myMensae = [Mensa MR_findAll];

        //init ViewController
    NSMutableArray *mutableViewController = [[NSMutableArray alloc] init];
    for (Mensa *myMensa in myMensae) {
        

        MenuViewController *mvc = [[MenuViewController alloc] initWithMensa:myMensa];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
        [mutableViewController addObject:navController];
    }
    
    myMensae = mutableViewController;
        //add ViewController to TabBar
    self.viewControllers = myMensae;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
