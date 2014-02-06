//
//  App42Album.h
//  App42MusicPlayer
//
//  Created by Rajeev Ranjan on 06/02/14.
//  Copyright (c) 2014 ShepHertz Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App42Album : NSObject

@property(nonatomic,copy,readonly) NSString *title, *artist, *genre, *coverUrl, *year;

- (id)initWithTitle:(NSString*)title artist:(NSString*)artist coverUrl:(NSString*)coverUrl year:(NSString*)year;
@end
