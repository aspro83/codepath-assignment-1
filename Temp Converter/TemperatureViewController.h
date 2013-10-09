//
//  TemperatureViewController.h
//  Temp Converter
//
//  Created by Danielle Robinson on 8/10/13.
//  Copyright (c) 2013 Danielle Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, weak) IBOutlet UITextField *celciusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;

@end
