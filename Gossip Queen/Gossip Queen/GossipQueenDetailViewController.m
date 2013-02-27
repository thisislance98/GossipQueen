//
//  GossipQueenDetailViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/22/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenDetailViewController.h"


@interface GossipQueenDetailViewController ()

@end

@implementation GossipQueenDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainField.text = self.message.text; //this latter property is assigned in the history controller via segue
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
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}



@end
