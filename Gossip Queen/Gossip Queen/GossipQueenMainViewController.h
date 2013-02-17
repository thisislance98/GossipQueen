//
//  GossipQueenMainViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GossipQueenMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *sendField;
@property (weak, nonatomic) IBOutlet UITextView *receiveField;

- (IBAction)sendMessage:(id)sender;
- (IBAction)insertLink:(id)sender;
- (IBAction)like:(id)sender;
- (IBAction)dislike:(id)sender;


@end
