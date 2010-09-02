//
//  NSArray+Additions.h
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (JLAdditions)

- (NSArray *)mapWithBlock:(id (^)(id obj))block;
- (NSArray *)mapWithSelector:(SEL)selector;
- (NSArray *)mapViaTarget:(id)target selector:(SEL)selector;
- (id)findWithBlock:(BOOL (^)(id obj))block;
- (NSArray *)arrayByRemovingNulls;
- (id)firstObject;
- (NSArray *)arrayByRemovingObject:(id)object;
- (NSArray *)sortedArrayComparingSelector:(SEL)selector;
- (NSUInteger)countOfObjectsEqualTo:(id)object;
- (NSUInteger)countOfObjectsNotEqualTo:(id)object;
- (id)guardedObjectAtIndex:(NSUInteger)index;

@end
