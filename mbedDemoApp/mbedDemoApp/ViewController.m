//
//  ViewController.m
//  mbedDemoApp
//
//  Created by David Switzer on 11/1/12.
//  Copyright (c) 2012 David Switzer -- ARM TechCon 2012. All rights reserved.
//

#import "ViewController.h"
#import <SRWebSocket.h>

@interface ViewController ()<SRWebSocketDelegate>

@property(strong, nonatomic) SRWebSocket *webSocket;

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;

@end

@implementation ViewController

@synthesize textField;
@synthesize sendButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://sockets.mbed.org:443/ws/demo/wo"]];
    [self.webSocket open];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.webSocket = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)textFieldShouldReturn:(UITextField *)field
{
    [field resignFirstResponder];
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [self.textField resignFirstResponder];
    
    [super touchesBegan:touches withEvent:event ];
    
}

- (IBAction)onSendButton:(id)sender
{
    NSLog(@"Sending message to mbed %@\n", self.textField.text);
    [self.webSocket send:self.textField.text];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"webSocket:didReceivemessage:\n");
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"webSocketDidOpen:\n");
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"webSocket:didFailWithError: %@\n", error);
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    NSLog(@"webSocket:didCloseWithCode:%d reason:%@ wasClean:%d\n", code, reason, wasClean);
}

@end
