//
//  Menu.h
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Menu : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;

@end
