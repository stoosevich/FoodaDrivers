//
//  MapViewController.m
//  FoodaDrivers
//
//  Created by Steve Toosevich on 5/16/14.
//  Copyright (c) 2014 Steve Toosevich. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>
//@property NSArray *mapitems;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:self.mapView.centerCoordinate.latitude longitude:self.mapView.centerCoordinate.longitude];
    PFQuery *query = [PFUser query];
    
    //query parse database for user
    [query whereKey:@"location" nearGeoPoint:geoPoint withinMiles:2000.0f];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         NSLog(@"objects %@",objects);
         if(error)
         {
             NSLog(@"%@",error);
         }
         //add annotations for all users on parse
         for (id object in objects)
         {
             MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
             annotation.title = [object objectForKey:@"username"];
             PFGeoPoint *geoPoint= [object objectForKey:@"location"];
             annotation.coordinate = CLLocationCoordinate2DMake(geoPoint.latitude,geoPoint.longitude);
             [self.mapView addAnnotation:annotation];
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
