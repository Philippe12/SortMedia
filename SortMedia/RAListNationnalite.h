//
//  RAListeNationnalite.h
//  SortMedia
//
//  Created by Philippe Fouquet on 07/06/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RAPanelController.h"

@interface RAListNationnalite : RAPanelController  <NSWindowDelegate> {
    NSDictionary *plistNationnalityContent;
}

- (id)initLoc;

@end
