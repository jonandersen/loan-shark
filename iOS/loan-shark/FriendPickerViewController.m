//
//  FriendsTransactionViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/11/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "FriendPickerViewController.h"
#import "User.h"

@interface FriendPickerViewController ()

@end

@implementation FriendPickerViewController
{
    NSMutableArray *boolFriends;
}

@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    boolFriends = [NSMutableArray arrayWithCapacity:[self.friends count]];
    for (int i = 0; i < [self.friends count]; i++){
        [boolFriends addObject:[NSNumber numberWithBool:NO]];
    }   
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        
        NSMutableArray *selectedFriends = [NSMutableArray arrayWithCapacity:[self.friends count]];
        for (int i = 0; i < [boolFriends count]; i++) {
            if ([boolFriends[i] boolValue]) {
                [selectedFriends addObject:self.friends[i]];
            }
        }
        
        
        [self.delegate friendPickerViewController:self didSelectFriends:selectedFriends];
    }
    [super viewWillDisappear:animated];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    User *user = [self.friends objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",user.firstname, user.lastname];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [boolFriends replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [boolFriends replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
    }	
}

@end
