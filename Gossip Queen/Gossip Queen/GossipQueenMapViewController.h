//
//  GossipQueenMapViewController.h
//  Gossip Queen
//
//  Created by Noah Harris on 2/15/13.
//  Copyright (c) 2013 Noah Harris. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface GossipQueenMapViewController : UIViewController <MKMapViewDelegate> 

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
