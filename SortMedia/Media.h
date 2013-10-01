//
//  Media.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Acteur, Tag;

@interface Media : NSManagedObject

@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSString * file_name;
@property (nonatomic, retain) NSNumber * indexe;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSSet *have_acteur;
@property (nonatomic, retain) NSSet *have_tag;
@end

@interface Media (CoreDataGeneratedAccessors)

- (void)addHave_acteurObject:(Acteur *)value;
- (void)removeHave_acteurObject:(Acteur *)value;
- (void)addHave_acteur:(NSSet *)values;
- (void)removeHave_acteur:(NSSet *)values;

- (void)addHave_tagObject:(Tag *)value;
- (void)removeHave_tagObject:(Tag *)value;
- (void)addHave_tag:(NSSet *)values;
- (void)removeHave_tag:(NSSet *)values;

@end
