//
//  AppDelegate.h
//  DropFilesApp
//
//  Created by Genji on 2013/08/25.
//  Copyright (c) 2013 Genji App. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, DropViewDelegate>

@property (assign) IBOutlet NSWindow *window;

@end
