//
//  GossipQueenFriendsViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/16/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenFriendsViewController.h"

@interface GossipQueenFriendsViewController ()

@end

@implementation GossipQueenFriendsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}
 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendsCell"];
    
    
    UILabel *header = (UILabel *)[cell viewWithTag:1000];
    UILabel *date = (UILabel *)[cell viewWithTag:2000];
    
    if (indexPath.row == 0) {
        header.text = @"SMAPALE";
        date.text = @"12/12/12";
    } else if (indexPath.row == 1) {
        header.text = @"Another message";
        date.text = @"66/66/66";
    }
    
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    

    
    [self performSegueWithIdentifier:@"friendDetail" sender:self];
    
}
/*
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}
 */

@end
