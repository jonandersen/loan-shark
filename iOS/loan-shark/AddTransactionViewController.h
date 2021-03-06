//
//  AddTransactionViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"
#import "FriendPickerViewController.h"

@class AddTransactionViewController;

@protocol AddTransactionViewControllerDelegate <NSObject>
- (void)addTransactionViewControllerDidCancel:(AddTransactionViewController *)controller;
- (void)addTransactionViewController:(AddTransactionViewController *)controller didAddTransaction:(Transaction *)transaction;
@end

@interface AddTransactionViewController : UITableViewController <FriendPickerViewControllerDelegate>

@property (nonatomic, weak) id <AddTransactionViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UITableViewCell *friendsField;
@property (nonatomic, strong) NSMutableArray *friends;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Transaction *transaction;
@property (strong, nonatomic) IBOutlet UIButton *createButton;

- (IBAction)cancel:(id)sender;
- (IBAction)create:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)done:(id)sender;

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField;
-(IBAction)textFieldDidEndEditing:(UITextField *)textField;

@end



