//
//  App42APIHandler.m
//  App42MusicPlayer
//
//  Created by Rajeev Ranjan on 07/02/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42APIHandler.h"
#import "App42PersistencyManager.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

@interface App42APIHandler ()
{
    App42PersistencyManager *persistencyManager;
    BOOL isOnline;
}
@end

@implementation App42APIHandler

+ (App42APIHandler*)sharedInstance
{
    static App42APIHandler *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[App42APIHandler alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        persistencyManager = [[App42PersistencyManager alloc] init];
        isOnline = NO;
    }
    return self;
}

- (NSArray*)getAlbums
{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(App42Album*)album atIndex:(int)index
{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}
@end
