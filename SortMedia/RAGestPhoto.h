//
//  RAGestPhoto.h
//  SortMedia
//
//  Created by Philippe Fouquet on 28/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAListActeur.h"
#import "RAListTag.h"

@interface RAGestPhoto : NSWindowController <NSWindowDelegate> {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
    RAListActeur *WndListActeur;
    RAListTag *WndListTag;
}
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;


- (RAGestPhoto *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc;
- (IBAction)AddActeur:(id)sender;
- (IBAction)RemoveActeur:(id)sender;
- (IBAction)RemoveTag:(id)sender;
- (IBAction)AddTag:(id)sender;

@property (strong) IBOutlet NSArrayController *PhotoArray;
@property (strong) IBOutlet NSArrayController *ActeurArray;
@property (strong) IBOutlet NSArrayController *TagArray;

- (IBAction)OpenPicture:(id)sender;

@end
