//
//  NSDate+InternetTime.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "NSDate+InternetTime.h"


@implementation NSDate (TCInternetTime)
-(NSDate*)atMidnight;
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
	[components setHour:0];
	[components setMinute:0];
	[components setSecond:0];
	return [[NSCalendar currentCalendar] dateFromComponents:components];
}
// Thanks to http://cocoawithlove.com/2008/10/worldtimeconverter-dates-and-timezones.html
// for the timezone magic
-(NSTimeInterval)internetTimeOfDay;
{
	NSDate *selfInBMT; {
    NSTimeZone *source = [NSTimeZone systemTimeZone];
  	NSTimeZone *dest = [NSTimeZone timeZoneWithName:@"Europe/Zurich"];
    
    NSInteger sourceSeconds = [source secondsFromGMTForDate:self];
		NSInteger destinationSeconds = [dest secondsFromGMTForDate:self];
		NSTimeInterval interval = destinationSeconds - sourceSeconds;
		selfInBMT = [NSDate dateWithTimeInterval:interval sinceDate:self];
  }
  
	NSTimeInterval secondsSinceMidnight = [selfInBMT timeIntervalSinceDate:[selfInBMT atMidnight]];
	NSTimeInterval secondsInADay = 24*60*60.;
	return (secondsSinceMidnight/secondsInADay)*1000.;
}
@end
