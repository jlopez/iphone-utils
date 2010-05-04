//
//  NSObject+Additions.m
//  Additions
//
//  Created by jlopez on 2/27/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSObject+Additions.h"

#import <objc/runtime.h>


@implementation NSObject (JLAdditions)


- (NSDate *)dateValueForKey:(NSString *)key {
  id obj = [self objectValueForKey:key];
  if (obj == nil)
    return nil;
  if ([obj isKindOfClass:[NSDate class]])
    return obj;
  return [NSDate dateFromISO8601String:[NSString stringWithValue:obj]];
}


- (NSDate *)dateValueForKeyPath:(NSString *)keyPath {
  id obj = [self objectValueForKeyPath:keyPath];
  if (obj == nil)
    return nil;
  if ([obj isKindOfClass:[NSDate class]])
    return obj;
  return [NSDate dateFromISO8601String:[NSString stringWithValue:obj]];
}


- (NSInteger)integerValueForKey:(NSString *)key {
  return [[self stringValueForKey:key] integerValue];
}


- (NSInteger)integerValueForKeyPath:(NSString *)keyPath {
  return [[self stringValueForKeyPath:keyPath] integerValue];
}


- (NSNumber *)numberValueForKey:(NSString *)key {
  return [NSNumber numberWithValue:[self valueForKey:key]];
}


- (NSNumber *)numberValueForKeyPath:(NSString *)keyPath {
  return [NSNumber numberWithValue:[self valueForKeyPath:keyPath]];
}


- (NSString *)stringValueForKey:(NSString *)key {
  return [NSString stringWithValue:[self valueForKey:key]];
}


- (NSString *)stringValueForKeyPath:(NSString *)keyPath {
  return [NSString stringWithValue:[self valueForKeyPath:keyPath]];
}


- (id)objectValueForKey:(NSString *)key {
  id object = [self valueForKey:key];
  return object == [NSNull null] ? nil : object;
}


- (id)objectValueForKeyPath:(NSString *)keyPath {
  id object = [self valueForKeyPath:keyPath];
  return object == [NSNull null] ? nil : object;
}


static NSMutableDictionary *propertiesForClassDictionary = nil;
+ (NSArray *)arrayWithPropertyNames {
  id allKeys = [propertiesForClassDictionary objectForKey:self];
  if (allKeys == nil) {
    if (propertiesForClassDictionary == nil)
      propertiesForClassDictionary = [[NSMutableDictionary alloc] initWithCapacity:64];
    NSUInteger outCount;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:outCount];
    for(NSUInteger i = 0; i < outCount; i++) {
      objc_property_t property = properties[i];
      const char *propName = property_getName(property);
      if(propName) {
        NSString *propertyName = [NSString stringWithUTF8String:propName];
        [array addObject:propertyName];
      }
    }
    free(properties);
    NSArray *superclassKeys = [[self superclass] arrayWithPropertyNames];
    if (superclassKeys)
      [array addObjectsFromArray:superclassKeys];
    allKeys = [NSArray arrayWithArray:array];
    [propertiesForClassDictionary setObject:allKeys forKey:self];
  }
  return allKeys;
}


@end
