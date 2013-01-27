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

@interface FriendsViewController ()

@end

@implementation FriendsViewController
{
	NSMutableArray *friends;
    NSMutableArray *boolFriends;
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
    return [friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriendCell *cell = (FriendCell *)[self.tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	NSString *friend = [friends objectAtIndex:indexPath.row];
	cell.titleLabel.text = friend;
    return cell;
}


@end
