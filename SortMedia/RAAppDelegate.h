//
//  RAAppDelegate.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RAAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
