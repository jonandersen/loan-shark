//
//  AddTransactionViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@class AddTransactionViewController;

@protocol AddTransactionViewControllerDelegate <NSObject>
- (void)addTransactionViewControllerDidCancel:(AddTransactionViewController *)controller;
- (void)addTransactionViewController:(AddTransactionViewController *)controller didAddTransaction:(Transaction *)transaction;
@end


@interface AddTransactionViewController : UITableViewController

@property (nonatomic, weak) id <AddTransactionViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;


@end



