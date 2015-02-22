//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

@implementation ParseStarterProjectViewController
@synthesize notificationButton;
@synthesize textField;
@synthesize friendUsername;

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Inspire %@", self.friendUsername];
    [notificationButton addTarget:self action:@selector(notificationButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    NSString *buttonTitle = [NSString stringWithFormat:@"Inspire %@", self.friendUsername];
    [notificationButton setTitle:buttonTitle forState:UIControlStateNormal];
    
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [textField becomeFirstResponder];
}

- (void)notificationButtonPressed:(id)sender {
    [sender setEnabled:NO];
    
    [self sendPushNotification];
}

- (void)sendPushNotification {
    PFPush *push = [[PFPush alloc] init];
    [push setChannel:self.friendUsername];
    
    NSString *me = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *message = [NSString stringWithFormat:@"%@: %@", me, textField.text];
    
    [push setMessage:message];
    [push sendPushInBackground];
    
    [self.navigationController popViewControllerAnimated:YES];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sent!"
                                                        message:[NSString stringWithFormat:@"%@ just received your inspirational thought: %@", friendUsername, textField.text]
                                                       delegate:nil
                                              cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
    [alertView show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendPushNotification];
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
