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

@interface GossipQueenMapViewController : UIViewController <MKMapViewDelegate> {
    
    CLLocationManager *locationManager;
    float lat1;
    float lat2;
    float long1;
    float long2;
}



@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
