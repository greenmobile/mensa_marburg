//
//  Mensa.h
//  Mensa Marburg
//
//  Created by Tillmann on 08.01.13.
//  Copyright (c) 2013 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Menu;

@interface Mensa : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rssString;
@property (nonatomic, retain) NSSet *menu;
@end

@interface Mensa (CoreDataGeneratedAccessors)

- (void)addMenuObject:(Menu *)value;
- (void)removeMenuObject:(Menu *)value;
- (void)addMenu:(NSSet *)values;
- (void)removeMenu:(NSSet *)values;

@end
