//
//  RAListTag.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAPanelController.h"
#import "RAGestTag.h"
#import "Photo.h"

@interface RAListTag : RAPanelController  <NSWindowDelegate> {
    NSDictionary *plistNationnalityContent;
    RAGestTag *WndTag;
    Photo *_SelectedItem;
}
- (void)setPhotoItem:(Photo *)value;


- (id)initLoc;

@property (strong) IBOutlet NSArrayController *TagArrayController;
- (IBAction)GestionDesTags:(id)sender;
- (IBAction)AddTag:(id)sender;



@end
