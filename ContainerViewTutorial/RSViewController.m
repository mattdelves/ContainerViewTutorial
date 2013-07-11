//
//  RSViewController.m
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 11/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import "RSViewController.h"
#import "RSColorViewController.h"
#import "RSButtonViewController.h"
#import "UIViewController+RSViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RSView : UIView
@end

@implementation RSView
+ (BOOL)requiresConstraintBasedLayout
{
  return YES;
}
@end

@interface RSViewController ()
@property (strong, nonatomic) IBOutlet RSColorViewController *redViewController;
@property (strong, nonatomic) IBOutlet RSColorViewController *greenViewController;
@property (strong, nonatomic) IBOutlet RSColorViewController *blueViewController;
@property (retain, nonatomic) IBOutlet RSColorViewController *currentColorViewController;
@property (strong, nonatomic) IBOutlet UIViewController *buttonViewController;
@property (strong, nonatomic) NSArray *constraints;
@end

@implementation RSViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  CGRect r = [[UIScreen mainScreen] bounds];
  self.view = [[RSView alloc] initWithFrame:r];
  CGRect topViewBounds = r; //CGRectMake(0, 0, r.size.width, 100);
  CGRect bottomViewBounds = r; //CGRectMake(0, 100, r.size.width, r.size.height - 100);
  
  if (!_redViewController) {
    _redViewController = [[RSColorViewController alloc] initWithColor:[UIColor redColor]];
    [_redViewController.view setBounds:topViewBounds];
    [_redViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  
  if (!_greenViewController) {
    _greenViewController = [[RSColorViewController alloc] initWithColor:[UIColor greenColor]];
    [_greenViewController.view setBounds:topViewBounds];
    [_greenViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  
  if (!_blueViewController) {
    _blueViewController = [[RSColorViewController alloc] initWithColor:[UIColor blueColor]];
    [_blueViewController.view setBounds:topViewBounds];
    [_blueViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
  }
  
  if (!_buttonViewController) {
    _buttonViewController = [[RSButtonViewController alloc] init];
    [_buttonViewController.view setBounds:bottomViewBounds];
    [_buttonViewController.view setFrame:bottomViewBounds];
    [_buttonViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_buttonViewController.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
  }
  
  [_buttonViewController setContainerViewController:self];
  
  // Set the child view controllers
  // Assume red is the first color
  [self addChildViewController:_redViewController];
  [self.view addSubview:_redViewController.view];
  [_redViewController didMoveToParentViewController:self];
  _currentColorViewController = _redViewController;
  
  // Button view controller
  [self addChildViewController:_buttonViewController];
  [self.view addSubview:_buttonViewController.view];
  [_buttonViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints
{
  if (_constraints) {
    [self.view removeConstraints:self.view.constraints];
  }
  
  NSMutableArray *newConstraints = [[NSMutableArray alloc] init];
  [newConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[color(==colorHeight)][button(==buttonHeight)]|"
                                                                              options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight
                                                                              metrics:@{@"colorHeight": @(100),
                                       @"buttonHeight": @(self.view.bounds.size.height - 100)}
                                                                                views:@{@"color": _currentColorViewController.view,
                                       @"button": _buttonViewController.view}]];
  [newConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[color]|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:@{@"color": _currentColorViewController.view}]];
  _constraints = newConstraints;
  
  [self.view addConstraints:_constraints];
  
  [super updateViewConstraints];
}

#pragma mark -

- (void)switchToBlueColorController
{
  if (_currentColorViewController == _blueViewController) {
    return;
  }
  
  [_currentColorViewController willMoveToParentViewController:nil];
  [self addChildViewController:_blueViewController];
  _blueViewController.view.frame = _currentColorViewController.view.frame;
  
  [self transitionFromViewController:_currentColorViewController
                    toViewController:_blueViewController
                            duration:0.5f
                             options:UIViewAnimationOptionTransitionFlipFromLeft
                          animations:nil
                          completion:^(BOOL finished){
                            [_blueViewController didMoveToParentViewController:self];
                            [_currentColorViewController.view removeFromSuperview];
                            [_currentColorViewController removeFromParentViewController];
                            _currentColorViewController = _blueViewController;
                            [self.view setNeedsUpdateConstraints];
                          }];
}

- (void)switchToGreenColorController
{
  if (_currentColorViewController == _greenViewController) {
    return;
  }
  
  [_currentColorViewController willMoveToParentViewController:nil];
  [self addChildViewController:_greenViewController];
  _greenViewController.view.frame = _currentColorViewController.view.frame;
  
  [self transitionFromViewController:_currentColorViewController
                    toViewController:_greenViewController
                            duration:0.5f
                             options:UIViewAnimationOptionTransitionFlipFromRight
                          animations:nil
                          completion:^(BOOL finished){
                            [_greenViewController didMoveToParentViewController:self];
                            [_currentColorViewController removeFromParentViewController];
                            _currentColorViewController = _greenViewController;
                            [self.view setNeedsUpdateConstraints];
                          }];
}

- (void)switchToRedColorController
{
  if (_currentColorViewController == _redViewController) {
    return;
  }
  
  [_currentColorViewController willMoveToParentViewController:nil];
  [self addChildViewController:_redViewController];
  _redViewController.view.frame = _currentColorViewController.view.frame;
  
  [self transitionFromViewController:_currentColorViewController
                    toViewController:_redViewController
                            duration:0.5f
                             options:UIViewAnimationOptionTransitionCrossDissolve
                          animations:nil
                          completion:^(BOOL finished){
                            [_redViewController didMoveToParentViewController:self];
                            [_currentColorViewController removeFromParentViewController];
                            _currentColorViewController = _redViewController;
                            [self.view setNeedsUpdateConstraints];
                          }];
}


@end
