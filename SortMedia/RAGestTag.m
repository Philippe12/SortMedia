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

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAGestTag"];
        
	return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)OpenPicture:(id)sender {
    WndEditImage = [[RAEditImage alloc] init:self ];
    if( [WndEditImage runAsPanel: [self window]] == 1 )
    {
        [self useImage:[WndEditImage GetImage]];
    }
}

- (void)useImage:(NSData*) data {
    Tag *selectedTag = [self getCurrent:_TagArrayController];
    if (selectedTag) {
        selectedTag.image = data;
    }
}

@end
