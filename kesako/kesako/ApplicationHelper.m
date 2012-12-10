//
//  ApplicationHelper.m
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "ApplicationHelper.h"
#import "XMLToObjectParser.h"
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
        Artwork* art1 = [[Artwork alloc] init];
        
        
        NSURL *url = [NSURL URLWithString: @"http://www.latrmouh.org/base.xml"];
        XMLToObjectParser *myParser = [[XMLToObjectParser alloc]
                                       parseXMLAtURL:url toObject:@"Artwork" parseError:nil];
        NSLog(@"Hey! There are %d items in our base", [[myParser items] count]);
        for(int i = 0; i < [[myParser items] count]; i++) {
            NSLog(@"Artowrk: %@", [(Artwork *)[[myParser items] objectAtIndex:i] brief]);
        }
        
        
        [art1 setQrCode:@"monalisa"];
        [art1 setBrief:@"The painting, thought to be a portrait of Lisa Gherardini, the wife of Francesco del Giocondo, is in oil on a poplar panel, and is believed to have been painted between 1503 and 1506.[1] It was acquired by King Francis I of France and is now the property of the French Republic, on permanent display at the Musée du Louvre in Paris.[1] The ambiguity of the subject's expression, frequently described as enigmatic,[3] the monumentality of the composition, the subtle modeling of forms and the atmospheric illusionism were novel qualities that have contributed to the continuing fascination and study of the work"];
        [art1 setName:@"Mona Lisa"];
        
        
        Artwork* art2 = [[Artwork alloc] init];;
        [art2 setQrCode:@"scream"];
        [art2 setBrief:@"The Scream (Norwegian: Skrik) is the popular name given to each of four versions of a composition, created as both paintings and pastels, by the Expressionist artist Edvard Munch between 1893 and 1910. Der Schrei der Natur (The Scream of Nature) is the title Munch gave to these works, all of which show a figure with an agonized expression against a landscape with a tumultuous orange sky. The landscape in the background is the Oslofjord, viewed from Ekeberg, Oslo, Norway"];
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
