//
//  App42ViewController.m
//  App42Locator
//
//  Created by Rajeev Ranjan on 07/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ViewController.h"
#import "myAnnotation.h"
#import "CalloutView.h"


#define METERS_PER_MILE 1609.344

@interface App42ViewController ()

@end

@implementation App42ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    updatemap = YES;
    
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    
    [locationManager startUpdatingLocation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -MapView Delegate Methods
//6
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    NSLog(@"%s",__FUNCTION__);
    //7
    static NSString *identifier = @"myAnnotation";
    MKAnnotationView * annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //10
        annotationView.image = [UIImage imageNamed:@"pin.png"];
    }else {
        annotationView.annotation = annotation;
    }
    return annotationView;
}

//11
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"%s",__FUNCTION__);
    
    if(![view.annotation isKindOfClass:[MKUserLocation class]]) {
        CalloutView *calloutView = (CalloutView *)[[[NSBundle mainBundle] loadNibNamed:@"calloutView" owner:self options:nil] objectAtIndex:0];
        CGRect calloutViewFrame = calloutView.frame;
        calloutViewFrame.origin = CGPointMake(-calloutViewFrame.size.width/2 + 15, -calloutViewFrame.size.height);
        calloutView.frame = calloutViewFrame;
        [calloutView.calloutLabel setText:[(myAnnotation*)[view annotation] title]];
        [view addSubview:calloutView];
    }
    
}

//12
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%s",__FUNCTION__);
    
    for (UIView *subview in view.subviews ){
        [subview removeFromSuperview];
    }
}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"newLocation=%f, %f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    int distanceThreshold = 2.0; // in meters
    if ([newLocation distanceFromLocation:oldLocation] < distanceThreshold)
    {
        
    }
    else
    {
        //updatemap = YES;
    }
    if (updatemap)
    {
        updatemap = NO;
        
        //1
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = newLocation.coordinate.latitude;
        zoomLocation.longitude= newLocation.coordinate.longitude;
        // 2
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.2*METERS_PER_MILE, 0.2*METERS_PER_MILE);
        [self.mapView setRegion:viewRegion animated:YES];
        
        CLLocationCoordinate2D coordinate1;
        coordinate1.latitude = newLocation.coordinate.latitude;
        coordinate1.longitude = newLocation.coordinate.longitude;
        myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"ShepHertz"];
        [self.mapView addAnnotation:annotation];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
}

@end
