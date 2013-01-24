//
//  FirstViewController.m
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "MenuViewController.h"
#import "Mensa.h"
#import "Menu.h"
#import "FeedReader.h"

@interface MenuViewController (){
    NSArray *menus;
}

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (id)initWithMensa:(Mensa *)myMensa
{
    self = [super init];
    if (self) {
        self.myMensa = myMensa;
        self.title = myMensa.name;
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initializing the navigation bar
    self.navigationController.navigationBar.hidden = false;
    
    //adding a reloadButton
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload)]  ;
    
   
}

- (void)viewWillAppear:(BOOL)animated{
    //Do a reload:
    [self reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload{
    
    //read feads
    FeedReader *rssParser = [[FeedReader alloc] init];
    [rssParser parseRssFeedForMensa:_myMensa withDelegate:self];
    
    //
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    //DURCHBRUCH :)
    menus = [_myMensa.menu allObjects];
    
    //menus = [Menu MR_findAllInContext:localContext];
    if ([menus count]>0) {
        Menu *truthahn = [menus objectAtIndex:0];
        NSSet *mensa = truthahn.mensa;
        NSLog(@"menuMensa: %@", [mensa anyObject]);

    }
   }

#pragma mark - feedReader

-(void)reedFeeds{
    
}


#pragma mark - tableView methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellId = @"mensaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    Menu *menu = [menus objectAtIndex:indexPath.row];
    cell.textLabel.text = menu.desc;
    cell.detailTextLabel.text = menu.name;
    return cell;
}

#pragma mark - FeedReader methods

- (void)receivedItems:(NSArray *)theItems {
    [[self table] reloadData];
}

@end
