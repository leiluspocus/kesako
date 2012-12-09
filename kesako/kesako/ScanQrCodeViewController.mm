//
//  BIDShotQrCodeViewController.m
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "ScanQrCodeViewController.h"
#import <ZXingWidgetController.h>
#import <QRCodeReader.h>

@implementation ScanQrCodeViewController
@synthesize resultsView;
@synthesize resultsToDisplay;
#pragma mark -
#pragma mark View lifecycle

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
    [self setTitle:@"ZXing"];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)scanPressed:(id)sender {
	
    ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
    QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
    NSSet *readers = [[NSSet alloc ] initWithObjects:qrcodeReader,nil];
    qrcodeReader = nil;
    widController.readers = readers;
    readers = nil;
    NSBundle *mainBundle = [NSBundle mainBundle];
    widController.soundToPlay =
    [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
    [self presentModalViewController:widController animated:YES];
    widController = nil;
}

#pragma mark -
#pragma mark ZXingDelegateMethods

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
    self.resultsToDisplay = result;
    if (self.isViewLoaded) {
        [resultsView setText:resultsToDisplay];
        [resultsView setNeedsDisplay];
    }
    [self dismissModalViewControllerAnimated:NO];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    self.resultsView = nil;
}

- (void)dealloc { 
    resultsView = nil;
    resultsToDisplay = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
