//
//  GossipQueenMainViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenMainViewController.h"

@interface GossipQueenMainViewController ()


@end

@implementation GossipQueenMainViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Main");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender { //stubs are generated by connecting
    NSLog(@"sendMessage");
    self.sendField.text = @"Send";
    
    
    // Integrating Parse code into our app w00t!
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
}

- (IBAction)insertLink:(id)sender {
    NSLog(@"insertLink");
}

- (IBAction)like:(id)sender {
    NSLog(@"like");
}

- (IBAction)dislike:(id)sender {
    NSLog(@"dislike");
}

- (IBAction)save:(id)sender {
    NSLog(@"save");
}



@end
