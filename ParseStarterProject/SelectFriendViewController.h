//
//  SelectFriendViewController.h
//  Happy4Life
//
//  Created by Mark Hudnall on 2/21/15.
//
//

#import <UIKit/UIKit.h>

@interface SelectFriendViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>


@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *friends;

@end
