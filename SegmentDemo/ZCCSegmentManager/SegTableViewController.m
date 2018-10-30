//
//  SegTableViewController.m
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/25.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import "SegTableViewController.h"

@interface SegTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SegTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource =self;
    self.tableView.delegate =self;
    
    
    NSLog(@"显示此时Title==%@",self.titleName);
    //可以在这里加载数据  保证只有在显示此页面的时候加载数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text =[NSString stringWithFormat:@"%@--%ld",self.titleName,(long)indexPath.row];
    
    return cell;
}






@end
