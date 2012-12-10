//
//  XMLToObjectParser.h
//  kesako
//
//  Created by Laïla Atrmouh on 10/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//
 
#import <Foundation/Foundation.h>

@interface XMLToObjectParser : NSObject <NSXMLParserDelegate> {
	NSString *className;
	NSMutableArray *items;
	NSObject *item; // stands for any class
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
}
- (NSArray *)items;
- (id)parseXMLAtURL:(NSURL *)url
		   toObject:(NSString *)aClassName
		 parseError:(NSError **)error;
@end