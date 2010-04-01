//
//  NSIndexSet+Additions.m
//  Additions
//
//  Created by jlopez on 3/4/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSIndexSet+Additions.h"


@implementation NSIndexSet (Additions)


- (NSArray *)arrayWithIndexPathsForSection:(NSUInteger)section {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  NSUInteger index = [self firstIndex];
  while (index != NSNotFound) {
    [array addObject:[NSIndexPath indexPathForRow:index inSection:section]];
    index = [self indexGreaterThanIndex:index];
  }
  return [NSArray arrayWithArray:array];
}


@end
