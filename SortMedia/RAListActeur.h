//
//  RAListActeur.h
//  SortMedia
//
//  Created by Philippe Fouquet on 29/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAPanelController.h"
#import "RAGestActeur.h"
#import "Photo.h"

@interface RAListActeur : RAPanelController  <NSWindowDelegate> {
    NSDictionary *plistNationnalityContent;
    RAGestActeur *WndActeur;
    Photo *_SelectedItem;
}
- (void)setPhotoItem:(Photo *)value;

- (id)initLoc;

@property (strong) IBOutlet NSArrayController *ActeurArrayController;
- (IBAction)GestionDesActeur:(id)sender;
- (IBAction)AddActeur:(id)sender;


@end
