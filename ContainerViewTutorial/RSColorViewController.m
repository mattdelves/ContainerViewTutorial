//
//  RSColorViewController.m
//  ContainerViewTutorial
//
//  Created by Matthew Delves on 5/07/13.
//  Copyright (c) 2013 Reformed Software. All rights reserved.
//

#import "RSColorViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RSColorViewController ()

@end

@implementation RSColorViewController

- (id)initWithColor:(UIColor *)color
{
  self = [super initWithNibName:nil bundle:nil];
  if (self) {
    [self.view.layer setBackgroundColor:color.CGColor];
  }
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
