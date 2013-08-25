//
//  AppDelegate.m
//  DropFilesApp
//
//  Created by Genji on 2013/08/25.
//  Copyright (c) 2013 Genji App. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

#pragma mark -
#pragma mark Private Method
- (void)itemsDropped:(NSArray *)items
{
  NSLog(@"%@", items);
}

#pragma mark -
#pragma mark NSApplicationDelegate Methods
- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
}

- (void)application:(NSApplication *)sender openFiles:(NSArray *)filenames
{
  [self itemsDropped:filenames];
  [sender replyToOpenOrPrint:NSApplicationDelegateReplySuccess];
}


#pragma mark -
#pragma mark DropView Delegate Method
- (void)dropView:(DropView *)dropView didDropItems:(NSArray *)items
{
  [self itemsDropped:items];
}

@end