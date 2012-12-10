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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:@"kikoo"];
    
    item.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];

    [bar pushNavigationItem:item animated:NO]; 
}

- (void)viewDidUnload
{
    [self setBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)switchViews:(id)sender {
    NSLog(@"Done < switch from LastItemViewed");
    [self.view removeFromSuperview];
}

@end
