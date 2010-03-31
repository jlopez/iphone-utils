//
//  NSFileManager+Additions.h
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSFileManager (JLAdditions)

+ (BOOL)processFile:(NSString *)path function:(BOOL (*)(NSString *, void *))function context:(void *)context encoding:(NSStringEncoding)enc error:(NSError **)error;

@end
