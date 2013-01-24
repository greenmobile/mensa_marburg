//
//  AppDelegate.m
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreData+MagicalRecord.h"
#import "MenuViewController.h"
#import "SecondViewController.h"
#import "Mensa.h"
#import "Menu.h"
#import "TabBarController.h"
#import "FeedViewController.h"

@implementation AppDelegate

- (void)initTestData{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    [Mensa MR_truncateAll];
    [Menu MR_truncateAll];
    
    Mensa *myMensa = [Mensa MR_createInContext:localContext];
    myMensa.name = @"Mensa Erlenring";
    myMensa.rssString = @"http://www.studentenwerk-marburg.de/?id=414";
    myMensa.id = [NSNumber numberWithInt:1];
    
//    Menu *myMenu = [Menu MR_createInContext:localContext];
//    myMenu.desc = @"lecker Truthahn";
    
   // NSSet *menus = [[NSSet alloc] initWithObjects:myMenu, nil];
    //myMensa.menu = menus;
    
    Mensa *myMensa2 = [Mensa MR_createInContext:localContext];
    myMensa2.rssString = @"http://www.studentenwerk-marburg.de/navimeta/rss-feeds/rssfeedspeiseplanmensalahnberge.html";
    myMensa2.name = @"Mensa Lahnberge";
    
    Mensa *myMensa3 = [Mensa MR_createInContext:localContext];
    myMensa3.name = @"Bistro";
    myMensa3.rssString = @"http://www.studentenwerk-marburg.de/navimeta/rss-feeds/rssfeedspeiseplanbistro.html";

    [localContext MR_saveInBackgroundErrorHandler:^(NSError *error) {
    } completion:^{
        
    }];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Model.sqlite"];

    [self initTestData];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    self.tabBarController = [[TabBarController alloc] init];
    self.window.rootViewController = self.tabBarController;
    
    //FeedViewController *fvc = [[FeedViewController alloc] init];
    //self.window.rootViewController = fvc;
    
    [self.window makeKeyAndVisible];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];

}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
