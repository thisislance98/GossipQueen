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
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    [self updateReceiveField];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateReceiveField
{
    
    //LONG RUNNING PARSE OPERATION BEING RUN ON A MAIN THREAD BUT IT DISPLAYS!!!! THIS NEEDS TO CHANGE
    
    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    
    currentParseMessage = [query getFirstObject];
    
    
    //this version is much better and i will use it when I understand blocks better
    /*[query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            currentParseMessage = object;
            NSLog(@"Successfully retrieved the object.");
        }
    }];*/
    
    self.receiveField.text = [currentParseMessage objectForKey:@"text"];
    
}




#pragma mark - Button methods

- (IBAction)sendMessage:(id)sender { 
    NSLog(@"sendMessage");
    
    NSString *text = self.sendField.text;
    self.sendField.text = @"";
    
    PFObject *message = [PFObject objectWithClassName:@"Message"];  //Using class name "Message"
    
    [message setObject:text forKey:@"text"];
    [message setObject:[NSNumber numberWithDouble:latitude] forKey:@"lastLat"];
    [message setObject:[NSNumber numberWithDouble:longitude] forKey:@"lastLong"];

    [message setObject:[NSNumber numberWithInt:0] forKey:@"likes"]; //number of times the message has been liked
    
    
    
    [message saveInBackground];
    
    [self.sendField resignFirstResponder]; //release the keyboard
    
    
}

- (IBAction)insertLink:(id)sender {
    NSLog(@"insertLink");
}

- (IBAction)like:(id)sender {
    
    [currentParseMessage incrementKey:@"like"];
    [currentParseMessage saveInBackground];
    
    [self updateReceiveField]; //THIS NEEDS TO CYCLE THROUGH MESSAGES, WHICH IT DOES NOT CURRENTLY DO
    
    NSLog(@"like");
}

- (IBAction)dislike:(id)sender {
    NSLog(@"dislike");
}

- (IBAction)save:(id)sender {
    NSLog(@"save");
}

#pragma mark - location manager delegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
}



@end
