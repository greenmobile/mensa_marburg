//
//  FeedViewController.m
//  Mensa Marburg
//
//  Created by Tillmann on 07.01.13.
//  Copyright (c) 2013 greenmobile Innovations. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedReader.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

@synthesize items;

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
    FeedReader *rssParser = [[FeedReader alloc] init];
    //[rssParser parseRssFeed:@"http://www.studentenwerk-marburg.de/?id=414w" withDelegate:self];
        
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receivedItems:(NSArray *)theItems {
  	
    items = theItems;
    NSLog(@"%@",items);
}

@end
