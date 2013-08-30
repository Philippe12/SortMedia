//
//  RAListTag.m
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAListTag.h"

@interface RAListTag ()

@end

@implementation RAListTag

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAListTag"];
        
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

- (IBAction)GestionDesTags:(id)sender {
    WndTag = [[RAGestTag alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndTag showWindow:sender];
}

- (IBAction)AddTag:(id)sender {
    [_SelectedItem addHave_tagObject:[self getCurrent: _TagArrayController]];
    [self Quite:sender];
}
@end
