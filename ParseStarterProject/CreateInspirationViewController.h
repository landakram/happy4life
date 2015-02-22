//
//  ParseStarterProjectViewController.h
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+FlatUI.h"
#import "FUIButton.h"

@interface CreateInspirationViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) NSString *friendUsername;

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet FUIButton *notificationButton;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UITextView *textField;

@end
