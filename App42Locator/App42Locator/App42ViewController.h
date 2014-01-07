//
//  App42ViewController.h
//  App42Locator
//
//  Created by Rajeev Ranjan on 07/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CLLocationManager.h>

@interface App42ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    BOOL updatemap;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
