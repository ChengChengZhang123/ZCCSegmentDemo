//
//  ZCCSegmentView.m
//  SegmentViewDemo
//
//  Created by 浪腾 on 2018/7/27.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import "ZCCSegmentView.h"
@interface ZCCSegmentView()

@property (nonatomic,strong)NSArray* segMentArray;


@end
@implementation ZCCSegmentView

- (instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray*)titleArr TextColor:(UIColor*)textColor SelectTextColor:(UIColor*)selectTextColor NorFont:(UIFont*)norfont SelFont:(UIFont*)selfont LineImage:(UIImage*)lineImage CurrentIndex:(int)current
{
    if (self==[super initWithFrame:frame]) {
        self.segMentArray =titleArr;
        self.textColor =textColor;
        self.selectTextColor =selectTextColor;
        self.norFont =norfont;
        self.selFont =selfont;
        self.lineImage =lineImage;
        self.currentIndex =current;
        [self loadSubViews];
        
    }
    return self;
}
- (void)loadSubViews
{
    for (UIView* subV  in self.subviews) {
        [subV removeFromSuperview];
    }
    
    _buttonWidth =self.frame.size.width/self.segMentArray.count;
    _buttonArr =[NSMutableArray array];
    for (int i =0; i <self.segMentArray.count; i ++ ) {
        
        UIButton* btn =[[UIButton alloc]initWithFrame:CGRectMake(i*_buttonWidth, 0, _buttonWidth, 36)];
        [btn setTitle:self.segMentArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font =self.norFont;
        [btn setTitleColor:self.textColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectTextColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        if (i ==self.currentIndex) {
            btn.selected =YES;
        }
        btn.tag =100+i;
        btn.titleLabel.font =btn.selected==YES?self.selFont:self.norFont;
        
        
        [_buttonArr addObject:btn];
    }
    _lineIV =[[UIImageView alloc]init];
    _lineIV.image =self.lineImage;
    NSString* title_0 =self.segMentArray[self.currentIndex];
    CGRect frame =[title_0 boundingRectWithSize:CGSizeMake(_buttonWidth, 20) options:NSStringDrawingTruncatesLastVisibleLine |   NSStringDrawingUsesFontLeading    |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil];
    CGFloat lineWidth =frame.size.width;
    _lineIV.frame =CGRectMake(self.currentIndex*_buttonWidth+(_buttonWidth-lineWidth)/2, self.frame.size.height-2, lineWidth, 2);
    [self addSubview:_lineIV];
}
- (void)selectAction:(UIButton*)sender
{
    if (self.delegate) {
        [self.delegate zccSegmentViewDidSelect:sender AndIndex:(int)sender.tag-100];
    }
}
@end
