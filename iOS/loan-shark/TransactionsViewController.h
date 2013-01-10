//
//  TransactionsViewController.h
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@interface TransactionsViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *transactions;

@end
