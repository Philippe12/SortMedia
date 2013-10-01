//
//  Tag.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Media;

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSNumber * indexe;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *for_media;
@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addFor_mediaObject:(Media *)value;
- (void)removeFor_mediaObject:(Media *)value;
- (void)addFor_media:(NSSet *)values;
- (void)removeFor_media:(NSSet *)values;

@end
