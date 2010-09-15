//
//  UIImage+Additions.m
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UIImage+Additions.h"


@implementation UIImage (JLAdditions)


- (UIImage *)createThumbnailWithSize:(CGSize)size {
  CGFloat scale = self.scale;
  UIGraphicsBeginImageContextWithOptions(size, NO, scale);
  [[UIColor clearColor] set];
  UIRectFill(CGRectMake(0, 0, size.width, size.height));
  CGSize originalSize = self.size;
  CGFloat scaleFactor = MIN(size.width / originalSize.width, size.height / originalSize.height);
  CGSize targetSize = { originalSize.width * scaleFactor, originalSize.height * scaleFactor };
  CGFloat x = ((int)((size.width - targetSize.width) / 2 * scale)) / scale;
  CGFloat y = ((int)((size.height - targetSize.height) / 2 * scale)) / scale;
  [self drawInRect:CGRectMake(x, y, targetSize.width, targetSize.height)];
  UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return thumbnail;
}


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
