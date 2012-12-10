//
//  Artwork.h
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artwork : NSObject {
	NSString *qrcode;
	NSString *name;
	NSString *brief; 
}

@property (nonatomic, retain) NSString *qrcode;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *brief; 

@end
