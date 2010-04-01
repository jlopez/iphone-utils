//
//  NSDateFormatter+Additions.m
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSDateFormatter+Additions.h"


@implementation NSDateFormatter (JLAdditions)


static NSDateFormatter *defaultDateFormatter = nil;
+ (NSDateFormatter *)defaultDateFormatter {
  if (defaultDateFormatter == nil) {
    defaultDateFormatter = [NSDateFormatter new];
    [defaultDateFormatter setDateStyle:NSDateFormatterLongStyle];
    [defaultDateFormatter setTimeStyle:NSDateFormatterNoStyle];
  }
  return defaultDateFormatter;
}


@end
