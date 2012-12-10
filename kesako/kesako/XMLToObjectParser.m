//
//  XMLToObjectParser.m
//  kesako
//
//  Created by Laïla Atrmouh on 10/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "XMLToObjectParser.h"

@implementation XMLToObjectParser

- (NSArray *)items
{
	return items;
}

- (id)parseXMLAtURL:(NSURL *)url
		   toObject:(NSString *)aClassName
		 parseError:(NSError **)error
{
	items = nil;
	items = [[NSMutableArray alloc] init];
	className = aClassName;
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[parser setDelegate:self];
	[parser parse];
    
	if([parser parserError] && error) {
		*error = [parser parserError];
	}
	parser = nil;
	return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	NSLog(@"Open tag: %@", elementName);
	if([elementName isEqualToString:className]) {
		// create an instance of a class on run-time
		item = [[NSClassFromString(className) alloc] init];
	}
	else {
		currentNodeName = [elementName copy];
		currentNodeContent = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
	NSLog(@"Close tag: %@", elementName);
	if([elementName isEqualToString:className]) {
		[items addObject:item]; 
		item = nil;
	}
	else if([elementName isEqualToString:currentNodeName]) {
		// use key-value coding
		[item setValue:currentNodeContent forKey:elementName];
         
		currentNodeContent = nil;
         
		currentNodeName = nil;
	}
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
	[currentNodeContent appendString:string];
}

- (void)dealloc
{
	items = nil; 
}

@end
