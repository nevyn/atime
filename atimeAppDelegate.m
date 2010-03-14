//
//  atimeAppDelegate.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "atimeAppDelegate.h"

#define $d(...) [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define $sf(...) [NSString stringWithFormat:__VA_ARGS__]

@implementation atimeAppDelegate

@synthesize window, label;

-(void)updateTime;
{
	NSTimeInterval itime = [[NSDate date] internetTimeOfDay];
	NSUInteger whole = itime;
	NSUInteger fraction = (itime-whole)*100;
	
	NSMutableAttributedString *pretty = [[NSMutableAttributedString new] autorelease];
	
	NSAttributedString *at = [[[NSAttributedString alloc] initWithString:@"@" attributes:$d(
		[NSFont boldSystemFontOfSize:56], NSFontAttributeName
	)] autorelease];
	
	NSAttributedString *wholes = [[[NSAttributedString alloc] initWithString:$sf(@"%3d", whole) attributes:$d(
		[NSFont systemFontOfSize:56], NSFontAttributeName
	)] autorelease];
	
	NSAttributedString *fracs = [[[NSAttributedString alloc] initWithString:$sf(@"%02d", fraction) attributes:$d(
		[NSFont systemFontOfSize:56], NSFontAttributeName,
		[NSColor colorWithCalibratedWhite:.4 alpha:.7], NSForegroundColorAttributeName
	)] autorelease];
	
	[pretty appendAttributedString:at];
	[pretty appendAttributedString:wholes];
	[pretty appendAttributedString:fracs];
	[label setAttributedStringValue:pretty];
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	updater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

@end
