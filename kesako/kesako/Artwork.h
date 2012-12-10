//
//  Artwork.h
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artwork : NSObject  {
    NSString * qrcode;
    NSString * name;
    NSString * brief;
}

- (id) init;

- (NSString *) qrcode;
- (NSString *) name;
- (NSString *) brief;

- (void) setQrCode:(NSString*) qr;

- (void) setName:(NSString*) n;

- (void) setBrief:(NSString*) b;

@end
