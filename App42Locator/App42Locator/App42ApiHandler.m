//
//  App42ApiHandler.m
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 02/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ApiHandler.h"
#import "App42Constants.h"


static App42ApiHandler *_instance = nil;

@implementation App42ApiHandler

+(App42ApiHandler *)sharedInstance
{
    if (!_instance)
    {
        _instance = [[App42ApiHandler alloc] init];
    }
    return _instance;
}


-(id)init
{
    self = [super init];
    if (self)
    {
        _instance = self;
        @try
        {
            [App42API initializeWithAPIKey:API_KEY andSecretKey:SECRET_KEY];
            [App42API enableCrashEventHandler:YES];
            [App42API enableApp42Trace:YES];
        }
        @catch (App42Exception *exception)
        {
            NSLog(@"exception=%@",exception.reason);
        }
        @finally
        {
            
        }
        
    }
    return _instance;
}

-(NSArray*)getNearByMarkers:(NSDictionary*)geoDict
{
    NSArray *markersArray = nil;
    @try
    {
        GeoService *geoService = [App42API buildGeoService];
        Geo *geo = [geoService getNearByPoint:STORAGE_NAME latitude:[[geoDict objectForKey:LATITUDE] doubleValue] longitude:[[geoDict objectForKey:LONGITUDE] doubleValue] resultLimit:2];
        //NSLog(@"markersArray = %@",geo.pointList);
        markersArray = geo.pointList;
        
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"exception=%@",exception.reason);
    }
    @finally
    {
        
    }
    return markersArray;

}

-(NSArray*)getAllMarkers
{
    NSArray *markersArray = nil;
    @try
    {
        GeoService *geoService = [App42API buildGeoService];
        Geo *geo = [geoService getAllPoints:STORAGE_NAME];
        //NSLog(@"markersArray = %@",geo.pointList);
        markersArray = geo.pointList;
        
    }
    @catch (App42Exception *exception)
    {
        NSLog(@"exception=%@",exception.reason);
    }
    @finally
    {
        
    }
    return markersArray;
}

@end
