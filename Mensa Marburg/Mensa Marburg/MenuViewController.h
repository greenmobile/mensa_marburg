//
//  FirstViewController.h
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mensa.h"


@interface MenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic)     Mensa *myMensa;


@end
