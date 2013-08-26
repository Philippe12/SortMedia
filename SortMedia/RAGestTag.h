//
//  RAGestTag.h
//  SortMedia
//
//  Created by Philippe Fouquet on 13/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RAGestTag : NSWindowController <NSWindowDelegate> {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
}
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

- (RAGestTag *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc;


@property (strong) IBOutlet NSArrayController *TagArrayController;

- (IBAction)OpenPicture:(id)sender;
@end
