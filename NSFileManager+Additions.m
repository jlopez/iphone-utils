//
//  NSFileManager+Additions.m
//  Additions
//
//  Created by jlopez on 2/13/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSFileManager+Additions.h"


@implementation NSFileManager (JLAdditions)


+ (BOOL)processFile:(NSString *)path function:(BOOL (*)(NSString *, void *))function context:(void *)context encoding:(NSStringEncoding)enc error:(NSError **)error {
  NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:enc error:error];
  if (fileContents == nil)
    return NO;
  for (NSString *line in [fileContents componentsSeparatedByString:@"\n"]) {
    if ([line length] == 0)
      continue;
    if (!function(line, context))
      return NO;
  }
  return YES;
}


@end
