//
//  NSDate+Additions.m
//  Additions
//
//  Created by jlopez on 2/27/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSDate+Additions.h"

#import "ISO8601DateFormatter.h"

@implementation NSDate (JLAdditions)


static ISO8601DateFormatter *iso8601Formatter;
+ (ISO8601DateFormatter *)iso8601Formatter {
  if (iso8601Formatter == nil) {
    iso8601Formatter = [ISO8601DateFormatter new];
    iso8601Formatter.parsesStrictly = YES;
    iso8601Formatter.includeTime = YES;
  }
  return iso8601Formatter;
}


+ (NSDate *)dateFromISO8601String:(NSString *)iso8601 {
  return [[self iso8601Formatter] dateFromString:iso8601];
}


- (NSString *)iso8601String {
  return [[NSDate iso8601Formatter] stringFromDate:self];
}


- (NSString *)shortStringWithMeridian:(BOOL *)isPM {
  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:self];
  NSInteger hour = [components hour];
  NSInteger minute = [components minute];
  if (isPM)
    *isPM = hour >= 12;
  hour %= 12;
  if (hour == 0)
    hour = 12;
  if (minute == 0)
    return [NSString stringWithFormat:@"%d", hour];
  return [NSString stringWithFormat:@"%d:%02d", hour, minute];
}


- (NSDate *)dateByTruncatingTime {
  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
  return [[NSCalendar currentCalendar] dateFromComponents:components];
}


- (NSString *)stringWithFormat:(NSString *)format {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:format];
  NSString *s = [formatter stringFromDate:self];
  [formatter release];
  return s;
}


@end
