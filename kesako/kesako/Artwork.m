//
//  Artwork.m
//  kesako
//
//  Created by Laïla Atrmouh on 09/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "Artwork.h"

@implementation Artwork

// Constructor for an artwork
- (id) init {
    self->qrcode = [[NSString alloc] init];
    self->brief = [[NSString alloc] init];
    self->name = [[NSString alloc] init];
    return self;
}


- (NSString *) qrcode {
    return self->qrcode;
}
- (NSString *) name {
    return self->name;
}

- (NSString *) brief {
    return self->brief;
}

- (void) setQrCode:(NSString*) qr {
    qrcode = qr; 
}

- (void) setName:(NSString*) n {
    name = n;
}

- (void) setBrief:(NSString*) b {
    brief = b;
}


@end
