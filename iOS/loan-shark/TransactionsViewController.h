//
//  TransactionsViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"
#import "AddTransactionViewController.h"

@interface TransactionsViewController : UITableViewController <AddTransactionViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *transactions;

@end
