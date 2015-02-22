//
//  ParseStarterProjectViewController.h
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParseStarterProjectViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString *friendUsername;

@property (nonatomic, strong) IBOutlet UIButton *notificationButton;
@property (nonatomic, strong) IBOutlet UITextField *textField;

@end
