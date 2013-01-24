//
//  FeedReader.m
//  Mensa Marburg
//
//  Created by heigel on 09.11.12.
//  Copyright (c) 2012 greenmobile Innovations. All rights reserved.
//

#import "FeedReader.h"
#import "Menu.h"
#import "Mensa.h"

@implementation FeedReader{
    NSXMLParser * addressParser;
    Mensa *currentMensa;
}

@synthesize currentDate;
@synthesize currentLink;
@synthesize currentDescription;
@synthesize currentPodcastLink;
@synthesize items;
@synthesize currentSummary;
@synthesize currentTitle;
@synthesize responseData;


- (void)parseRssFeedForMensa:(Mensa *)myMensa withDelegate:(id)aDelegate {
	[self setDelegate:aDelegate];
    
    NSLog(@"start reload for mensa: %@",myMensa.name);
    
    currentMensa = myMensa;
	responseData = [NSMutableData data];
    NSString *urlString = myMensa.rssString;
	NSURL *baseURL = [NSURL URLWithString:urlString];
	
	
	NSURLRequest *request = [NSURLRequest requestWithURL:baseURL];
	
	NSURLConnection *connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connect start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString * errorString = [NSString stringWithFormat:@"Unable to download xml data (Error code %i )", [error code]];
	
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connection did finish loading: %@",currentMensa.name);
    
	self.items = [[NSMutableArray alloc] init];
    	
	NSXMLParser *rssParser = [[NSXMLParser alloc] initWithData:responseData];
	
	[rssParser setDelegate:self];
	
	[rssParser parse];
}

#pragma mark rssParser methods

- (void)parserDidStartDocument:(NSXMLParser *)parser {
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	currentElement = [elementName copy];
	
    if ([elementName isEqualToString:@"item"]) {
        item = [[NSMutableDictionary alloc] init];
        self.currentTitle = [[NSMutableString alloc] init];
        self.currentLink = [[NSMutableString alloc] init];
		self.currentDescription = [[NSMutableString alloc] init];
    }
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:self.currentTitle forKey:@"title"];
        [item setObject:self.currentLink forKey:@"link"];
		[item setObject:self.currentDescription forKey:@"description"];
		
        [items addObject:[item copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if ([currentElement isEqualToString:@"title"]) {
        [self.currentTitle appendString:string];
    } else if ([currentElement isEqualToString:@"link"]) {
        [self.currentLink appendString:string];
    } else if ([currentElement isEqualToString:@"description"]) {
        [self.currentDescription appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"parsing did end document: %@",currentMensa.name);
    
    NSLog(@"items: %@",items);

	if ([_delegate respondsToSelector:@selector(receivedItems:)]){
            
        for (NSMutableDictionary *curItem in items) {
            
            //get item description
            NSMutableString *desc = [curItem objectForKey:@"description"];
            NSMutableString *name = [curItem objectForKey:@"title"];
            
            //get day/month/year date components
            unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
            NSCalendar* calendar = [NSCalendar currentCalendar];
            NSDateComponents* components = [calendar components:flags fromDate:[NSDate date]];
            NSDate* dateOnly = [calendar dateFromComponents:components];
            
            //find curItem in Database
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"desc == %@ AND name == %@ AND date == %@",desc,name,dateOnly];
            NSArray *menuArray = [Menu MR_findAllWithPredicate:predicate];
            NSLog(@"current stored menus: %@",menuArray);

            //add curItem in Database
            if ([menuArray count] == 0) {
                Menu *myMenu = [Menu MR_createEntity];
                [myMenu setDesc:desc];
                [myMenu setName:name];
                [myMenu setDate:dateOnly];
                if ([myMenu.mensa count] == 0) {
                    [myMenu setMensa:[[NSSet alloc] initWithObjects:currentMensa, nil]];
                } else {
                    NSMutableSet *mensae = [NSMutableSet setWithSet:myMenu.mensa];
                    [mensae addObject:currentMensa];
                    [myMenu setMensa:mensae];
                }}
            
        }
        
        [_delegate receivedItems:items];
    }
    else
    {
        [NSException raise:NSInternalInconsistencyException
					format:@"Delegate doesn't respond to receivedItems:"];
    }
}



- (NSString*)loadFeed{
    return @"a";
}

- (void)parseXMLFile:(NSString *)pathToFile {
//    BOOL success;
//    NSURL *xmlURL = [NSURL fileURLWithPath:pathToFile];
//    if (addressParser) // addressParser is an NSXMLParser instance variable
//    addressParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
//    [addressParser setDelegate:self];
//    [addressParser setShouldResolveExternalEntities:YES];
//    success = [addressParser parse]; // return value not used
//    // if not successful, delegate is informed of error
}

#pragma mark Delegate methods

- (id)delegate {
	return _delegate;
}

- (void)setDelegate:(id)new_delegate {
	_delegate = new_delegate;
}

@end
