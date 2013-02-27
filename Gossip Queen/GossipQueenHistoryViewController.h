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


//using the delegation pattern to pass data back to the map
//##########################################
@class GossipQueenHistoryViewController;

@protocol ViewControllerDelegate <NSObject>
- (void)addItemViewController:(GossipQueenHistoryViewController *)controller didFinishEnteringItem:(Message *)item;

@end
//##########################################


@interface GossipQueenHistoryViewController : UITableViewController {
    Message *sampleMessage;
    
    Message *sendingMessage; //this is used to send the proper message to the detail view
}

@property (nonatomic, copy) NSMutableArray *messageArray;

@property (nonatomic, weak) id <ViewControllerDelegate> delegate; //create a delgate property

@end

