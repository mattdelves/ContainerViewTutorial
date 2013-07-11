//
//  UIViewController+RSViewController.m
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 6/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import "UIViewController+RSViewController.h"

#import <objc/runtime.h>

const char *RSViewControllerKey = "RSViewControllerKey";

@implementation UIViewController (RSViewController)

- (RSViewController *)containerViewController
{
  RSViewController *containerViewController = objc_getAssociatedObject(self, &RSViewControllerKey);
  
  if (!containerViewController && [self parentViewController] != nil) {
    containerViewController = [[self parentViewController] containerViewController];
  }
  
  return containerViewController;
}

- (void)setContainerViewController:(RSViewController *)containerViewController
{
  objc_setAssociatedObject(self, &RSViewControllerKey, containerViewController, OBJC_ASSOCIATION_ASSIGN);
}

@end
