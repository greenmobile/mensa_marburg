//
//  FeedReader.h
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mensa.h"

@protocol ParserDelegate <NSObject>
- (void)receivedItems:(NSArray *)theItems;
@end

@interface FeedReader : NSObject <NSXMLParserDelegate>{
    NSMutableDictionary *item;
    NSString *currentElement;

    id _delegate;
}

@property (retain, nonatomic) NSMutableData *responseData;
@property (retain, nonatomic) NSMutableArray *items;
@property (retain, nonatomic) NSMutableString *currentDate;
@property (retain, nonatomic) NSMutableString *currentSummary;
@property (retain, nonatomic) NSMutableString *currentPodcastLink;

@property (retain, nonatomic) NSMutableString *currentTitle;
@property (retain, nonatomic) NSMutableString *currentDescription;
@property (retain, nonatomic) NSMutableString *currentLink;
@property (retain, nonatomic) NSNumber *currentPrice;



- (void)parseRssFeedForMensa:(Mensa *)myMensa withDelegate:(id)aDelegate;

- (NSString*)loadFeed;

- (id)delegate;
- (void)setDelegate:(id)new_delegate;


@end
