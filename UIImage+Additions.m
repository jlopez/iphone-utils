//
//  UIImage+Additions.m
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UIImage+Additions.h"


@implementation UIImage (JLAdditions)


- (void)drawTiledOnRect:(CGRect)rect {
  CGRect tileRect = (CGRect){ CGPointZero, self.size };

  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSaveGState(ctx);
  CGContextClipToRect(ctx, rect);
  CGContextTranslateCTM(ctx, rect.origin.x, rect.origin.y);
  CGContextScaleCTM(ctx, 1, -1);
  CGContextDrawTiledImage(ctx, tileRect, self.CGImage);
  CGContextRestoreGState(ctx);
}


@end
