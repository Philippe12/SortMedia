//
//  RAListActeur.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAGestActeur.h"
#import "Photo.h"

@interface RAListActeur : NSWindowController  <NSWindowDelegate> {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
    NSDictionary *plistNationnalityContent;
    RAGestActeur *WndActeur;
    Photo *_SelectedItem;
}
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;
- (void)setPhotoItem:(Photo *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

- (RAListActeur *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc : (Photo*)item;

@property (strong) IBOutlet NSArrayController *ActeurArrayController;
- (IBAction)GestionDesActeur:(id)sender;
- (IBAction)AddActeur:(id)sender;


@end
