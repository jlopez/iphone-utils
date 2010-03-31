//
//  NSArray+Additions.m
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSArray+Additions.h"


@implementation NSArray (JLAdditions)


- (NSArray *)mapWithSelector:(SEL)selector {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  for (id object in self) {
    id mappedValue = nil;
    if ([object respondsToSelector:selector])
      mappedValue = [object performSelector:selector];
    if (mappedValue == nil)
      mappedValue = [NSNull null];
    [array addObject:mappedValue];
  }
  return [NSArray arrayWithArray:array];
}


- (NSArray *)mapViaTarget:(id)target selector:(SEL)selector {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  for (id object in self) {
    id mappedValue = [target performSelector:selector withObject:object];
    if (mappedValue == nil)
      mappedValue = [NSNull null];
    [array addObject:mappedValue];
  }
  return [NSArray arrayWithArray:array];
}


- (NSArray *)arrayByRemovingNulls {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  for (id object in self) {
    if (![object isKindOfClass:[NSNull class]])
      [array addObject:object];
  }
  return [NSArray arrayWithArray:array];
}


- (id)firstObject {
  return [self count] > 0 ? [self objectAtIndex:0] : nil;
}


- (NSArray *)arrayByRemovingObject:(id)object {
  NSMutableArray *array = [NSMutableArray arrayWithArray:self];
  [array removeObject:object];
  return [NSArray arrayWithArray:array];
}


static NSInteger compareUsingSelector(id obj1, id obj2, void *context) {
  SEL selector = (SEL)context;
  id v1 = [obj1 performSelector:selector];
  id v2 = [obj2 performSelector:selector];
  return [v1 compare:v2];
}


- (NSArray *)sortedArrayComparingSelector:(SEL)selector {
  return [self sortedArrayUsingFunction:compareUsingSelector context:selector];
}


@end
