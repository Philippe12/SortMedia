//
//  RAListActeur.m
//  SortMedia
//
//  Created by Philippe Fouquet on 29/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAListActeur.h"

@interface RAListActeur ()

@end

@implementation RAListActeur

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (RAListActeur *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc : (Photo *) item
{
	self = [super initWithWindowNibName:@"RAListActeur"];
    
	[self setManagedObjectContext:inMoc];
	[self setManagedObjectModel:inMom];
	[self setPersistentStoreCoordinator:inPsc];
    [self setPhotoItem:item];
    
	return self;
}

- (void)setPhotoItem:(Photo *)value
{
	// keep only weak ref
	_SelectedItem = value;
}

- (void)setManagedObjectModel:(NSManagedObjectModel *)value
{
	// keep only weak ref
	_mom = value;
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)value
{
	// keep only weak ref
	_moc = value;
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value
{
    _psc = value;
}

- (NSManagedObjectContext *)managedObjectContext
{
	return _moc;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return _mom;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return _psc;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)GestionDesActeur:(id)sender {
    WndActeur = [[RAGestActeur alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndActeur showWindow:sender];
}

-(Acteur*)getCurrentActeur {
    if ([[self.ActeurArrayController selectedObjects] count] > 0) {
        return [[self.ActeurArrayController selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
}

- (IBAction)AddActeur:(id)sender {
    [_SelectedItem addHave_acteurObject:[self getCurrentActeur]];
}
@end
