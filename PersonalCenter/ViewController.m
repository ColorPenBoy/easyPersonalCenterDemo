//
//  ViewController.m
//  PersonalCenter
//
//  Created by colorPen on 16/1/11.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"
#import "PersonalCenterViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)pushClick:(UIButton *)sender
{
    [self.navigationController pushViewController:[[PersonalCenterViewController alloc]init] animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
