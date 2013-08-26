//
//  RAListTag.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAGestTag.h"
#import "Photo.h"

@interface RAListTag : NSWindowController  <NSWindowDelegate> {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
    NSDictionary *plistNationnalityContent;
    RAGestTag *WndActeur;
    Photo *_SelectedItem;
}
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;
- (void)setPhotoItem:(Photo *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

- (RAListTag *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc : (Photo*)item;

@property (strong) IBOutlet NSArrayController *TagArrayController;
- (IBAction)GestionDesTags:(id)sender;
- (IBAction)AddTag:(id)sender;



@end
