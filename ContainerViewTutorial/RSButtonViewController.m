//
//  RSButtonViewController.m
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 6/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import "RSButtonViewController.h"
#import "RSButtonView.h"
#import "UIViewController+RSViewController.h"

@interface RSButtonViewController ()
@property (strong, nonatomic) NSArray *constraints;
@end

@implementation RSButtonViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  self.view = [[RSButtonView alloc] initWithFrame:self.view.frame];
  RSButtonView *theView = (RSButtonView *)self.view;
  
  // Setup the targets
  [theView.blueButton addTarget:self action:@selector(didSelectBlue) forControlEvents:UIControlEventTouchUpInside];
  [theView.redButton addTarget:self action:@selector(didSelectRed) forControlEvents:UIControlEventTouchUpInside];
  [theView.greenButton addTarget:self action:@selector(didSelectGreen) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Update view constraints
- (void)updateViewConstraints
{
  if (_constraints) {
    [self.view removeConstraints:_constraints];
  }
  
  NSMutableArray *newConstraints = [[NSMutableArray alloc] init];
  RSButtonView *theView = (RSButtonView *)self.view;
  
  [newConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==50)-[red]-(==20)-[green]-(==20)-[blue]"
                                                                              options:NSLayoutFormatAlignAllCenterX
                                                                              metrics:nil
                                                                                views:@{@"red": theView.redButton,
                                       @"green": theView.greenButton,
                                       @"blue": theView.blueButton}]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:theView.greenButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:theView.redButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  [newConstraints addObject:[NSLayoutConstraint constraintWithItem:theView.blueButton
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
  _constraints = newConstraints;
  
  [self.view addConstraints:_constraints];

  [super updateViewConstraints];
}
*/
#pragma mark - Button Selectors
- (void)didSelectRed
{
  [self.containerViewController switchToRedColorController];
}

- (void)didSelectGreen
{
  [self.containerViewController switchToGreenColorController];
}

- (void)didSelectBlue
{
  [self.containerViewController switchToBlueColorController];
}

@end
