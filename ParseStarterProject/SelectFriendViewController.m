//
//  SelectFriendViewController.m
//  Happy4Life
//
//  Created by Mark Hudnall on 2/21/15.
//
//

#import "SelectFriendViewController.h"
#import "ParseStarterProjectViewController.h"

@interface SelectFriendViewController ()

@end

@implementation SelectFriendViewController
@synthesize firstFriendButton;
@synthesize secondFriendButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *friends = [[NSUserDefaults standardUserDefaults] arrayForKey:@"friends"];
    NSString *firstFriend = [friends objectAtIndex:0];
    NSString *secondFriend = [friends objectAtIndex:1];
    
    [firstFriendButton setTitle:firstFriend forState:UIControlStateNormal];
    [secondFriendButton setTitle:secondFriend forState:UIControlStateNormal];
    
    [firstFriendButton addTarget:self action:@selector(friendButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [secondFriendButton addTarget:self action:@selector(friendButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)friendButtonPressed:(UIButton *)button {
    ParseStarterProjectViewController *sendInspirationViewController = [[ParseStarterProjectViewController alloc] init];
    sendInspirationViewController.friendUsername = button.titleLabel.text;
    [self.navigationController pushViewController:sendInspirationViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
