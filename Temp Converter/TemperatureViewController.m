//
//  TemperatureViewController.m
//  Temp Converter
//
//  Created by Danielle Robinson on 8/10/13.
//  Copyright (c) 2013 Danielle Robinson. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

- (void)updateTemperature;
//what is this?
//why does the controller have to be a textfield delegate
//how to I streamline editing a textbox and getting the other one to clear
//how do I make the button green and rectangular? is it an ios 7/xcode 5 thing?
//whats with the strong/weak things?



@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.convertButton addTarget:self action:@selector(updateTemperature) forControlEvents:UIControlEventTouchDown];
    self.celciusAmount.delegate = self;
    self.fahrenheitAmount.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender;
{
    [sender becomeFirstResponder];
    [sender resignFirstResponder];
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.tag == 0) {
        self.celciusAmount.text = @"";
    } else {
        self.fahrenheitAmount.text = @"";
    }
}

- (void)updateTemperature {
    if ([self.fahrenheitAmount.text length] != 0) {
        int temperature = [self.fahrenheitAmount.text intValue];
        temperature = (temperature -  32) * 5/9;
        self.celciusAmount.text = [NSString stringWithFormat:@"%i", temperature];
    } else if ([self.celciusAmount.text length] != 0) {
        int temperature = [self.celciusAmount.text intValue];
        temperature = temperature * 9/5 + 32;
        self.fahrenheitAmount.text = [NSString stringWithFormat:@"%i", temperature];
    }
}


@end
