//
//  RAEditImage.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface RAEditImage : NSWindowController {
    id ItemSecelted;
}

@property (strong) IBOutlet IKImageView *ImageEditor;

- (id)init: (id)item;
- (IBAction)valid:(id)sender;
- (IBAction)OpenImage:(id)sender;
- (IBAction)switchToolMode:(id)sender;

- (int)runAsPanel: (id)windowmd;

@end
