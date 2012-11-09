//
//  FeedReader.m
//  Marburg Mensa
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "FeedReader.h"

@implementation FeedReader


-(void)parseFeed:(NSURL *)feedUrl{
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithContentsOfURL:feedUrl];
    
    [myParser parse];
}
@end
