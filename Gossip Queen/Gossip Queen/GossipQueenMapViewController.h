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

@interface GossipQueenMapViewController : UIViewController <MKMapViewDelegate> {
    
    CLLocationManager *locationManager;
    double latitude;
    double longitude;
  
    MKPolyline *line;
    MKPolylineView *routeLineView;
}



@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
