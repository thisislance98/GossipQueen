//
//  GossipQueenHistoryViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/16/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface GossipQueenHistoryViewController : UITableViewController {
    Message *sampleMessage;
    NSMutableArray *messageArray;
}

@end

