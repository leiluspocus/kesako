//
//  SettingsViewController.h
//  kesako
//
//  Created by Laïla Atrmouh on 05/12/12.
//  Copyright (c) 2012 URI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *pickerData;

@end
