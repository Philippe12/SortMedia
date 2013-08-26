//
//  RAListeNationnalite.m
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAListNationnalite.h"

@interface RAListNationnalite ()

@end

@implementation RAListNationnalite

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (RAListNationnalite *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc
{
	self = [super initWithWindowNibName:@"RAListNationnalite"];
    
	[self setManagedObjectContext:inMoc];
	[self setManagedObjectModel:inMom];
	[self setPersistentStoreCoordinator:inPsc];
    
	return self;
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

@end
