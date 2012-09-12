//
//  HW_ViewController.m
//  HelloKoreaForSimulator
//
//  Created by Daniel Yang on 12/09/2012.
//  Copyright (c) 2012 HexWriter. All rights reserved.
//

#import "HW_ViewController.h"

@interface HW_ViewController ()

@end

@implementation HW_ViewController
@synthesize textField;
@synthesize label;
@synthesize button;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	textField.textAlignment	= UITextAlignmentCenter;
	textField.textColor		= [UIColor grayColor];
	textField.text			= @"Input some text here!";
	textField.returnKeyType	= UIReturnKeyDone;
	textField.delegate		= (id<UITextFieldDelegate>)self;
	
	label.text			= @"";
	label.textAlignment	= UITextAlignmentCenter;
	
	[button setTitle:@"CLICK" forState:UIControlStateNormal];
	button.titleLabel.textAlignment	= UITextAlignmentCenter;
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setLabel:nil];
    [self setButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	}
	else
	{
	    return YES;
	}
}


- (IBAction)fieldIsTouchedDown:(id)sender
{
	textField.textColor		= [UIColor blackColor];
	textField.text			= @"";
}

- (IBAction)buttonClicked:(id)sender
{
	if (textField.text.length > 0)
	{
		label.text		= textField.text;
		textField.text	= @"";
	}
	else
	{
		// Do nothing
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)a_textField
{
	if ([textField isEqual:a_textField])
	{
		[a_textField resignFirstResponder];
	}
	return YES;
}

@end
