//
//  GossipQueenFriendDetailController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/22/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenFriendDetailController.h"

@interface GossipQueenFriendDetailController ()

@end

@implementation GossipQueenFriendDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this dismisses the view controller
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch");
    //[self.presentingViewController dismissModalViewControllerAnimated:YES];
}


@end
