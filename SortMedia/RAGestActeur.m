//
//  RAGestActeur.m
//  SortMedia
//
//  Created by Philippe Fouquet on 17/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAGestActeur.h"
#import "Acteur.h"
#import "RAEditImage.h"

@interface RAGestActeur ()

@end

@implementation RAGestActeur

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id) initLoc {
    self = [super initWithWindowNibName:@"RAGestActeur"];
    if (self) {
        NSString *DataPath = [[NSBundle mainBundle] pathForResource:@"fr" ofType:@"plist"];
        NSDictionary *table = [[NSDictionary alloc] initWithContentsOfFile:DataPath];
        _DictNationality = [table allValues];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)openimage:(id)sender {
    WndEditImage = [[RAEditImage alloc] init:self ];
    if( [WndEditImage runAsPanel: [self window]] == 1 )
    {
        [self useImage:[WndEditImage GetImage]];
    }
}

- (IBAction)GestNationnalite:(id)sender {
    WndListNationnalite = [[RAListNationnalite alloc] initWithManagedObjectContext:[self managedObjectContext]:[self managedObjectModel]:[self persistentStoreCoordinator]];
    [WndListNationnalite runAsPanel:[self window]];
}

- (void)useImage:(NSData*) data {
    Acteur *selectedActeur = [self getCurrent:_ActeurArrayController];
    if (selectedActeur) {
        selectedActeur.photo = data;
    }
}

@end
