//
//  UILabel+Additions.m
//  Additions
//
//  Created by jlopez on 2/11/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UILabel+Additions.h"


@implementation UILabel (JLAdditions)


- (CGSize)resizeToFit {
  CGSize constraints = { self.frame.size.width, 1024 };
  CGSize size = [self.text sizeWithFont:self.font constrainedToSize:constraints lineBreakMode:self.lineBreakMode];
  CGFloat height = size.height;
  NSInteger numberOfLines = self.numberOfLines;
  if (numberOfLines) {
    CGFloat leading = self.font.leading;
    height = MIN(leading * numberOfLines, height);
  }
  CGRect frame = { self.frame.origin, { constraints.width, height } };
  self.frame = frame;
  return size;
}


@end
