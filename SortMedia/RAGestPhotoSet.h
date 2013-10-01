//
//  RAGetPhotoSet.h
//  SortMedia
//
//  Created by Philippe Fouquet on 30/08/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "RAListActeur.h"
#import "RAListTag.h"
#import "PhotoSet.h"

@interface RAGestPhotoSet : RAPanelController <NSWindowDelegate> {
    RAListActeur *WndListActeur;
    RAListTag *WndListTag;
    RAEditImage *WndEditImage;
}


- (id) initLoc;
- (void)filePanelDidEnd:(NSOpenPanel*)sheet;

- (IBAction)AddActeur:(id)sender;
- (IBAction)RemoveActeur:(id)sender;
- (IBAction)RemoveTag:(id)sender;
- (IBAction)AddTag:(id)sender;
- (IBAction)OpenPicture:(id)sender;
- (IBAction)AddDir:(id)sender;

@property (strong) IBOutlet NSArrayController *PhotoSetArray;
@property (strong) IBOutlet NSArrayController *ActeurArray;
@property (strong) IBOutlet NSArrayController *TagArray;

@end
