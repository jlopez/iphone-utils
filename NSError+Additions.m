//
//  NSError+Additions.m
//  Additions
//
//  Created by jlopez on 2/16/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSError+Additions.h"

DEFINE_ERROR_STRING(IAErrorDomain);

DEFINE_ERROR_STRING(IAErrorIANAEncodingErrorKey);
DEFINE_ERROR_STRING(IAErrorCFEncodingErrorKey);
DEFINE_ERROR_STRING(IAErrorBinaryDataErrorKey);

@implementation NSError (JLAdditions)


+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoObjectsAndKeys:(id)firstObject, ... {
  va_list va;
  va_start(va, firstObject);
  NSError *ret = [self errorWithDomain:domain code:code userInfoFirstObject:firstObject varargs:va];
  va_end(va);

  return ret;
}


+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoFirstObject:(id)firstObject varargs:(va_list)va {
  id value = firstObject;
  NSMutableDictionary *userInfo = nil;
  while (value) {
    id key = va_arg(va, id);
    if (userInfo == nil)
      userInfo = [NSMutableDictionary dictionaryWithCapacity:4];
    [userInfo setObject:value forKey:key];
    value = va_arg(va, id);
  }
  return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}


@end
