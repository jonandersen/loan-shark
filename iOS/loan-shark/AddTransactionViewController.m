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
@synthesize friendsField;
@synthesize friends;
@synthesize tableView;
@synthesize transaction;
@synthesize createButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.friends = [NSMutableArray arrayWithCapacity:20];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[tableView setSeparatorColor:[UIColor clearColor]];
    self.friendsField.detailTextLabel.text =  [NSString stringWithFormat:@"%d",[self.friends count]];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    if(self.transaction){
        self.nameTextField.text = self.transaction.name;
        self.amountField.text = [NSString stringWithFormat:@"%@",self.transaction.amount];
        [self.createButton setTitle:@"Save" forState:UIControlStateNormal];
    }  
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setAmountField:nil];
    self.transaction = nil;
	[super viewDidUnload];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickFriends"])
	{
		FriendPickerViewController *friendsTransactionVC = segue.destinationViewController;
		friendsTransactionVC.delegate = self;
	}
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1){
        cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        cell.backgroundColor = [UIColor clearColor];
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
    if(self.transaction){
        self.transaction.name = self.nameTextField.text;
        self.transaction.amount = [NSDecimalNumber decimalNumberWithString:self.amountField.text];
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
        [self.delegate addTransactionViewController:self didAddTransaction:nil];
    }else{
        self.transaction = [Transaction createEntity];
        self.transaction.name = self.nameTextField.text;
        self.transaction.amount = [NSDecimalNumber decimalNumberWithString:self.amountField.text];
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
        [self.delegate addTransactionViewController:self didAddTransaction:transaction];
    }
}

- (void)friendPickerViewController:(FriendPickerViewController *)controller didSelectFriends:(NSMutableArray *)selectedFriends
{
	self.friends = selectedFriends;
	self.friendsField.detailTextLabel.text =  [NSString stringWithFormat:@"%d",[self.friends count]];
	[self.navigationController popViewControllerAnimated:YES];
}


@end
