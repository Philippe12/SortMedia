//
//  Nationnalite.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Acteur;

@interface Nationnalite : NSManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSData * drapau;
@property (nonatomic, retain) NSNumber * indexe;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSSet *for_acteur;
@end

@interface Nationnalite (CoreDataGeneratedAccessors)

- (void)addFor_acteurObject:(Acteur *)value;
- (void)removeFor_acteurObject:(Acteur *)value;
- (void)addFor_acteur:(NSSet *)values;
- (void)removeFor_acteur:(NSSet *)values;

@end
