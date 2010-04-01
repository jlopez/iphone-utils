//
//  UITableView+Additions.m
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UITableView+Additions.h"


@implementation UITableView (JLAdditions)


- (UITableViewCell *)dequeueCellWithStyle:(UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier {
  UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:reuseIdentifier];
  if (!cell)
    cell = [[[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:reuseIdentifier] autorelease];
  return cell;
}


- (id)dequeueReusableCellOfClass:(Class)cls {
  NSString *cellIdentifier = NSStringFromClass(cls);
  id cell = (id)[self dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell)
    cell = [[[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
  return cell;
}


- (id)placeholderCellWithText:(NSString *)text {
  UITableViewCell *cell = [self dequeueCellWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PlaceholderCell"];
  cell.textLabel.text = text;
  cell.textLabel.textAlignment = UITextAlignmentCenter;
  cell.textLabel.textColor = [UIColor lightGrayColor];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}


@end
