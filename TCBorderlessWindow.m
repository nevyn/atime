#import "TCBorderlessWindow.h"

@implementation TCBorderlessWindow
- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag;
{
	[super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask|NSTexturedBackgroundWindowMask backing:bufferingType defer:flag];
	[self setOpaque:NO];
	[self setBackgroundColor:[NSColor clearColor]];
	[self setCollectionBehavior:NSWindowCollectionBehaviorStationary];
	return self;
}
@end
