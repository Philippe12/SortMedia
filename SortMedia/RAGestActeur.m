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

- (RAGestActeur *)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc
{
	self = [super initWithWindowNibName:@"RAGestActeur"];
    
	[self setManagedObjectContext:inMoc];
	[self setManagedObjectModel:inMom];
	[self setPersistentStoreCoordinator:inPsc];
    
    NSString *DataPath = [[NSBundle mainBundle] pathForResource:@"fr" ofType:@"plist"];
    NSDictionary *table = [[NSDictionary alloc] initWithContentsOfFile:DataPath];
    _DictNationality = [table allValues];
    
	return self;
}

- (void)setManagedObjectModel:(NSManagedObjectModel *)value
{
	// keep only weak ref
	_mom = value;
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)value
{
	// keep only weak ref
	_moc = value;
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value
{
    _psc = value;
}

- (NSManagedObjectContext *)managedObjectContext
{
	return _moc;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return _mom;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return _psc;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(Acteur*)getCurrentActeur {
    if ([[self.ActeurArrayController selectedObjects] count] > 0) {
        return [[self.ActeurArrayController selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
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

- (IBAction)Quite:(id)sender {
    [NSApp stopModalWithCode:[sender tag]];
}

- (void)useImage:(NSData*) data {
    Acteur *selectedActeur = [self getCurrentActeur];
    if (selectedActeur) {
        selectedActeur.photo = data;
    }
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


@end
