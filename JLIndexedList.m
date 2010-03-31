//
//  JLIndexedList.m
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "JLIndexedList.h"


@implementation JLIndexedList

@synthesize indexTitles;
@synthesize sections;


NSInteger comparingFunction(id v1, id v2, void *ctx) {
  SEL selector = (SEL)ctx;
  return [[v1 performSelector:selector] compare:[v2 performSelector:selector]];
}


- (id)initWithArray:(NSArray *)array labelSelector:(SEL)selector {
  if (self = [super init]) {
    labelSelector = selector;

    NSMutableArray *sections_ = [NSMutableArray arrayWithCapacity:26];
    NSMutableArray *indexTitles_ = [NSMutableArray arrayWithCapacity:26];
    NSMutableArray *section = nil;
    unichar currentLetter = 0;
    for (id value in [array sortedArrayUsingFunction:comparingFunction context:labelSelector]) {
      NSString *label = [value performSelector:labelSelector];
      unichar letter = [label characterAtIndex:0];
      if (currentLetter != letter) {
        if (section)
          [sections_ addObject:section];
        section = [NSMutableArray arrayWithCapacity:4];
        currentLetter = letter;
        [indexTitles_ addObject:[label substringToIndex:1]];
      }
      [section addObject:value];
    }
    if (section)
      [sections_ addObject:section];

    sections = [sections_ retain];
    indexTitles = [indexTitles_ retain];
  }
  return self;
}


- (NSString *)labelAtIndexPath:(NSIndexPath *)indexPath {
  return [[self valueAtIndexPath:indexPath] performSelector:labelSelector];
}


- (NSIndexPath *)indexPathForValue:(id)value {
  if (value == nil)
    return nil;
  
  for (int sec = 0; sec < [sections count]; ++sec) {
    NSArray *section = [sections objectAtIndex:sec];
    for (int row = 0; row < [section count]; ++row) {
      if ([value isEqual:[section objectAtIndex:row]])
        return [NSIndexPath indexPathForRow:row inSection:sec];
    }
  }
  return nil;
}


- (id)valueAtIndexPath:(NSIndexPath *)indexPath {
  return [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}


@end
