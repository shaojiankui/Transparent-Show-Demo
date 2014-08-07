//
//  ViewController.m
//  Transparent-Show-Demo
//
//  Created by Jakey on 14-8-7.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "ViewController.h"
#import "TransparentView.h"
@interface ViewController ()

@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
    TransparentView *transparentView = [[TransparentView alloc] initWithFrame: CGRectMake(0, 80, 1024, 629)];
    transparentView.backgroundImage = [UIImage imageNamed: @"background.png"];
    transparentView.transparentImage = [UIImage imageNamed: @"corver.png"];
    transparentView.watchButtonImage = [UIImage imageNamed:@"button.png"];
    transparentView.watchHeight = 80;

    [self.view addSubview: transparentView];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
