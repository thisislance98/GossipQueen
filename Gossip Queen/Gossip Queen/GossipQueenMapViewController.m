//
//  GossipQueenMapViewController.m
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import "GossipQueenMapViewController.h"

@interface GossipQueenMapViewController ()

@end

@implementation GossipQueenMapViewController

@synthesize mapView;  //this is assigned a value in the storyboard using an outlet, this is made a delegate through an outlet in the storyboard as well.


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Map");
    
    CLLocation *location = mapView.userLocation.location;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    lat2 = 40.7142;
    long2 = 74.0064;
    
    lat1 =48.1364;
    long1 =122.5825;
    
    /*
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(lat1, long1);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(lat2, long2);
    
    MKMapPoint point1 = MKMapPointForCoordinate(coord1);
    MKMapPoint point2 = MKMapPointForCoordinate(coord2);
    
    MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * 2);
     
     IM GOING TO READ THE C BOOK AND COME BACK TO THIS
     */
    
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - location manager delegate

/*
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    lat1 = newLocation.coordinate.latitude;     //assign these for use by the send function
    long1 = newLocation.coordinate.longitude;
}
 */


@end
