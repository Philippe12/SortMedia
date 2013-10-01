//
//  Ethnie.h
//  SortMedia
//
//  Created by Philippe Fouquet on 01/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Acteur;

@interface Ethnie : NSManagedObject

@property (nonatomic, retain) NSNumber * indexe;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSSet *for_acteur;
@end

@interface Ethnie (CoreDataGeneratedAccessors)

- (void)addFor_acteurObject:(Acteur *)value;
- (void)removeFor_acteurObject:(Acteur *)value;
- (void)addFor_acteur:(NSSet *)values;
- (void)removeFor_acteur:(NSSet *)values;

@end
