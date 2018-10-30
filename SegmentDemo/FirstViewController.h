//
//  FirstViewController.h
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/25.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
typedef enum{
    EnterType_normal,//默认
    EnterType_topChange,//头部视图位置变化
   
    
}EnterType;

@property (nonatomic,assign)EnterType enterType;

@end
