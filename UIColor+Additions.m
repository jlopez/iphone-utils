//
//  UIColor+Additions.m
//  Additions
//
//  Created by jlopez on 2/11/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UIColor+Additions.h"


@implementation UIColor (JLAdditions)

+ (UIColor *)tableHeaderTextColor {
  return [UIColor colorWithRed:31/255.0 green:40/255.0 blue:57/255.0 alpha:1];
}


+ (UIColor *)tableHeaderShadowColor {
  return [UIColor colorWithWhite:1 alpha:0.5];
}


+ (UIColor *)groupedTableTextColor {
  return [UIColor colorWithRed:0x4C/255.0 green:0x56/255.0 blue:0x6C/255.0 alpha:1];
}


+ (UIColor *)blueSelectionColor {
  return [UIColor colorWithRed:2/255.0 green:0x73/255.0 blue:0xED/255.0 alpha:1];
}


@end
