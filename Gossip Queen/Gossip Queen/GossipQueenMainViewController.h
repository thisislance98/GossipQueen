//
//  GossipQueenMainViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface GossipQueenMainViewController : UIViewController {
    CLLocationManager *locationManager;
    float latitude;
    float longitude;
}

@property (weak, nonatomic) IBOutlet UITextView *sendField;
@property (weak, nonatomic) IBOutlet UITextView *receiveField;

- (IBAction)sendMessage:(id)sender;
- (IBAction)insertLink:(id)sender;
- (IBAction)like:(id)sender;
- (IBAction)dislike:(id)sender;
- (IBAction)save:(id)sender;


@end
