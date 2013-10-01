//
//  PhotoSet.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Media.h"

@class Photo;

@interface PhotoSet : Media

@property (nonatomic, retain) NSSet *have_photo;
@end

@interface PhotoSet (CoreDataGeneratedAccessors)

- (void)addHave_photoObject:(Photo *)value;
- (void)removeHave_photoObject:(Photo *)value;
- (void)addHave_photo:(NSSet *)values;
- (void)removeHave_photo:(NSSet *)values;

@end
