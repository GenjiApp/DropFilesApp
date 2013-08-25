//
//  DropView.h
//  DropFilesApp
//
//  Created by Genji on 2013/08/25.
//  Copyright (c) 2013 Genji App. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol DropViewDelegate;

@interface DropView : NSView <NSDraggingDestination>

@property (nonatomic, weak) IBOutlet id <DropViewDelegate> delegate;

@end


@protocol DropViewDelegate <NSObject>

- (void)dropView:(DropView *)dropView didDropItems:(NSArray *)items;

@end