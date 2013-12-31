//
//  App42Service.h
//  PAE_iOS_SDK
//
//  Created by shephertz technologies on 20/06/13.
//  Copyright (c) 2013 ShephertzTechnology PVT LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App42Service : NSObject
{
    
    int pageOffset;
    int pageMaxRecords;
    
}

/*!
 *set the api key of application
 */
@property(nonatomic,retain) NSString *apiKey;

/*!
 *set the secret key of application
 */
@property(nonatomic,retain) NSString *secretKey;

/*!
 *set the version of application
 */
@property(nonatomic,retain) NSString *appVersion;

/*!
 *set the sessionId of application
 */
@property(nonatomic,retain) NSString *sessionId;

/*!
 *set the adminKey of application
 */
@property(nonatomic,retain) NSString *adminKey;

/*!
 *set the geoTag
 */
@property(nonatomic,retain) NSString *geoTag;

/*!
 *set the fbAccessToken
 */
@property(nonatomic,retain) NSString *fbAccessToken;

/*!
 *set the orderByDescending
 */
@property(nonatomic,retain) NSString *orderByDescending;

/*!
 *set the orderByAscending
 */
@property(nonatomic,retain) NSString *orderByAscending;

/*!
 * Sets the ACL list 
 */
@property(nonatomic,retain) NSMutableArray *aclList;

/*!
 * Sets the selectKeys
 */
@property(nonatomic,retain) NSMutableArray *selectKeys;

/*!
 * Sets the Other Meta Headers
 */
@property(nonatomic,retain) NSMutableDictionary *otherMetaHeaders;

/*!
 *set the pageOffset
 */
@property(nonatomic,assign) int pageOffset;
/*!
 *set the pageMaxRecords
 */
@property(nonatomic,assign) int pageMaxRecords;

/*!
 *set the event
 */
@property(nonatomic,retain) NSString *event;


-(NSMutableDictionary*) populateSignParams;
-(NSMutableDictionary*) populateMetaHeaderParams;
@end
