//
//  RAGestActeur.h
//  SortMedia
//
//  Created by Philippe Fouquet on 17/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAListNationnalite.h"
#import "RAEditImage.h"
#import "RAPanelController.h"

@interface RAGestActeur : RAPanelController  <NSWindowDelegate> {
    NSDictionary *plistNationnalityContent;    
    RAListNationnalite *WndListNationnalite;
    RAEditImage *WndEditImage;
}
- (void)useImage:(NSData*) data;

- (id) initLoc;

@property (strong) IBOutlet NSArrayController *ActeurArrayController;
@property (strong) IBOutlet NSArray *DictNationality;
@property (strong) IBOutlet NSApplication *Application;

- (IBAction)openimage:(id)sender;
- (IBAction)GestNationnalite:(id)sender;

@end
