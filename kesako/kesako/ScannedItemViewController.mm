//
//  BIDLastCheckedViewController.m
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "ScannedItemViewController.h"

@interface ScannedItemViewController ()

@end

@implementation ScannedItemViewController
@synthesize bar; 
@synthesize title;
@synthesize brief;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Artwork * res = [[ApplicationHelper sharedMySingleton] getCurrentArtwork];
    if ( res == nil ) {
        [brief setText:@"You scanned nothing so far! Press Back, then Scan and go have some fun with the scan tool!"];
        [title setText:@"Hmm..."];
    }
    else {
        NSLog([res brief]);
        [brief setText:[res brief]];
        [title setText:[res name]];
    }
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:[res name]];

    [bar pushNavigationItem:item animated:NO]; 
}

- (void)viewDidUnload
{
    [self setBar:nil];
    [self setTitle:nil];
    [self setBrief:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)switchViews:(id)sender {
    NSLog(@"Done < switch from LastItemViewed");
    [self.view removeFromSuperview];
}

@end
