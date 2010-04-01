//
//  NSNumber+Additions.m
//  Additions
//
//  Created by jlopez on 3/1/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSNumber+Additions.h"


@implementation NSNumber (JLAdditions)


+ (NSNumber *)numberWithValue:(id)value {
  if (!value || value == [NSNull null])
    return nil;
  if ([value isKindOfClass:[NSNumber class]])
    return value;
  return [NSDecimalNumber decimalNumberWithString:[NSString stringWithValue:value]];
}


@end
