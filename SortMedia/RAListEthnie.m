//
//  RAListEthnie.m
//  SortMedia
//
//  Created by Philippe Fouquet on 01/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAListEthnie.h"

@interface RAListEthnie ()

@end

@implementation RAListEthnie

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAListEthnie"];
    
	return self;
}


- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
