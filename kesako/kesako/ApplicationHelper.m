//
//  ApplicationHelper.m
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "ApplicationHelper.h"

@implementation ApplicationHelper


static ApplicationHelper* _sharedMySingleton = nil;

+(ApplicationHelper*)sharedMySingleton
{
	@synchronized([ApplicationHelper class])
	{
		if (!_sharedMySingleton)
			_sharedMySingleton = [[self alloc] init];
		return _sharedMySingleton;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([ApplicationHelper class])
	{
		NSAssert(_sharedMySingleton == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedMySingleton = [super alloc];
		return _sharedMySingleton;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
        Artwork* art1 = [[Artwork alloc] init];;
        [art1 setQrCode:@"monalisa"];
        [art1 setBrief:@"Kikoo kikoo c moi monalisa lollololol"];
        [art1 setName:@"Mona Lisa"];
        
        
        Artwork* art2 = [[Artwork alloc] init];;
        [art2 setQrCode:@"scream"];
        [art2 setBrief:@"Kikoo scream"];
        [art2 setName:@"The Scream"];
        
        contentOfXmlFile[0] = art1;
        contentOfXmlFile[1] = art2; 
	}
    
	return self;
}


-(Artwork*) getArtworkFromQrCode: (NSString *) qr {
    NSLog(@"getartfromwork %d looking for ", sizeof(contentOfXmlFile));
    NSLog(qr);
    NSLog(@"*****");
    int i=0;
    for ( i=0; i < 2 ; ++i) {
        if ( [[ contentOfXmlFile[i] qrcode ] isEqualToString:qr ] == 1) {
            NSLog(@"Artwork found ----> %d", i);
            lastArtwork = i;
            return contentOfXmlFile[i];
        }
    }
    NSLog(@"Artwork not found!");
    lastArtwork = -1;
    return nil;
}


-(Artwork*) getCurrentArtwork {
    if ( lastArtwork >= 0 )
        return contentOfXmlFile[lastArtwork];
    return nil;
}

@end
