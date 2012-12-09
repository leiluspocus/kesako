//
//  BIDShotQrCodeViewController.h
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"

@interface ScanQrCodeViewController : UIViewController <ZXingDelegate> {
    IBOutlet UITextView *resultsView;
    NSString *resultsToDisplay;
}
@property (nonatomic, retain) IBOutlet UITextView *resultsView;
@property (nonatomic, copy) NSString *resultsToDisplay;


- (IBAction)scanPressed:(id)sender;

@end
