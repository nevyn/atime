//
//  atimeAppDelegate.h
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSDate+InternetTime.h"

@interface atimeAppDelegate : NSObject {
    NSWindow *window;
		NSTextField *label;
		NSTimer *updater;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *label;

@end
