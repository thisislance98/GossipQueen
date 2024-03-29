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
    
    lineArray = [[NSMutableArray alloc] init];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"chosenString"]; //TESTING
    
    //##########################################################################################
    //######################################################################################################
    
    currentMessage = [[Message alloc] init];
    
    MKPolyline *temp = [self drawLineWithCoordinatesLat1:34.0523 long1:-118.2428 lat2:40.7142 long2:-74.0064];
    [currentMessage.lineArray addObject:temp];      //NOT WORKING!!!!!!!!!
    //[self.mapView addOverlay:temp];
    

}

-(void)viewDidAppear:(BOOL)animated
{
    
        [mapView removeOverlays: mapView.overlays];
        
        int yup = [[NSUserDefaults standardUserDefaults] boolForKey:@"chosenString"];
        NSLog(@"jkfldsa   jf-----%i", yup);
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"chosenString"] == 1)
        {
            [self drawLineWithCoordinatesLat1:34.0523 long1:-118.2428 lat2:40.7142 long2:-74.0064];
            [self drawLineWithCoordinatesLat1:-33.8683 long1:151.2086 lat2:40.7142 long2:-74.0064];
            [self drawLineWithCoordinatesLat1:-33.8683 long1:151.2086 lat2:34.0522 long2:-118.2428];
        }
    
    
     
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event //this is buggy, but it's one way to detect zoom level
{
    /*
    if (self.mapView.region.span.longitudeDelta < 4) {
        [self.mapView removeOverlay:line];
    }
     */
}


//this is for navigation logic in the history view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender //THIS ASSUMES WE ARE ONLY DOING ONE SEGUE
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"getMessage"];
    GossipQueenHistoryViewController *controller = segue.destinationViewController;
    controller.delegate = self; //assign self as delegate
    
}



#pragma mark - Drawing

-(MKPolyline *) drawLineWithCoordinatesLat1:(double)lat1 long1:(double)long1 lat2:(double)lat2 long2:(double)long2
{
    /*
    CLLocationDegrees lat1 = 34.0522;
    CLLocationDegrees long1 = -118.2428;
    
    CLLocationDegrees lat2 = 40.7142;
    CLLocationDegrees long2 = -74.0064;
    */
    
        
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(lat1, long1);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(lat2, long2);
    
    MKMapPoint point1 = MKMapPointForCoordinate(coord1);
    MKMapPoint point2 = MKMapPointForCoordinate(coord2);
    
    
    MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * 2);
    
    pointArr[0] = point1;
    pointArr[1] = point2;
    
    MKPolyline *line = [MKPolyline polylineWithPoints:pointArr count:2];
    
    free(pointArr); //free the array

    //################################################# THESE WILL BE REMOVED ONCE THE MESSAGE CLASS WORKS
    [lineArray addObject:line]; // lineArray is going to be replaced by the Message object's array
    
    [self.mapView addOverlay:line];
    [self.mapView setCenterCoordinate:coord1];
    //#################################################
    
    return line;
    
    
}

#pragma mark - view controller delegate


- (void)addItemViewController:(GossipQueenHistoryViewController *)controller didFinishEnteringItem:(Message *)item
{
    NSLog(item.text);
}


#pragma mark - mapView delegate

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id )overlay //this is called on the delegate after addOverlay is called
{
    
    MKOverlayView* overlayView = nil;
    MKPolylineView* lineView;
    
    for (id element in lineArray) {  //CHANGS THIS TO currentMessage.lineArray WHEN I FIGURE OUT WHAT'S WRONG
        
        if (overlay == element) {
            
            if(nil == lineView)
            {
                lineView = [[MKPolylineView alloc] initWithPolyline:element];
                lineView.fillColor = [UIColor redColor];
                lineView.strokeColor = [UIColor redColor];
                lineView.lineWidth = 3;
            }
            
            overlayView = lineView;
            
            
            return overlayView;
            

        }
    }
    
    return nil;
     
    
    
}


#pragma mark - location manager delegate


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    latitude = newLocation.coordinate.latitude;
    longitude = newLocation.coordinate.longitude;
    //NSLog(@"Latitude delta: %f",self.mapView.region.span.latitudeDelta);
    //NSLog(@"Longitude delta %f",self.mapView.region.span.longitudeDelta);

   
}



@end
