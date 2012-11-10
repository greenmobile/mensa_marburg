//
//  FeedReader.m
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "FeedReader.h"

@implementation FeedReader{
    NSXMLParser * addressParser;
}

- (void)parseXMLFile:(NSString *)pathToFile {
    BOOL success;
    NSURL *xmlURL = [NSURL fileURLWithPath:pathToFile];
    if (addressParser) // addressParser is an NSXMLParser instance variable
    addressParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [addressParser setDelegate:self];
    [addressParser setShouldResolveExternalEntities:YES];
    success = [addressParser parse]; // return value not used
    // if not successful, delegate is informed of error
}
@end
