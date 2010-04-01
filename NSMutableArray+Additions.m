//
//  NSMutableArray+Additions.m
//  Additions
//
//  Created by jlopez on 3/2/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSMutableArray+Additions.h"


@implementation NSMutableArray (JLAdditions)


static NSInteger compareNumberValuesForKey(id o1, id o2, void *ctx) {
  NSString *key = (id)ctx;
  return [[o1 numberValueForKey:key] compare:[o2 numberValueForKey:key]];
}


- (void)sortComparingNumberValuesForKey:(NSString *)key {
  [self sortUsingFunction:compareNumberValuesForKey context:key];
}


@end
