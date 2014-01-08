//
//  App42ViewController.m
//  App42Locator
//
//  Created by Rajeev Ranjan on 07/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ViewController.h"
#import "App42MapViewController.h"
#import "App42ApiHandler.h"
#import "App42Constants.h"

@interface App42ViewController ()

@end

@implementation App42ViewController
@synthesize markersArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)getNearBy:(id)sender
{
    
}

-(IBAction)getAllStores:(id)sender
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NearBy"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        App42MapViewController *childViewController = [navigationController viewControllers][0];
        childViewController.delegate = self;
        childViewController.titleString = @"Near By";
        childViewController.requestType = kNearBy;
    }
    else if ([segue.identifier isEqualToString:@"GetAll"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        App42MapViewController *childViewController = [navigationController viewControllers][0];
        childViewController.delegate = self;
        childViewController.titleString = @"All Stores";
        childViewController.requestType = kGetAllMarkers;
    }
}


- (void)app42MapViewControllerDidCancel:(App42MapViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)app42MapViewControllerDidSave:(App42MapViewController *)controller
{
    
}

@end
