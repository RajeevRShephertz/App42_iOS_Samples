//
//  App42PersistencyManager.m
//  App42MusicPlayer
//
//  Created by Rajeev Ranjan on 07/02/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import "App42PersistencyManager.h"

@interface App42PersistencyManager ()
{
    // an array of all albums
    NSMutableArray *albums;
}
@end

@implementation App42PersistencyManager

- (id)init
{
    self = [super init];
    if (self) {
    	// a dummy list of albums
        albums = [NSMutableArray arrayWithArray:
                  @[[[App42Album alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png" year:@"1992"],
                    [[App42Album alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png" year:@"2003"],
                    [[App42Album alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png" year:@"1999"],
                    [[App42Album alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png" year:@"2000"],
                    [[App42Album alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverUrl:@"http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png" year:@"2000"]]];
    }
    return self;
}

- (NSArray*)getAlbums
{
    return albums;
}

- (void)addAlbum:(App42Album*)album atIndex:(int)index
{
    if (albums.count >= index)
    	[albums insertObject:album atIndex:index];
    else
    	[albums addObject:album];
}

- (void)deleteAlbumAtIndex:(int)index
{
    [albums removeObjectAtIndex:index];
}

@end
