//
//  RAEditImage.m
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAEditImage.h"

@interface RAEditImage ()

@end

@implementation RAEditImage

- (id)init: (id)item {
	self = [super initWithWindowNibName:@"RAEditImage"];
    ItemSecelted = item;
    return self;
}

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

- (int)runAsPanel: (id)mainWindow {
    [NSApp beginSheet:self.window
        modalForWindow:(NSWindow *)mainWindow
        modalDelegate:self.window
        didEndSelector:nil
        contextInfo:nil];
    
    NSInteger retvalue = [NSApp runModalForWindow:self.window];
    
    [NSApp endSheet:self.window];
    [self.window orderOut:self];

    return (int)retvalue;
}

- (IBAction)OpenImage:(id)sender {
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    if( [openPanel runModal] == NSFileHandlingPanelOKButton )
    {
        [_ImageEditor setImageWithURL: [openPanel URL]];
    }

}

- (NSData*) GetImage{
    NSMutableData* retdata = [[NSMutableData alloc]init];
    CGImageRef image;
    
    image = [_ImageEditor image];
    if (image)
    {
        CGImageDestinationRef dest = CGImageDestinationCreateWithData(
                                                (__bridge CFMutableDataRef)(retdata),
                                                (__bridge CFStringRef)@"public.jpeg",
                                                1, NULL );
        if (dest)
        {
            CGImageDestinationAddImage(dest, image,NULL);
            CGImageDestinationFinalize(dest);
            CFRelease(dest);
        }
    } else
    {
        NSLog(@"*** saveImageToPath - no image");
    }
    return retdata;
}

- (IBAction)switchToolMode:(id)sender {
    NSInteger newTool;
    if ([sender isKindOfClass: [NSSegmentedControl class]])
        newTool = [sender selectedSegment];
    else
        newTool = [sender tag];
    
    switch (newTool)
    {
        case 0:
            [_ImageEditor setCurrentToolMode: IKToolModeMove];
            break;
        case 1:
            [_ImageEditor setCurrentToolMode: IKToolModeSelect];
            break;
        case 2:
            [_ImageEditor setCurrentToolMode: IKToolModeCrop];
            break;
        case 3:
            [_ImageEditor setCurrentToolMode: IKToolModeRotate];
            break;
        case 4:
            [_ImageEditor setCurrentToolMode: IKToolModeAnnotate];
            break;
    }
}

- (IBAction)didFinish:(id)sender {
    [NSApp stopModalWithCode:[sender tag]];
}

@end
