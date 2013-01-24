//
//  Menu.h
//  Mensa Marburg
//
//  Created by Tillmann on 20.12.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Mensa;

@interface Menu : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSSet *mensa;
@end

@interface Menu (CoreDataGeneratedAccessors)

- (void)addMensaObject:(Mensa *)value;
- (void)removeMensaObject:(Mensa *)value;
- (void)addMensa:(NSSet *)values;
- (void)removeMensa:(NSSet *)values;

@end
