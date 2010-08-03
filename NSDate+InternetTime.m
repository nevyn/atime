//
//  NSDate+InternetTime.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "NSDate+InternetTime.h"


@implementation NSDate (TCInternetTime)
-(NSTimeInterval)internetTimeOfDay;
{
	return fmod([self timeIntervalSince1970]+3600, 86400)/86400.*1000.;
}
@end
