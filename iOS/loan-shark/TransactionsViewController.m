//
//  TransactionsViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "TransactionsViewController.h"

@interface TransactionsViewController ()

@end

@implementation TransactionsViewController

@synthesize transactions;

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
    self.transactions = [NSMutableArray arrayWithCapacity:20];
    Transaction *tr = [[Transaction alloc] init];
    tr.name = @"Lunch";
    tr.amount = 10;
    [self.transactions addObject:tr];
    
    tr = [[Transaction alloc] init];
    tr.name = @"Dinner";
    tr.amount = 200;
    [self.transactions addObject:tr];

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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transaction"];
	Transaction *transaction = [self.transactions objectAtIndex:indexPath.row];
	cell.textLabel.text = transaction.name;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", transaction.amount];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddTransaction"])
	{
        UINavigationController *navigationController = [segue destinationViewController];
        AddTransactionViewController *controller = [[navigationController viewControllers] objectAtIndex:0];
        controller.delegate = self;
	}
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)addTransactionViewControllerDidCancel:(AddTransactionViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addTransactionViewController:(AddTransactionViewController *)controller didAddTransaction:(Transaction *)transaction{
    [self.transactions addObject:transaction];
	NSIndexPath *indexPath =  [NSIndexPath indexPathForRow:[self.transactions count] - 1 inSection:0];
	[self.tableView insertRowsAtIndexPaths:  [NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
