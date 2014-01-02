//
//  App42ApiHandler.h
//  SearchByPassion
//
//  Created by Rajeev Ranjan on 02/01/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h"

@interface App42ApiHandler : NSObject

+(App42ApiHandler *)sharedInstance;

-(User *)loginUserWithName:(NSString*)userName password:(NSString*)password;
-(User *)registerUserWithName:(NSString*)userName email:(NSString*)email password:(NSString*)password;
@end
