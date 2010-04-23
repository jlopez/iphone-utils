//
//  NSData+Additions.m
//  Additions
//
//  Created by jlopez on 2/11/10.
//  Copyright 2010 JLA. All rights reserved.
//
#import "NSData+Additions.h"


@implementation NSData (JLAdditions)


- (NSRange)rangeOfData:(NSData *)data range:(NSRange)range {
  NSAssert3(range.location + range.length <= [self length], @"Invalid range { %d, %d } - NSData is %d bytes", range.location, range.length, [self length]);
  NSUInteger dataLength = [data length];
  if (dataLength == 0)
    return NSMakeRange(0, 0);
  const char *base = [self bytes];
  const char *cmp = [data bytes];
  const char *ptr = base + range.location;
  while (range.length >= dataLength) {
    const char *ptrDelim = memchr(ptr, cmp[0], range.length - dataLength);
    if (!ptrDelim)
      return NSMakeRange(NSNotFound, 0);
    if (!memcmp(ptrDelim, cmp, dataLength))
      return NSMakeRange(ptrDelim - base, dataLength);
    range.length -= (ptrDelim + 1) - ptr;
    ptr = ptrDelim + 1;
  }
  return NSMakeRange(NSNotFound, 0);
}


- (NSArray *)componentsSeparatedByData:(NSData *)delimiter {
  NSMutableArray *r = [NSMutableArray arrayWithCapacity:8];
  NSUInteger length = [self length];
  NSUInteger pos = 0;
  while (true) {
    NSRange rng = [self rangeOfData:delimiter range:NSMakeRange(pos, length - pos)];
    if (rng.location == NSNotFound) {
      [r addObject:[self subdataWithRange:NSMakeRange(pos, length - pos)]];
      return [NSArray arrayWithArray:r];
    }
    [r addObject:[self subdataWithRange:NSMakeRange(pos, rng.location - pos)]];
    pos = rng.location + rng.length;
  }
}


- (BOOL)hasPrefix:(NSData *)data {
  NSUInteger length = [data length];
  if ([self length] < length)
    return NO;
  return memcmp([self bytes], [data bytes], length) == 0;
}


- (BOOL)hasSuffix:(NSData *)data {
  NSUInteger length = [data length];
  NSUInteger myLength = [self length];
  if (myLength < length)
    return NO;
  const UInt8 *ptr = [self bytes];
  return memcmp(ptr + myLength - length, [data bytes], length) == 0;
}


- (NSString *)stringWithIANAEncoding:(NSString *)ianaEncoding error:(NSError **)error {
  if (ianaEncoding == nil) {
    if (error)
      *error = [NSError errorWithDomain:IAErrorDomain code:IAInvalidIANAEncodingError userInfoObjectsAndKeys:
                [NSNull null], IAErrorIANAEncodingErrorKey,
                @"Invalid IANA encoding: nil", NSLocalizedDescriptionKey, nil];
    return nil;
  }

  CFStringEncoding cfEncoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)ianaEncoding);
  if (cfEncoding == kCFStringEncodingInvalidId) {
    if (error)
      *error = [NSError errorWithDomain:IAErrorDomain code:IAInvalidIANAEncodingError userInfoObjectsAndKeys:
                ianaEncoding, IAErrorIANAEncodingErrorKey,
                [NSString stringWithFormat:@"Invalid IANA encoding: %@", ianaEncoding], NSLocalizedDescriptionKey, nil];
    return nil;
  }

  NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
  if (encoding == kCFStringEncodingInvalidId) {
    if (error)
      *error = [NSError errorWithDomain:IAErrorDomain code:NSFileReadInapplicableStringEncodingError userInfoObjectsAndKeys:
                [NSNumber numberWithInteger:encoding], IAErrorCFEncodingErrorKey,
                [NSString stringWithFormat:@"Invalid CF encoding: %d (IANA: %@)", cfEncoding, ianaEncoding], NSLocalizedDescriptionKey, nil];
    return nil;
  }

  NSString *string = [[[NSString alloc] initWithData:self encoding:encoding] autorelease];
  if (string == nil) {
    if (error)
      *error = [NSError errorWithDomain:IAErrorDomain code:NSFileReadInapplicableStringEncodingError userInfoObjectsAndKeys:
                [NSNumber numberWithInteger:encoding], IAErrorBinaryDataErrorKey,
                [NSString stringWithFormat:@"Unable to decode binary data using NSEncoding: %d (CF: %d, IANA: %@)", encoding, cfEncoding, ianaEncoding], NSLocalizedDescriptionKey, nil];
    return nil;
  }

  return string;
}


- (void)dumpContents {
  int length = [self length];
  const UInt8 *ptr = [self bytes];
  NSMutableString *buffer = [NSMutableString stringWithCapacity:160];
  for (int i = 0; i < length; i += 16) {
    [buffer setString:@""];
    for (int j = 0; j < 16; ++j) {
      if (i + j < length)
        [buffer appendFormat:@" %02X", ptr[i + j]];
      else
        [buffer appendString:@"   "];
    }
    [buffer appendString:@" |"];
    for (int j = 0; j < 16; ++j) {
      char ch = i + j < length ? ptr[i + j] : '.';
      if (ch < 0x20 || ch >= 0x7F)
        ch = '.';
      [buffer appendFormat:@"%c", ch];
    }
    [buffer appendString:@"|"];
    NSLog(@":%04X%@", i, buffer);
  }
}

@end
