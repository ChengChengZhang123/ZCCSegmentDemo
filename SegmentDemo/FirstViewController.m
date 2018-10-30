//
//  FirstViewController.m
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/25.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import "FirstViewController.h"
#import "SegTableViewController.h"
#import "ZCCSegmentScrollView.h"

#define K_SelfW self.view.frame.size.width
#define K_SelfH self.view.frame.size.height

@interface FirstViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)NSArray* titleArr;
@property (nonatomic,strong)NSMutableArray* controllers;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //segment数组
    _titleArr =@[@"推荐",@"附近",@"视频",@"娱乐"];
   //与segment对应的controller数组
    _controllers =[NSMutableArray array];
    for (int i =0; i <_titleArr.count; i ++) {
        
        SegTableViewController* segVc =[[SegTableViewController alloc]init];
        segVc.titleName =_titleArr[i];
        [_controllers addObject:segVc];
    }

    ZCCSegmentScrollView* mainV =[[ZCCSegmentScrollView alloc] initWithFrame:CGRectMake(0, 88, K_SelfW, K_SelfH-88) SegTitleArr:_titleArr SelectTitleColor:[UIColor blackColor] NormalTitleColor:[UIColor whiteColor] SelectTitleFontSize:[UIFont systemFontOfSize:17] NormalTitleFontSize:[UIFont systemFontOfSize:15] SelectLineImage:[UIImage imageNamed:@"progress_Line"] CurrentSelectIndex:0 Controllers:_controllers FatherController:self];
    [self.view addSubview:mainV];
    
    switch (self.enterType) {
        case EnterType_normal:
        {
            
        }
            break;
        case EnterType_topChange:
        {
            [mainV resetTopSegmetUIWithFrame:CGRectMake(50, 0, K_SelfW-50, 40)];
        }
            break;
            
        default:
            break;
    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
