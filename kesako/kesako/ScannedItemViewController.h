//
//  BIDLastCheckedViewController.h
//  kesako
//
//  Created by Laïla Atrmouh on 02/10/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationHelper.h"

@interface ScannedItemViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *bar;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UITextView *brief;

- (IBAction)switchViews:(id)sender;

@end
