//
//  CGGeometryAdditions.h
//  Additions
//
//  Created by jlopez on 3/2/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


CG_INLINE CGPoint
CGRectCenterPointIntegral(CGRect rect) {
  return (CGPoint){ rect.origin.x + floorf(rect.size.width / 2), rect.origin.y + floorf(rect.size.height / 2) };
}
