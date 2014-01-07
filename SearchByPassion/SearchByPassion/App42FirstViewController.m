//
//  App42FirstViewController.m
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 31/12/13.
//  Copyright (c) 2013 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42FirstViewController.h"

@interface App42FirstViewController ()

@end

@implementation App42FirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)showLoginView
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [sb instantiateViewControllerWithIdentifier:@"LoginViewNavigator"];
    UIViewController *vc = [nc.viewControllers objectAtIndex:0];
    [self presentViewController:vc animated:YES completion:NULL];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
