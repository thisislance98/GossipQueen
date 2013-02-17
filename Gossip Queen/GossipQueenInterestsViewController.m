//
//  GossipQueenInterestsViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/16/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenInterestsViewController.h"

@interface GossipQueenInterestsViewController ()

@end

@implementation GossipQueenInterestsViewController

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
    
    NSLog(@"Interests page load...");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view delegate

//#######################################
//Here is the selection logic
//###########################################
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  //this makes the row only blink blue when selected
}










@end
