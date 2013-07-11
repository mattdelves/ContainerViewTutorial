//
//  RSButtonView.m
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 6/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import "RSButtonView.h"

@interface RSButtonView ()
@property (strong, nonatomic) NSArray *constraints;
@end

@implementation RSButtonView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    if (!_blueButton) {
      _blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      [_blueButton setTitle:@"blue" forState:UIControlStateNormal];
      [self addSubview:_blueButton];
      [_blueButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    if (!_redButton) {
      _redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      [_redButton setTitle:@"red" forState:UIControlStateNormal];
      [self addSubview:_redButton];
      [_redButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    if (!_greenButton) {
      _greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      [_greenButton setTitle:@"green" forState:UIControlStateNormal];
      [self addSubview:_greenButton];
      [_greenButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
  }
  return self;
}


- (void)updateConstraints
{
  if (_constraints) {
    [self removeConstraints:_constraints];
  }
  
  NSMutableArray *newConstraints = [[NSMutableArray alloc] init];
  
  [newConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==10)-[red]-(==20)-[green]-(==20)-[blue]"
                                                                              options:NSLayoutFormatAlignAllCenterX
                                                                              metrics:nil
                                                                                views:@{@"red": _redButton,
                                                                                      @"green": _greenButton,
                                                                                       @"blue": _blueButton}]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:_greenButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:_redButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:_blueButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  _constraints = newConstraints;
  
  [self addConstraints:_constraints];
  
  [super updateConstraints];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return YES;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
