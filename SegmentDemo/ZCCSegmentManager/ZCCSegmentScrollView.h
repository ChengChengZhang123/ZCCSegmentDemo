//
//  ZCCSegmentScrollView.h
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/26.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCSegmentView.h"
@interface ZCCSegmentScrollView : UIView<UIScrollViewDelegate,ZCCSegmentViewDelegate>

@property (nonatomic,strong)NSArray <NSString*>* segMentArr;
@property (nonatomic,strong)UIColor* selectColor;
@property (nonatomic,strong)UIColor* normalColor;
@property (nonatomic,strong)UIFont* selectFont;
@property (nonatomic,strong)UIFont* normalFont;
@property (nonatomic,strong)UIImage* lineImage;
@property (nonatomic,assign)int currentSelectIndex;
@property (nonatomic,strong)NSArray* controllers;
@property (nonatomic,strong)UIViewController* fatherController;

@property (nonatomic,strong)ZCCSegmentView* segmentV;
@property (nonatomic,strong)UIScrollView* bottomScrollV;
/**
 * 创建主视图
 * segArr：segment数组
 * selectColor：选中的字体颜色
 * norColor：默认字体颜色
 * selectFontSize：选中字体大小
 * norFontSize：默认字体大小
 * lineImage：底部横条Image
 * currentIndex：当前选中Index
 * controllers：所有controller数组（UITableViewController类型）
 * fatherController：父控制器
 */
- (instancetype)initWithFrame:(CGRect)frame
                  SegTitleArr:(NSArray<NSString*>*)segArr
             SelectTitleColor:(UIColor*)selectColor
             NormalTitleColor:(UIColor*)norColor
          SelectTitleFontSize:(UIFont*)selectFontSize
          NormalTitleFontSize:(UIFont*)norFontSize
              SelectLineImage:(UIImage*)lineImage
           CurrentSelectIndex:(int)currentIndex
                  Controllers:(NSArray*)controllers
             FatherController:(UIViewController*)fatherController;
- (void)resetTopSegmetUIWithFrame:(CGRect)frame;

@end
