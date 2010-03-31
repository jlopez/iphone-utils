//
//  NSError+Additions.h
//  Additions
//
//  Created by jlopez on 2/16/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSError (JLAdditions)

+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code userInfoFirstObject:(id)firstObject varargs:(va_list)ap;

@end
