//
//  ZCCSegmentView.h
//  SegmentViewDemo
//
//  Created by 浪腾 on 2018/7/27.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZCCSegmentViewDelegate<NSObject>

@optional

- (void)zccSegmentViewDidSelect:(UIButton *)button AndIndex:(int)index;
@end
@interface ZCCSegmentView : UIView

@property (nonatomic,strong)UIImageView* lineIV;
@property (nonatomic,strong)NSMutableArray* buttonArr;
@property (nonatomic,assign)int currentIndex;
@property (nonatomic,strong)UIImage* lineImage;
@property (nonatomic,strong)UIFont* norFont;
@property (nonatomic,strong)UIFont* selFont;
@property (nonatomic,strong)UIColor* textColor;
@property (nonatomic,strong)UIColor* selectTextColor;
@property (nonatomic,assign)CGFloat buttonWidth;

@property (nonatomic,weak)id <ZCCSegmentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray*)titleArr TextColor:(UIColor*)textColor SelectTextColor:(UIColor*)selectTextColor NorFont:(UIFont*)norfont SelFont:(UIFont*)selfont LineImage:(UIImage*)lineImage CurrentIndex:(int)current;
- (void)loadSubViews;
@end

