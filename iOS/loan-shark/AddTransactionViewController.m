//
//  AddTransactionViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/10/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "AddTransactionViewController.h"

@interface AddTransactionViewController ()

@end

@implementation AddTransactionViewController

@synthesize delegate;
@synthesize nameTextField;
@synthesize amountField;
@synthesize doneButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setAmountField:nil];
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0){
		[self.nameTextField becomeFirstResponder];
    }else if(indexPath.row == 1){
        [self.amountField becomeFirstResponder];
    }
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)done:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.amountField resignFirstResponder];
    [self.doneButton setEnabled:NO];
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField {
    [self.doneButton setEnabled:YES];
}

-(IBAction)textFieldDidEndEditing:(UITextField *)textField {
    [self.doneButton setEnabled:NO];
}


#pragma mark - Table view delegate
- (IBAction)cancel:(id)sender
{
	[self.delegate addTransactionViewControllerDidCancel:self];
}
- (IBAction)create:(id)sender
{
    Transaction *transaction = [[Transaction alloc] init];
	transaction.name = self.nameTextField.text;
	transaction.amount = [self.amountField.text intValue];
	[self.delegate addTransactionViewController:self didAddTransaction:transaction];
}


@end
