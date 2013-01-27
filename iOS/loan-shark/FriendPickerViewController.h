//
//  FriendsTransactionViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/11/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendPickerViewController;

@protocol FriendPickerViewControllerDelegate <NSObject>
- (void) friendPickerViewController:(FriendPickerViewController *)controller didSelectFriends:(NSMutableArray *)selectedFriends;
@end

@interface FriendPickerViewController : UITableViewController
@property (nonatomic, weak) id <FriendPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *friends;
@end


