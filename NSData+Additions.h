//
//  NSData+Additions.h
//  Additions
//
//  Created by jlopez on 2/11/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (JLAdditions)

- (NSArray *)componentsSeparatedByData:(NSData *)delimiter;
- (NSRange)rangeOfData:(NSData *)data range:(NSRange)range;
- (NSString *)stringWithIANAEncoding:(NSString *)ianaEncoding error:(NSError **)error;
- (void)dumpContents;

@end
