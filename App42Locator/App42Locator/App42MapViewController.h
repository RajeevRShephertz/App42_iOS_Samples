//
//  App42MapViewController.h
//  App42Locator
//
//  Created by Rajeev Ranjan on 08/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CLLocationManager.h>
#import "App42Constants.h"
@class App42MapViewController;

@protocol App42MapViewControllerDelegate <NSObject>
- (void)app42MapViewControllerDidCancel:(App42MapViewController *)controller;
- (void)app42MapViewControllerDidSave:(App42MapViewController *)controller;
@end


@interface App42MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    BOOL updatemap;
}

@property (nonatomic) MapRequestType requestType;
@property (strong, nonatomic) NSString *titleString;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) id <App42MapViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *markersArray;

-(IBAction)cancelButtonAction:(id)sender;

@end
