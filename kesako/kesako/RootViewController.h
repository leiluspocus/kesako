//
//  MainViewController.h
//  kesako
//
//  Created by Laïla Atrmouh on 07/11/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <UIKit/UIKit.h> 
#include "ScannedItemViewController.h"
#include "SettingsViewController.h"
#include "ScanQrCodeViewController.h"
#include "XMLHelper.h" 

@interface RootViewController : UIViewController
 

@property(nonatomic, strong) ScanQrCodeViewController * qrCode;
@property(nonatomic, strong) ScannedItemViewController * itemView;
@property(nonatomic, strong) SettingsViewController * settingsView;

- (IBAction)scanPressed:(id)sender;

- (IBAction)lastViewedPressed:(id)sender;

- (IBAction)settingsPressed:(id)sender;

@end
