//
//  RAGestPhoto.m
//  SortMedia
//
//  Created by Philippe Fouquet on 28/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAGestPhoto.h"
#import "Photo.h"

@interface RAGestPhoto ()

@end

@implementation RAGestPhoto

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (RAGestPhoto *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc
{
	self = [super initWithWindowNibName:@"RAGestPhoto"];
    
	[self setManagedObjectContext:inMoc];
	[self setManagedObjectModel:inMom];
	[self setPersistentStoreCoordinator:inPsc];
    
	return self;
}

- (IBAction)AddActeur:(id)sender {
    WndListActeur = [[RAListActeur alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]:[self getCurrentPhoto]];
    [WndListActeur showWindow:sender];
}

- (IBAction)RemoveActeur:(id)sender {
    Photo *ptrPhoto = [self getCurrentPhoto];
    Acteur *ptrActeur = [self getCurrentActeur];
    if( (ptrPhoto != nil) && (ptrActeur != nil)) {
        [ptrPhoto removeHave_acteurObject:ptrActeur];
    }
}

- (IBAction)RemoveTag:(id)sender {
    Photo *ptrPhoto = [self getCurrentPhoto];
    Tag *ptrTag = [self getCurrentTag];
    if( (ptrPhoto != nil) && (ptrTag != nil)) {
        [ptrPhoto removeHave_tagObject:ptrTag];
    }
}

- (IBAction)AddTag:(id)sender {
    WndListTag = [[RAListTag alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]:[self getCurrentPhoto]];
    [WndListTag showWindow:sender];
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

-(Photo*)getCurrentPhoto {
    if ([[self.PhotoArray selectedObjects] count] > 0) {
        return [[self.PhotoArray selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
}

-(Acteur*)getCurrentActeur {
    if ([[self.ActeurArray selectedObjects] count] > 0) {
        return [[self.ActeurArray selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
}

-(Tag*)getCurrentTag {
    if ([[self.TagArray selectedObjects] count] > 0) {
        return [[self.TagArray selectedObjects] objectAtIndex:0];
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
        Photo *selectedPhoto = [self getCurrentPhoto];
        if (selectedPhoto) {
            selectedPhoto.photo = data;
            selectedPhoto.file_name = [[url path] lastPathComponent];
        }
    }
}

@end
