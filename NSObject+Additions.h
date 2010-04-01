//
//  NSObject+Additions.h
//  Additions
//
//  Created by jlopez on 2/27/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (JLAdditions)

+ (NSArray *)arrayWithPropertyNames;

- (NSDate *)dateValueForKey:(NSString *)key;
- (NSDate *)dateValueForKeyPath:(NSString *)keyPath;
- (NSInteger)integerValueForKey:(NSString *)key;
- (NSInteger)integerValueForKeyPath:(NSString *)keyPath;
- (NSNumber *)numberValueForKey:(NSString *)key;
- (NSNumber *)numberValueForKeyPath:(NSString *)keyPath;
- (id)objectValueForKey:(NSString *)key;
- (id)objectValueForKeyPath:(NSString *)keyPath;
- (NSString *)stringValueForKey:(NSString *)key;
- (NSString *)stringValueForKeyPath:(NSString *)keyPath;

@end
