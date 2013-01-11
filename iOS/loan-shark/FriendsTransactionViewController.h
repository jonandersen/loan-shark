//
//  FriendsTransactionViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/11/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendsTransactionViewController;

@protocol FriendsTransactionViewControllerDelegate <NSObject>
- (void)friendsTransactionViewController:(FriendsTransactionViewController *)controller didSelectFriends:(NSMutableArray *)selectedFriends;
@end

@interface FriendsTransactionViewController : UITableViewController
@property (nonatomic, weak) id <FriendsTransactionViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end


