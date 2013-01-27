//
//  FriendsViewController.m
//  loan-shark
//
//  Created by Jon Andersen on 1/13/13.
//  Copyright (c) 2013 Crowdme. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendCell.h"
#import <QuartzCore/QuartzCore.h>
#import "User.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController
{
	NSMutableArray *friends;
}


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
    //friends =
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickFriends"])
	{
		FriendPickerViewController *friendPickerVC = segue.destinationViewController;
		friendPickerVC.delegate = self;
        friendPickerVC.friends = [NSMutableArray arrayWithArray:[User findAll]];
	}
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
    return [friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriendCell *cell = (FriendCell *)[self.tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	User *friend = [friends objectAtIndex:indexPath.row];
	cell.titleLabel.text = [NSString stringWithFormat:@"%@ %@", friend.firstname, friend.lastname];
    return cell;
}

- (void)friendPickerViewController:(FriendPickerViewController *)controller didSelectFriends:(NSMutableArray *)selectedFriends
{
	//self.friends = selectedFriends;
	//self.friendsField.detailTextLabel.text =  [NSString stringWithFormat:@"%d",[self.friends count]];
	[self.navigationController popViewControllerAnimated:YES];
}


@end
