//
//  RAGestTag.h
//  SortMedia
//
//  Created by Philippe Fouquet on 13/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAEditImage.h"
#import "RAPanelController.h"

@interface RAGestTag : RAPanelController <NSWindowDelegate> {
    RAEditImage *WndEditImage;
}

- (id)initLoc;


@property (strong) IBOutlet NSArrayController *TagArrayController;

- (IBAction)OpenPicture:(id)sender;
@end
