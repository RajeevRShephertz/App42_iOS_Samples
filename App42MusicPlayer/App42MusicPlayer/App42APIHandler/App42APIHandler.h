//
//  App42APIHandler.h
//  App42MusicPlayer
//
//  Created by Rajeev Ranjan on 07/02/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App42Album.h"

@interface App42APIHandler : NSObject

+ (App42APIHandler*)sharedInstance;

- (NSArray*)getAlbums;
- (void)addAlbum:(App42Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

@end
