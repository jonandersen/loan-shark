//
//  TransactionCell.h
//  loan-shark
//
//  Created by Jon Andersen on 1/13/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;

@property (nonatomic, strong) IBOutlet UILabel* textLabel;

@property (nonatomic, strong) IBOutlet UIImageView* disclosureImageView;

@property (nonatomic, strong) IBOutlet UIImageView* bgImageView;
@property (strong, nonatomic) IBOutlet UILabel *friendsLabel;

@end
