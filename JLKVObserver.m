//
//  JLKVObserver.m
//  Celestial
//
//  Created by jlopez on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JLKVObserver.h"


@implementation JLKVObserver

@synthesize observedObject;
@synthesize keyPath;
@synthesize observingOptions;
@synthesize allowNestedCalls;


- (void)dealloc {
  [self stopObserving];
  [super dealloc];
}


- (void)startObservingObject:(id)object keyPath:(NSString *)keyPath_ block:(void (^)())block_ {
  NSAssert(keyPath_ != nil, @"keyPath must not be nil");
  NSAssert(block_ != nil, @"block must not be nil");

  if (object == observedObject && [keyPath_ isEqualToString:keyPath] && block == block_)
    return;

  [self stopObserving];

  if (object == nil)
    return;

  observedObject = [object retain];
  keyPath = [keyPath_ retain];
  block = [block_ copy];
  [observedObject addObserver:self forKeyPath:keyPath options:observingOptions context:self];
}


- (void)stopObserving {
  if (observedObject) {
    [observedObject removeObserver:self forKeyPath:keyPath];
    [observedObject release];
    observedObject = nil;

    [keyPath release];
    keyPath = nil;

    [block release];
    block = nil;
  }
}


- (BOOL)isObserving {
  return observedObject != nil;
}


- (void)observeValueForKeyPath:(NSString *)keyPath_ ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (self == context) {
    if (isNested && !allowNestedCalls)
      return;
    isNested = YES;
    block();
    isNested = NO;
  }
  else
    [super observeValueForKeyPath:keyPath_ ofObject:object change:change context:context];
}


@end
