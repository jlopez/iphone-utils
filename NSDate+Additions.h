//
//  NSDate+Additions.h
//  Additions
//
//  Created by jlopez on 2/27/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSDate (JLAdditions)

+ (NSDate *)dateFromISO8601String:(NSString *)iso8601;

- (NSDate *)dateByTruncatingTime;
- (NSString *)iso8601String;
- (NSString *)shortStringWithMeridian:(BOOL *)isPM;
- (NSString *)stringWithFormat:(NSString *)format;

@end
