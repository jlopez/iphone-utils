//
//  NSError+Additions.h
//  Additions
//
//  Created by jlopez on 2/16/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DECLARE_ERROR_STRING(name) extern NSString *const name
#define DEFINE_ERROR_STRING(name) NSString *const name = @#name

@interface NSError (JLAdditions)

+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoFirstObject:(id)firstObject varargs:(va_list)ap;

@end


enum {
  IANullEncodingError = -1000,
  IAInvalidIANAEncodingError = -1001,
  IAInvalidCFEncodingError = -1002,
  IAInapplicableStringEncodingError = -1003,
};

DECLARE_ERROR_STRING(IAErrorDomain);

DECLARE_ERROR_STRING(IAErrorIANAEncodingErrorKey);
DECLARE_ERROR_STRING(IAErrorCFEncodingErrorKey);
DECLARE_ERROR_STRING(IAErrorBinaryDataErrorKey);
