//
//  TransactionsViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "TransactionsViewController.h"
#import "TransactionCell.h"
#import <QuartzCore/QuartzCore.h>

@interface TransactionsViewController ()

@end

@implementation TransactionsViewController

@synthesize transactions;
@synthesize tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CALayer* shadowLayer = [self createShadowWithFrame:CGRectMake(0, 0, 320, 5)];
    
    [self.view.layer addSublayer:shadowLayer];
    
    self.transactions = [NSMutableArray arrayWithArray:[Transaction findAll]];
    
    CALayer * shadow = [self createShadowWithFrame:CGRectMake(0, 0, 320, 5)];
    [self.tableView.layer addSublayer:shadow];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
 
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CALayer *)createShadowWithFrame:(CGRect)frame
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    
    
    UIColor* lightColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    UIColor* darkColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    gradient.colors = [NSArray arrayWithObjects:(id)darkColor.CGColor, (id)lightColor.CGColor, nil];
    
    return gradient;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 67;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.transactions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TransactionCell *cell = (TransactionCell *)[self.tableView dequeueReusableCellWithIdentifier:@"transaction"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	Transaction *transaction = [self.transactions objectAtIndex:indexPath.row];
	cell.titleLabel.text = transaction.name;
	cell.textLabel.text = [NSString stringWithFormat:@"%@", transaction.amount];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddTransaction"] || [segue.identifier isEqualToString:@"EditTransaction"])
	{
        UINavigationController *navigationController = [segue destinationViewController];
        AddTransactionViewController *controller = [[navigationController viewControllers] objectAtIndex:0];
        controller.delegate = self;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Transaction *transaction = nil;
        if(path){
            transaction = [self.transactions objectAtIndex:path.row];
        }
        controller.transaction = transaction;
	}
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)addTransactionViewControllerDidCancel:(AddTransactionViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addTransactionViewController:(AddTransactionViewController *)controller didAddTransaction:(Transaction *)transaction{
    if(transaction){
        [self.transactions addObject:transaction];
        NSIndexPath *indexPath =  [NSIndexPath indexPathForRow:[self.transactions count] - 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:  [NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
