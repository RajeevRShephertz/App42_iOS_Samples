//
//  PhotoService.h
//  App42_iOS_SERVICE_APIs
//
//  Created by shephertz technologies on 13/02/12.
//  Copyright (c) 2012 ShephertzTechnology PVT LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumResponseBuilder.h"
#import "App42Service.h"

@class Album;
@class App42Response;
/**
 * Adds Photo to the created Album on the Cloud All photos for a given Album can
 * be managed through this service. Photos can be uploaded to the cloud.
 * Uploaded photos are accessible through the generated URL. The service also
 * creates a thumbnail for the Photo which has been uploaded.
 *
 * @see Album
 * @see Photo
 */
@interface PhotoService : App42Service
{
    
        
}

-(id)init __attribute__((unavailable));
-(id)initWithAPIKey:(NSString *)apiKey  secretKey:(NSString *)secretKey;

/**
 * Adds Photo for a particular user and album. The Photo is uploaded on the
 * cloud
 *
 * @param userName
 *            - Name of the User whose photo has to be added
 * @param albumName
 *            - Name of the Album in which photo has to be added
 * @param photoName
 *            - Name of the Photo that has to be added
 * @param photoDescription
 *            - Description of the Photo that has to be added
 * @param path
 *            - Path from where Photo has to be picked for addition
 *
 * @return Album object containing the Photo which has been added
 *
 */
-(Album*)addPhoto:(NSString*)userName albumName:(NSString*)albumName photoName:(NSString*)photoName photoDescription:(NSString*)photoDescription path:(NSString*)path;
/**
 * Adds Photo for a particular user and album via Stream. The Photo is
 * uploaded on the cloud
 *
 * @param userName
 *            - Name of the User whose photo has to be added
 * @param albumName
 *            - Name of the Album in which photo has to be added
 * @param photoName
 *            - Name of the Photo that has to be added
 * @param photoDescription
 *            - Description of the Photo that has to be added
 * @param inputStream
 *            - Input Stream for the Photo that has to be added
 *
 * @return Album object containing the Photo which has been added
 *
 */
-(Album*)addPhoto:(NSString*)userName albumName:(NSString*)albumName photoName:(NSString*)photoName photoDescription:(NSString*)photoDescription fileData:(NSData*)fileData;
/**
 * Add tags to the Photos for the user in the album.
 *
 * @param userName
 *            - Name of the User whose name has to be tagged to photo
 * @param albumName
 *            - Album name whose photo is to be tagged
 * @param photoName
 *            - Photo name to be tagged
 * @param tagList
 *            - List of tages in Photo
 *
 * @return Album object containing the Photo which has been added
 *
 **/
-(Album*)addTagToPhoto:(NSString*)userName albumName:(NSString*)albumName photoName:(NSString*)photoName tagList:(NSArray*)tagList;
/**
 * Fetches all the Photos based on the userName
 *
 * @param userName
 *            - Name of the User whose photos have to be fetched
 *
 * @return List of Album object containing all the Photos for the given
 *         userName
 *
 */
-(NSArray*)getPhotos:(NSString*)userName;
/**
 * Fetches all the Photos based on the userName and tag
 *
 * @param userName
 *            - Name of the User whose photos have to be fetched
 * @param tag
 *            - tag on which basis photos have to be fetched
 *
 * @return List of Album object containing all the Photos for the given
 *         userName
 *
 */
-(NSArray*)getTaggedPhotos:(NSString*)userName tag:(NSString*)tag;

/**
 * Fetches the count of all Photos based on the userName and album name
 *
 * @param userName
 *            - Name of the User whose count of photos have to be fetched
 * @param albumName
 *            - Name of the Album from which count of photos have to be
 *            fetched
 *
 * @return App42Response object containing the count of all the Photos for
 *         the given userName and albumName
 *
 */
-(App42Response*)getPhotosCountByAlbumName:(NSString*)userName albumName:(NSString*)albumName;
/**
 * Fetches all Photos based on the userName and albumName
 *
 * @param userName
 *            - Name of the User whose photos have to be fetched
 * @param albumName
 *            - Name of the Album from which photos have to be fetched
 *
 * @return Album object containing all the Photos for the given userName and
 *         albumName
 *
 */
-(Album*)getPhotosByAlbumName:(NSString*)userName albumName:(NSString*)albumName;
/**
 * Fetches all Photos based on the userName and album name by paging.
 *
 * @param userName
 *            - Name of the User whose photos have to be fetched
 * @param albumName
 *            - Name of the Album from which photos have to be fetched
 * @param max
 *            - Maximum number of records to be fetched
 * @param offset
 *            - From where the records are to be fetched
 *
 * @return Album object containing all the Photos for the given userName and
 *         albumName
 *
 */
-(Album*)getPhotosByAlbumName:(int)max offset:(int)offset userName:(NSString*)userName albumName:(NSString*)albumName;
/**
 * Fetches the particular photo based on the userName, album name and photo
 * name
 *
 * @param userName
 *            - Name of the User whose photo has to be fetched
 * @param albumName
 *            - Name of the Album from which photo has to be fetched
 * @param photoName
 *            - Name of the Photo that has to be fetched
 *
 * @return Album object containing the Photo for the given userName,
 *         albumName and photoName
 *
 */
-(Album*)getPhotosByAlbumAndPhotoName:(NSString*)userName albumName:(NSString*)albumName photoName:(NSString*)photoName;
/**
 * Removes the particular Photo from the specified Album for a particular
 * user. Note: The Photo is removed from the cloud and wont be accessible in
 * future
 *
 * @param userName
 *            - Name of the User whose photo has to be removed
 * @param albumName
 *            - Name of the Album in which photo has to be removed
 * @param photoName
 *            - Name of the Photo that has to be removed
 *
 * @return App42Response if removed successfully
 *
 */
-(App42Response*)removePhoto:(NSString*)userName albumName:(NSString*)albumName photoName:(NSString*)photoName;

/**
 * Grant access to the particular Photo from the specified Album of a particular
 * user for the list of ACls. 
 *
 * @param userName
 *            - Name of the User who is giving access permission
 * @param albumName
 *            - Name of the Album in which photo has to be accessed
 * @param photoName
 *            - Name of the Photo for which access is requested
 * @param aclList
 *            - List of the Acl objects which holds the userNames and permission types
 *
 * @return Album object 
 *         
 */

-(Album*) grantAccessToPhoto:(NSString*)photoName
                     inAlbum:(NSString*)albumName
                      ofUser:(NSString*)userName
                 withAclList:(NSArray *)aclList;

/**
 * Revoke access to the particular Photo from the specified Album of a particular
 * user for the list of ACls.
 *
 * @param userName
 *            - Name of the User who is giving access permission
 * @param albumName
 *            - Name of the Album in which photo has to be accessed
 * @param photoName
 *            - Name of the Photo for which access is requested
 * @param aclList
 *            - List of the Acl objects which holds the userNames and permission types
 *
 * @return Album object
 *
 */
-(Album*) revokeAccessToPhoto:(NSString*)photoName
                      inAlbum:(NSString*)albumName
                       ofUser:(NSString*)userName
                  withAclList:(NSArray *)aclList;

@end
