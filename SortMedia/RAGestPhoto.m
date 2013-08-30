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

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAGestPhoto"];
        
	return self;
}

- (IBAction)AddActeur:(id)sender {
    WndListActeur = [[RAListActeur alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndListActeur setPhotoItem:[self getCurrent:_PhotoArray]];
    [WndListActeur runAsPanel:[self window]];
}

- (IBAction)RemoveActeur:(id)sender {
    Photo *ptrPhoto = [self getCurrent:_PhotoArray];
    Acteur *ptrActeur = [self getCurrent:_ActeurArray];
    if( (ptrPhoto != nil) && (ptrActeur != nil)) {
        [ptrPhoto removeHave_acteurObject:ptrActeur];
    }
}

- (IBAction)RemoveTag:(id)sender {
    Photo *ptrPhoto = [self getCurrent:_PhotoArray];
    Tag *ptrTag = [self getCurrent:_TagArray];
    if( (ptrPhoto != nil) && (ptrTag != nil)) {
        [ptrPhoto removeHave_tagObject:ptrTag];
    }
}

- (IBAction)AddTag:(id)sender {
    WndListTag = [[RAListTag alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndListTag setPhotoItem:[self getCurrent:_PhotoArray]];
    [WndListTag runAsPanel:[self window]];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)OpenPicture:(id)sender {
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    if( [openPanel runModal] == NSFileHandlingPanelOKButton )
    {
        NSURL *url = [openPanel URL];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        Photo *selectedPhoto = [self getCurrent:_PhotoArray];
        if (selectedPhoto) {
            selectedPhoto.photo = data;
            selectedPhoto.file_name = [[url path] lastPathComponent];
        }
    }
}


@end
