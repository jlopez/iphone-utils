//
//  NSString+Additions.h
//  Additions
//
//  Created by jlopez on 2/11/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSString (JLAdditions)

+ (NSString *)stringForHTMLEntity:(NSString *)entityName;

- (NSString *)stringByEncodingURLParameter;
- (NSInteger)indexOfCharacter:(unichar)ch;
- (NSInteger)indexOfCharacter:(unichar)ch fromIndex:(NSInteger)index;
- (NSString *)stringByDecodingHTMLEntities;
- (NSArray *)maximalComponentsSeparatedByString:(NSString *)delimiter maximumLength:(NSInteger)maxSize;

@end
