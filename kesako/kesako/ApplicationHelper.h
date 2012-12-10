//
//  ApplicationHelper.h
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artwork.h"

@interface ApplicationHelper : NSObject {
    Artwork* contentOfXmlFile[10];
    int lastArtwork;
}

 
+(ApplicationHelper*) sharedMySingleton;
-(Artwork*) getArtworkFromQrCode: (NSString *) qr ;
-(Artwork*) getCurrentArtwork;
@end
