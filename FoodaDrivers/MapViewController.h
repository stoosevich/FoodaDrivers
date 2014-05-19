//
//  MapViewController.h
//  FoodaDrivers
//
//  Created by Steve Toosevich on 5/16/14.
//  Copyright (c) 2014 Steve Toosevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface MapViewController : UIViewController

@property NSArray *usersArray;
//@property (nonatomic, strong) PFObject *detailItem;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;


@end
