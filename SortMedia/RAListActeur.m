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

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAListActeur"];
        
	return self;
}

- (void)setPhotoItem:(Photo *)value
{
	// keep only weak ref
	_SelectedItem = value;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)GestionDesActeur:(id)sender {
    WndActeur = [[RAGestActeur alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndActeur runAsPanel:[self window]];
}

- (IBAction)AddActeur:(id)sender {
    [_SelectedItem addHave_acteurObject:[self getCurrent:_ActeurArrayController]];
    [self Quite:sender];
}
@end
