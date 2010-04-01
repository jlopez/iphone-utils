//
//  CGContextAdditions.m
//  Additions
//
//  Created by jlopez on 2/27/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "CGContextAdditions.h"


void CGContextFillRoundedRect(CGContextRef ctx, CGRect rect, CGFloat radius) {
  CGFloat x = rect.origin.x;
  CGFloat y = rect.origin.y;
  CGFloat w = rect.size.width;
  CGFloat h = rect.size.height;
  CGFloat hw = w / 2;
  CGFloat hh = h / 2;
  CGContextBeginPath(ctx);
  CGContextMoveToPoint(ctx, x, y + hh);
  CGContextAddArcToPoint(ctx, x, y, x + hw, y, radius);
  CGContextAddArcToPoint(ctx, x + w, y, x + w, y + hh, radius);
  CGContextAddArcToPoint(ctx, x + w, y + h, x + hw, y + h, radius);
  CGContextAddArcToPoint(ctx, x, y + h, x, y + hh, radius);
  CGContextClosePath(ctx);
  CGContextFillPath(ctx);
}
