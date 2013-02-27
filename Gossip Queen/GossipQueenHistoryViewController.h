//
//  GossipQueenHistoryViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/16/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "GossipQueenDetailViewController.h" //need to import this to pass the detail view it's message

@interface GossipQueenHistoryViewController : UITableViewController {
    Message *sampleMessage;
    
    Message *sendingMessage; //this is used to send the proper message to the detail view
}

@property (nonatomic, copy) NSMutableArray *messageArray;

@end

