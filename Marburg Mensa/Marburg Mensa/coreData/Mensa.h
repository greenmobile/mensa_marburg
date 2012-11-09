//
//  Mensa.h
//  Marburg Mensa
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Mensa : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *menu;
@end

@interface Mensa (CoreDataGeneratedAccessors)

- (void)addMenuObject:(NSManagedObject *)value;
- (void)removeMenuObject:(NSManagedObject *)value;
- (void)addMenu:(NSSet *)values;
- (void)removeMenu:(NSSet *)values;

@end
