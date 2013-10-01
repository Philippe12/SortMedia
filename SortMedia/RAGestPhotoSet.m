//
//  RAGetPhotoSet.m
//  SortMedia
//
//  Created by Philippe Fouquet on 30/08/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAGestPhotoSet.h"

@interface RAGestPhotoSet ()

@end

@implementation RAGestPhotoSet

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAGestPhotoSet"];
    
	return self;
}

- (IBAction)AddActeur:(id)sender {
    WndListActeur = [[RAListActeur alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndListActeur setPhotoItem:[self getCurrent:_PhotoSetArray]];
    [WndListActeur runAsPanel:[self window]];
}

- (IBAction)RemoveActeur:(id)sender {
    PhotoSet *ptrPhoto = [self getCurrent:_PhotoSetArray];
    Acteur *ptrActeur = [self getCurrent:_ActeurArray];
    if( (ptrPhoto != nil) && (ptrActeur != nil)) {
        [ptrPhoto removeHave_acteurObject:ptrActeur];
    }
}

- (IBAction)RemoveTag:(id)sender {
    PhotoSet *ptrPhoto = [self getCurrent:_PhotoSetArray];
    Tag *ptrTag = [self getCurrent:_TagArray];
    if( (ptrPhoto != nil) && (ptrTag != nil)) {
        [ptrPhoto removeHave_tagObject:ptrTag];
    }
}

- (IBAction)AddTag:(id)sender {
    WndListTag = [[RAListTag alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndListTag setPhotoItem:[self getCurrent:_PhotoSetArray]];
    [WndListTag runAsPanel:[self window]];
}

- (IBAction)OpenPicture:(id)sender {
    WndEditImage = [[RAEditImage alloc] init:self ];
    if( [WndEditImage runAsPanel: [self window]] == 1 )
    {
        [self useImage:[WndEditImage GetImage]];
    }
}

- (void)useImage:(NSData*) data {
    PhotoSet *selectedphotoset = [self getCurrent:_PhotoSetArray];
    if (selectedphotoset) {
        selectedphotoset.photo = data;
    }
}

- (IBAction)AddDir:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    [openDlg setFloatingPanel:YES];
    [openDlg setAllowsMultipleSelection:YES];
    
    // Display the dialog.  If the OK button was pressed,
    // process the files.
    [openDlg beginSheetForDirectory:@"~Movies/"
                                file:nil
                                types:nil
                                modalForWindow:self.window
                                modalDelegate:self
                     didEndSelector:@selector(filePanelDidEnd:
                                            returnCode:
                                            contextInfo:)
                      contextInfo:nil];
}

-(void)filePanelDidEnd:(NSOpenPanel*)sheet
            returnCode:(int)returnCode
           contextInfo:(void*)contextInfo {
    // Do stuff here as soon as the sheet displays properly
    if( returnCode == NSOKButton) {
        NSArray *files = [sheet URLs];
        PhotoSet *selectedPhotoSet = [self getCurrent:_PhotoSetArray];
        for( int ij = 0; ij < files.count; ij++) {
            Photo *ps = (Photo*)[NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:[self managedObjectContext]];
            NSData *data = [[NSData alloc] initWithContentsOfURL:files[ij]];
            ps.photo = data;
            ps.file_name = [[files[ij] path] lastPathComponent];
            [selectedPhotoSet addHave_photoObject:ps];
        }
        
    }
}

@end
