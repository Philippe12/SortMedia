//
//  RAGestPhoto.h
//  SortMedia
//
//  Created by Philippe Fouquet on 28/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAPanelController.h"
#import "RAListActeur.h"
#import "RAListTag.h"

@interface RAGestPhoto : RAPanelController <NSWindowDelegate> {
    RAListActeur *WndListActeur;
    RAListTag *WndListTag;
}

- (id)initLoc;

- (IBAction)AddActeur:(id)sender;
- (IBAction)RemoveActeur:(id)sender;
- (IBAction)RemoveTag:(id)sender;
- (IBAction)AddTag:(id)sender;

@property (strong) IBOutlet NSArrayController *PhotoArray;
@property (strong) IBOutlet NSArrayController *ActeurArray;
@property (strong) IBOutlet NSArrayController *TagArray;

- (IBAction)OpenPicture:(id)sender;

@end
