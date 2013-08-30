//
//  RAGestTag.m
//  SortMedia
//
//  Created by Philippe Fouquet on 13/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAGestTag.h"
#import "Tag.h"

@interface RAGestTag ()

@end

@implementation RAGestTag

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (RAGestTag *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc
{
	self = [super initWithWindowNibName:@"RAGestTag"];
    
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

-(Tag*)getCurrentTag {
    if ([[self.TagArrayController selectedObjects] count] > 0) {
        return [[self.TagArrayController selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
}

- (IBAction)OpenPicture:(id)sender {
    WndEditImage = [[RAEditImage alloc] init:self ];
    if( [WndEditImage runAsPanel: [self window]] == 1 )
    {
        [self useImage:[WndEditImage GetImage]];
    }
}

- (IBAction)Quite:(id)sender {
    [NSApp stopModalWithCode:[sender tag]];
}

- (void)useImage:(NSData*) data {
    Tag *selectedTag = [self getCurrentTag];
    if (selectedTag) {
        selectedTag.image = data;
    }
}

- (int)runAsPanel: (id)mainWindow {
    [NSApp beginSheet:self.window
       modalForWindow:(NSWindow *)mainWindow
        modalDelegate:self.window
       didEndSelector:nil
          contextInfo:nil];
    
    NSInteger retvalue = [NSApp runModalForWindow:self.window];
    
    [NSApp endSheet:self.window];
    [self.window orderOut:self];
    
    return (int)retvalue;
}

@end
