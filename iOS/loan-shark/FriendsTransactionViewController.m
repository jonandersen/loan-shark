//
//  FriendsTransactionViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/11/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "FriendsTransactionViewController.h"

@interface FriendsTransactionViewController ()

@end

@implementation FriendsTransactionViewController
{
	NSMutableArray *friends;
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
    friends = [NSMutableArray arrayWithCapacity:4];
    boolFriends = [NSMutableArray arrayWithCapacity:[friends count]];
    [friends addObject:@"Simon Ekvy"];    
    [friends addObject:@"Johan Anderholm"];
    [friends addObject:@"Tony Meiner"];
    [friends addObject:@"Marcus Carlberg"];
    
    [boolFriends addObject:[NSNumber numberWithBool:NO]];
    [boolFriends addObject:[NSNumber numberWithBool:NO]];
    [boolFriends addObject:[NSNumber numberWithBool:NO]];
    [boolFriends addObject:[NSNumber numberWithBool:NO]];
    
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	friends = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        
        NSMutableArray *selectedFriends = [NSMutableArray arrayWithCapacity:[friends count]];
        for (int i = 0; i < [boolFriends count]; i++) {
            if ([boolFriends[i] boolValue]) {
                [selectedFriends addObject:friends[i]];
            }
        }
        
        
        [self.delegate friendsTransactionViewController:self didSelectFriends:selectedFriends];
    }
    [super viewWillDisappear:animated];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
	cell.textLabel.text = [friends objectAtIndex:indexPath.row];
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [boolFriends replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [boolFriends replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
    }
	//[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

@end
