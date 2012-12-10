//
//  MainViewController.m
//  kesako
//
//  Created by Laïla Atrmouh on 07/11/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize qrCode;
@synthesize settingsView;
@synthesize itemView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    XMLHelper* n = [XMLHelper alloc];
   // [n loadDataFromXML];
    NSLog(@"Kikoo g appele");
    n = nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)scanPressed:(id)sender { 
    [self.view removeFromSuperview];
     qrCode = [[ScanQrCodeViewController alloc] initWithNibName:@"ScanQrCodeViewController" bundle:nil];
    [self.view addSubview:qrCode.view];
}

- (IBAction)lastViewedPressed:(id)sender {
    [self.view removeFromSuperview];
    itemView = [[ScannedItemViewController alloc] initWithNibName:@"ScannedItemViewController" bundle:nil];
    [self.view addSubview:itemView.view];
    
}

- (IBAction)settingsPressed:(id)sender {
    [self.view removeFromSuperview];
    settingsView = [[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:nil];
    [self.view addSubview:settingsView.view];
}
@end
