//
//  GossipQueenDetailViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/22/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Message.h"

@interface GossipQueenDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *mainField;
@property (weak, nonatomic) Message *message;

@end
