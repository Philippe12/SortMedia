//
//  RAAppDelegate.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Tag.h"
#import "RAGestTag.h"
#import "RAGestActeur.h"
#import "RAGestPhoto.h"

@interface RAAppDelegate : NSObject <NSApplicationDelegate> {
    RAGestTag *WndTag;
    RAGestActeur *WndActeur;
    RAGestPhoto *WndPhoto;
}

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;
- (IBAction)GestionTag:(id)sender;
- (IBAction)GestionActeur:(id)sender;
- (IBAction)GestionPhoto:(id)sender;

@end
