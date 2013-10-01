//
//  Photo.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Media.h"

@class PhotoSet;

@interface Photo : Media

@property (nonatomic, retain) PhotoSet *have_photoset;

@end
