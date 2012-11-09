//
//  Mensa.h
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Menu;

@interface Mensa : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) Menu *menu;

@end
