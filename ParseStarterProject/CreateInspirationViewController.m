//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "CreateInspirationViewController.h"

#import <Parse/Parse.h>

@implementation CreateInspirationViewController
@synthesize notificationButton;
@synthesize textField;
@synthesize friendUsername;
@synthesize imageView;
@synthesize descriptionLabel;

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"Inspire %@", self.friendUsername];
    
    [notificationButton addTarget:self action:@selector(notificationButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    NSString *buttonTitle = [NSString stringWithFormat:@"Inspire %@", self.friendUsername];
    [notificationButton setTitle:buttonTitle forState:UIControlStateNormal];
    
    NSString *description = [NSString stringWithFormat:@"Say something inspirational to %@:", self.friendUsername];
    descriptionLabel.text = description;
    
    self.textField.delegate = self;
    
    notificationButton.buttonColor = [UIColor turquoiseColor];
    notificationButton.shadowColor = [UIColor greenSeaColor];
    notificationButton.shadowHeight = 3.0f;
    notificationButton.cornerRadius = 6.0f;
    [notificationButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [notificationButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    [imageView setImage:[UIImage imageNamed:[self.friendUsername lowercaseString]]];
    
    textField.layer.cornerRadius = 5;
    textField.layer.masksToBounds = YES;
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

- (void)textViewDidEndEditing:(UITextView *)textView {
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
