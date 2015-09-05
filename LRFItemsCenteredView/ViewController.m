//
//  ViewController.m
//  LRFItemsCenteredView
//
//  Created by Luckyfy on 15/9/5.
//  Copyright (c) 2015年 LRF. All rights reserved.
//

#import "ViewController.h"
#import "ItemsCenteredView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ItemsCenteredView * itemsCenterView = [[ItemsCenteredView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    [itemsCenterView setBackgroundColor:[UIColor redColor]];
    [itemsCenterView setItems:@[@"123",[UIImage imageNamed:@"spec_division"],@"456",[UIImage imageNamed:@"spec_division"],@"789"] withSpacing:5];
    
    [self.view addSubview:itemsCenterView];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
