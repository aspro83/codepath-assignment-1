//
//  TemperatureViewController.m
//  Temp Converter
//
//  Created by Danielle Robinson on 8/10/13.
//  Copyright (c) 2013 Danielle Robinson. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController () <UITextFieldDelegate>

@end

@implementation TemperatureViewController

#pragma mark - View Lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.celciusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;

    [self.fahrenheitTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateTemperature:(id)sender
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setRoundingMode: NSNumberFormatterRoundDown];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    
    if ([self.fahrenheitTextField.text length] != 0)
    {
        float temperature = [self.fahrenheitTextField.text floatValue];
        temperature = (temperature -  32) * 5/9;
        self.celciusTextField.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:temperature]];
    }
    else if ([self.celciusTextField.text length] != 0)
    {
        float temperature = [self.celciusTextField.text floatValue];
        temperature = temperature * 9/5 + 32;
        self.fahrenheitTextField.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:temperature]];
    }
}

#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *allowedCharacters = [NSCharacterSet characterSetWithCharactersInString:@".-0123456789"];
    if([string rangeOfCharacterFromSet:allowedCharacters.invertedSet].location != NSNotFound)
    {
        return false;
    }
    
    if(textField == self.fahrenheitTextField)
    {
        self.celciusTextField.text = @"";
    }
    else
    {
        self.fahrenheitTextField.text = @"";
    }
    return true;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
