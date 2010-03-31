//
//  NSArray+Additions.h
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (JLAdditions)

- (NSArray *)mapWithSelector:(SEL)selector;
- (NSArray *)mapViaTarget:(id)target selector:(SEL)selector;
- (NSArray *)arrayByRemovingNulls;
- (id)firstObject;
- (NSArray *)arrayByRemovingObject:(id)object;
- (NSArray *)sortedArrayComparingSelector:(SEL)selector;

@end
