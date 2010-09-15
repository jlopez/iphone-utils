//
//  UIImage+Additions.h
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage (JLAdditions)

- (UIImage *)createThumbnailWithSize:(CGSize)size;
- (void)drawTiledOnRect:(CGRect)rect;

@end
