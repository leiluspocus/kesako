//
//  BIDShotQrCodeViewController.m
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import "ScanQrCodeViewController.h" 

@implementation ScanQrCodeViewController
@synthesize resultsView;
@synthesize resultsToDisplay;
@synthesize itemView;

- (void)viewDidLoad
{ 
    [super viewDidLoad]; 
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

/**
 * Grabs the result of the Scan
 */
- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
    NSLog(@"kikoo result");
    NSLog(result);
    Artwork * res = [[ApplicationHelper sharedMySingleton] getArtworkFromQrCode:result];
    NSLog( [res qrcode]);
    itemView = [[ScannedItemViewController alloc] initWithNibName:@"ScannedItemViewController" bundle:nil];
    [self.view removeFromSuperview];
    [self.view addSubview: itemView.view];
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

- (IBAction)switchViews:(id)sender { 
    NSLog(@"Done < switch from ScanQrCode");
    [self.view removeFromSuperview];
}
 

@end
