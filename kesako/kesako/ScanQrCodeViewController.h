//
//  BIDShotQrCodeViewController.h
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZXingWidgetController.h>
#import <QRCodeReader.h>

@interface ScanQrCodeViewController : UIViewController <ZXingDelegate>

@property (nonatomic, strong) IBOutlet UITextView *resultsView;
@property (nonatomic, strong) NSString *resultsToDisplay;

- (IBAction)scanPressed:(id)sender;

- (IBAction)switchViews:(id)sender;
@end
