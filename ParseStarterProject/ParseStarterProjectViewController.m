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
    
    [notificationButton addTarget:self action:@selector(notificationButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    NSString *buttonTitle = [NSString stringWithFormat:@"Inspire %@", self.friendUsername];
    [notificationButton setTitle:buttonTitle forState:UIControlStateNormal];
    
    [textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)notificationButtonPressed:(id)sender {
    [sender setEnabled:NO];
    
    NSString *textFromTextField = textField.text;
    
    PFPush *push = [[PFPush alloc] init];
    [push setChannel:self.friendUsername];
    
    NSString *me = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *message = [NSString stringWithFormat:@"%@: %@", me, message];
    
    [push setMessage:message];
    [push sendPushInBackground];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
