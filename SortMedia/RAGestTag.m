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
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    if( [openPanel runModal] == NSFileHandlingPanelOKButton )
    {
        NSURL *url = [openPanel URL];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        Tag *selectedTag = [self getCurrentTag];
        if (selectedTag) {
            selectedTag.image = data;
        }
    }
}
@end
