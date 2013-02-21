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
    
    
    CLLocationDegrees lat1 = 34.0522;
    CLLocationDegrees long1 = -118.2428;
    
    CLLocationDegrees lat2 = 40.7142;
    CLLocationDegrees long2 = -74.0064;

    
    
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(lat1, long1);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(lat2, long2);
    
    MKMapPoint point1 = MKMapPointForCoordinate(coord1);
    MKMapPoint point2 = MKMapPointForCoordinate(coord2);
    
    MKMapPoint northEastPoint = point2;
    MKMapPoint southWestPoint = point1;
    
    MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * 2);
    
    pointArr[0] = point1;
    pointArr[1] = point2;
    
    line = [MKPolyline polylineWithPoints:pointArr count:2];
    
    free(pointArr); //free the array
    
    [self.mapView addOverlay:line];
    [self.mapView setCenterCoordinate:coord1];
    
    NSLog(@"%f",self.mapView.region.span.latitudeDelta);
    NSLog(@"%f",self.mapView.region.span.longitudeDelta);
    
    
     
     
    
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event //this is buggy, but its sort of how to do it
{
    /*
    if (self.mapView.region.span.longitudeDelta < 4) {
        [self.mapView removeOverlay:line];
    }
     */
}


#pragma mark - MapView delegate

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id )overlay
{
    MKOverlayView* overlayView = nil;
    
    if(overlay == line)
    {
        //if we have not yet created an overlay view for this overlay, create it now.
        if(nil == routeLineView)
        {
            routeLineView = [[MKPolylineView alloc] initWithPolyline:line];
            routeLineView.fillColor = [UIColor redColor];
            routeLineView.strokeColor = [UIColor redColor];
            routeLineView.lineWidth = 3;
        }
        
        overlayView = routeLineView;
        
    }
    
    return overlayView;
    
}


#pragma mark - location manager delegate


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
    NSLog(@"Latitude delta: %f",self.mapView.region.span.latitudeDelta);
    NSLog(@"Longitude delta %f",self.mapView.region.span.longitudeDelta);

   
}



@end
