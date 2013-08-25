//
//  DropView.m
//  DropFilesApp
//
//  Created by Genji on 2013/08/25.
//  Copyright (c) 2013 Genji App. All rights reserved.
//

#import "DropView.h"

@implementation DropView
{
  BOOL _draggingEntered;
}

- (id)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  if(self) {
    [self registerForDraggedTypes:@[NSFilenamesPboardType]];
  }

  return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
  [super drawRect:dirtyRect];

  if(_draggingEntered) [[NSColor redColor] set];
  else [[NSColor windowBackgroundColor] set];
  NSRectFill(dirtyRect);
}


#pragma mark -
#pragma mark NSDraggingDestination Methods
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
  NSLog(@"dragging entered");
  _draggingEntered = YES;
  [self setNeedsDisplay:YES];
  return NSDragOperationCopy;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender
{
  NSLog(@"dragging exited");
  _draggingEntered = NO;
  [self setNeedsDisplay:YES];
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender
{
  NSLog(@"dragging ended");
  _draggingEntered = NO;
  [self setNeedsDisplay:YES];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
  NSLog(@"perform drag");

  NSPasteboard *pasteboard = [sender draggingPasteboard];
  if([[pasteboard types] containsObject:NSFilenamesPboardType]) {
    NSArray *items = [pasteboard propertyListForType:NSFilenamesPboardType];
    if([self.delegate respondsToSelector:@selector(dropView:didDropItems:)]) {
      [self.delegate dropView:self didDropItems:items];
    }
    return YES;
  }

  return NO;
}

@end
