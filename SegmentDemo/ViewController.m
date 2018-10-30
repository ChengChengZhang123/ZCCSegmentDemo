//
//  ViewController.m
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/25.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* testBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    [testBtn setTitle:@"常规模式" forState:UIControlStateNormal];
    testBtn.backgroundColor =[UIColor cyanColor];
    [testBtn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    UIButton* testBtn_1 =[[UIButton alloc]initWithFrame:CGRectMake(0, testBtn.frame.origin.y+testBtn.frame.size.height+30, 250, 50)];
    [testBtn_1 setTitle:@"头部Segment位置不确定" forState:UIControlStateNormal];
    testBtn_1.backgroundColor =[UIColor cyanColor];
    [testBtn_1 addTarget:self action:@selector(test_1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn_1];
    
    
}
- (void)testAction:(UIButton*)button
{
    //常规模式
    FirstViewController* vc =[[FirstViewController alloc]init];
    vc.enterType =EnterType_normal;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)test_1Action:(UIButton*)button
{
    FirstViewController* vc =[[FirstViewController alloc]init];
    vc.enterType =EnterType_topChange;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
