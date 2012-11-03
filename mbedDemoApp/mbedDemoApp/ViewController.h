//
//  ViewController.h
//  mbedDemoApp
//
//  Created by David Switzer on 11/1/12.
//  Copyright (c) 2012 David Switzer -- ARM DevCon 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, strong) IBOutlet UITextField *textField;
@property(nonatomic, strong) IBOutlet UIButton *sendButton;

- (IBAction)onSendButton:(id)sender;

- (BOOL)textFieldShouldReturn:(UITextField *)field;

@end
