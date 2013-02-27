//
//  GossipQueenMapViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "GossipQueenHistoryViewController.h" //for the delegate pattern (passing data back from history)
#import "Message.h"

@interface GossipQueenMapViewController : UIViewController <MKMapViewDelegate, ViewControllerDelegate> {
    
    CLLocationManager *locationManager;
    double latitude;
    double longitude;
    
    Message *currentMessage; //This stores the current message being displayed by the map
    
    
    //THIS IS GOING TO BE REPLACED
    NSMutableArray *lineArray;
}


@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
