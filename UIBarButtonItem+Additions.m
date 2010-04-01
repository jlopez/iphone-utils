//
//  UIBarButtonItem+Additions.m
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UIBarButtonItem+Additions.h"


@implementation UIBarButtonItem (JLAdditions)


+ (id)barButtonWithSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action {
  return [[[self alloc] initWithBarButtonSystemItem:systemItem target:target action:action] autorelease];
}


@end
