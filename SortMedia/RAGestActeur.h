//
//  RAGestActeur.h
//  SortMedia
//
//  Created by Philippe Fouquet on 17/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAListNationnalite.h"
#import "RAEditImage.h"

@interface RAGestActeur : NSWindowController  <NSWindowDelegate> {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
    NSDictionary *plistNationnalityContent;    
    RAListNationnalite *WndListNationnalite;
    RAEditImage *WndEditImage;
}
- (void)useImage:(NSData*) data;
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

- (RAGestActeur *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc;

@property (strong) IBOutlet NSArrayController *ActeurArrayController;
@property (strong) IBOutlet NSArray *DictNationality;
@property (strong) IBOutlet NSApplication *Application;

- (IBAction)openimage:(id)sender;
- (IBAction)GestNationnalite:(id)sender;
- (IBAction)Quite:(id)sender;

- (int)runAsPanel: (id)mainWindow;

@end
