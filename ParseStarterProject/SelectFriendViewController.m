//
//  SelectFriendViewController.m
//  Happy4Life
//
//  Created by Mark Hudnall on 2/21/15.
//
//

#import "SelectFriendViewController.h"
#import "CreateInspirationViewController.h"

@interface SelectFriendViewController ()

@end

@implementation SelectFriendViewController
@synthesize collectionView;
@synthesize friends;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Friends";
    self.navigationItem.hidesBackButton = YES;
    
    self.friends = [[NSUserDefaults standardUserDefaults] arrayForKey:@"friends"];
    
    UINib *cellNib = [UINib nibWithNibName:@"FriendView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    self.collectionView.delegate = self;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(175, 175)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(5, 20, 5, 20)];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.friends count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *friendName = [self.friends objectAtIndex:indexPath.row];

    static NSString *cellIdentifier = @"cvCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    
    [titleLabel setText:friendName];
    NSString *imageName = [friendName lowercaseString];
    imageView.image = [UIImage imageNamed:imageName];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [cell addGestureRecognizer:tapGestureRecognizer];
    
    return cell;
    
}

- (void) handleTapFrom: (UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [sender locationInView:collectionView];
        NSIndexPath *indexPath = [collectionView indexPathForItemAtPoint:point];
        if (indexPath)
        {
            NSString *username = [self.friends objectAtIndex:indexPath.row];
            CreateInspirationViewController *sendInspirationViewController = [[CreateInspirationViewController alloc] init];
            sendInspirationViewController.friendUsername = username;
            [self.navigationController pushViewController:sendInspirationViewController animated:YES];
        }
        else
        {
            
        }
    }
}

// I implemented didSelectItemAtIndexPath:, but you could use willSelectItemAtIndexPath: depending on what you intend to do. See the docs of these two methods for the differences.
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // If you need to use the touched cell, you can retrieve it like so
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    NSString *friend = [self.friends objectAtIndex:indexPath.row];
    
    CreateInspirationViewController *sendInspirationViewController = [[CreateInspirationViewController alloc] init];
    sendInspirationViewController.friendUsername = friend;
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
