//
//  App42ApiHandler.m
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 02/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42ApiHandler.h"

#define APP_KEY     @"d17353cb6957362f96682e879d00f885b2cc1058b701d270885d0574ff6ffdb4"
#define SECRET_KEY  @"4a7c95d14612a4913d9e9287c71fbc9541ef68b8a43c028a0666915706bf5fac"

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
            [App42API initializeWithAPIKey:APP_KEY andSecretKey:SECRET_KEY];
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



-(User *)loginUserWithName:(NSString*)userName password:(NSString*)password
{
    
    User *user = nil;
    @try
    {
        UserService *userService = [App42API buildUserService];
        user = [userService authenticateUser:userName password:password];
    }
    @catch (App42Exception *exception)
    {
        
    }
    @finally
    {
        
    }
    return user;
}
-(User *)registerUserWithName:(NSString*)userName email:(NSString*)email password:(NSString*)password
{
    User *user = nil;

    @try
    {
        UserService *userService = [App42API buildUserService];
        user = [userService createUser:userName password:password emailAddress:email];
    }
    @catch (NSException *exception)
    {
        user = nil;
    }
    @finally
    {
        
    }
    return user;
}

@end
