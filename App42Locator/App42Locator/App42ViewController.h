//
//  App42ViewController.h
//  App42Locator
//
//  Created by Rajeev Ranjan on 07/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App42MapViewController.h"

@interface App42ViewController : UIViewController<App42MapViewControllerDelegate>
{
    
}

@property (strong, nonatomic) NSArray *markersArray;


-(IBAction)getNearBy:(id)sender;
-(IBAction)getAllStores:(id)sender;
@end
