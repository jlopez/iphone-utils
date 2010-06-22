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


+ (id)barButtonWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
  return [[[self alloc] initWithImage:image style:style target:target action:action] autorelease];
}


+ (id)barButtonWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
  return [[[self alloc] initWithTitle:title style:style target:target action:action] autorelease];
}


+ (id)flexibleSpaceItem {
  return [self barButtonWithSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}


@end
