//
//  Acteur.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/09/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Media, Nationnalite;

@interface Acteur : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * cheveux;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSDecimalNumber * genre;
@property (nonatomic, retain) NSNumber * indexe;
@property (nonatomic, retain) NSDecimalNumber * mensuration_bonnet;
@property (nonatomic, retain) NSNumber * mensuration_buste;
@property (nonatomic, retain) NSNumber * mensuration_hanches;
@property (nonatomic, retain) NSNumber * mensuration_taille;
@property (nonatomic, retain) NSNumber * mensuration_taille_semi_basse;
@property (nonatomic, retain) NSDate * naisance;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSNumber * poids;
@property (nonatomic, retain) NSString * prenom;
@property (nonatomic, retain) NSNumber * taille;
@property (nonatomic, retain) NSDecimalNumber * yeux;
@property (nonatomic, retain) NSSet *for_media;
@property (nonatomic, retain) Nationnalite *have_nationnalite;
@end

@interface Acteur (CoreDataGeneratedAccessors)

- (void)addFor_mediaObject:(Media *)value;
- (void)removeFor_mediaObject:(Media *)value;
- (void)addFor_media:(NSSet *)values;
- (void)removeFor_media:(NSSet *)values;

@end
