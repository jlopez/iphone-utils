//
//  JLCellEditor.m
//  LanguageBuddy
//
//  Created by jlopez on 7/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JLCellEditor.h"


@interface JLCellEditor () <UITextViewDelegate>

@end


@implementation JLCellEditor

@synthesize delegate;
@synthesize tableView;


- (void)dealloc {
  [textView release];
  [super dealloc];
}


- (void)editCellAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  UILabel *label = cell.detailTextLabel;
  
  // If already editing this cell, do nothing
  if ([textView superview] == [label superview])
    return;
  
  [self endCellEditing];
  if (textView == nil) {
    textView = [[UITextView alloc] initWithFrame:CGRectZero];
    textView.delegate = self;
  }
  CGRect leftLabelFrame = cell.textLabel.frame;
  CGRect frame = label.frame;
  CGFloat x = leftLabelFrame.origin.x + leftLabelFrame.size.width;
  CGFloat scale = [[UIScreen mainScreen] scale];
  CGFloat dy = floorf(8.5 * scale) / scale;
  textView.frame = CGRectMake(x, frame.origin.y - dy,
                              frame.origin.x - 8 + frame.size.width + 16 - x,
                              frame.size.height + 16);
  textView.text = label.text;
  textView.textColor = label.textColor;
  textView.font = label.font;
  textView.contentInset = UIEdgeInsetsZero;
  textView.textAlignment = UITextAlignmentRight;
  textView.autocorrectionType = UITextAutocorrectionTypeNo;
  int ix = indexPath.section * 10 + indexPath.row;
  textView.keyboardType = ix == 1 ? UIKeyboardTypeNumbersAndPunctuation : UIKeyboardTypeURL;
  [label.superview insertSubview:textView aboveSubview:label];
  label.hidden = YES;
  [textView becomeFirstResponder];
}


- (void)endCellEditing {
  // If not editing do nothing
  if (![textView isFirstResponder])
    return;
  
  [textView resignFirstResponder];
}


- (void)textViewDidEndEditing:(UITextView *)textView_ {
  // Update settings
  NSLog(@"[%@ %@]", [self class], NSStringFromSelector(_cmd));
  CGPoint pt = [tableView convertPoint:CGPointZero fromView:textView_];
  NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:pt];
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  cell.detailTextLabel.text = textView_.text;
  cell.detailTextLabel.hidden = NO;
  [textView_ removeFromSuperview];

  if ([delegate respondsToSelector:@selector(tableViewCellDidEndEditingWithText:indexPath:)])
    [delegate tableViewCellDidEndEditingWithText:textView_.text indexPath:indexPath];

  [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


- (BOOL)textView:(UITextView *)textView_ shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  // If <enter> was pressed, leave editing mode
  if ([text isEqualToString:@"\n"]) {
    [self endCellEditing];
    return NO;
  }
  
  // Disallow insertion of control characters (via paste, usually)
  NSRange rng = [text rangeOfCharacterFromSet:[NSCharacterSet controlCharacterSet]];
  if (rng.location != NSNotFound)
    return NO;
  
  // Prevent text from groing past available textView width
  NSString *modifiedString = [textView_.text stringByReplacingCharactersInRange:range withString:text];
  CGSize sz = [modifiedString sizeWithFont:textView_.font];
  if (sz.width >= textView_.frame.size.width - 16)
    return NO;
  
  // All other edits are valid
  NSLog(@"[%@ %@] %@ %@", [self class], NSStringFromSelector(_cmd), NSStringFromRange(range), text);
  return YES;
}


@end
