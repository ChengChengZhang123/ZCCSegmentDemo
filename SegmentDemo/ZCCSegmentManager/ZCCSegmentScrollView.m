//
//  ZCCSegmentScrollView.m
//  SegmentDemo
//
//  Created by 浪腾 on 2018/10/26.
//  Copyright © 2018年 浪腾. All rights reserved.
//

#import "ZCCSegmentScrollView.h"


#define Self_W self.frame.size.width
#define Self_H self.frame.size.height

@interface ZCCSegmentScrollView()

@end
@implementation ZCCSegmentScrollView

/*
 1.上部视图 titleArr  selectTitleColor normalTitleColor   selectTitleFontSize normalTitleFontSize selectLineColor
 2.下部视图controllerViews
 
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
             FatherController:(UIViewController*)fatherController
{
    if (self==[super initWithFrame:frame]) {
        
        self.segMentArr =segArr;
        self.selectColor =selectColor;
        self.normalColor =norColor;
        self.selectFont =selectFontSize;
        self.normalFont =norFontSize;
        self.lineImage =lineImage;
        self.currentSelectIndex =currentIndex;
        self.controllers =controllers;
        self.fatherController =fatherController;
        
        [self loadSubViews];
    }
    return self;
}
- (void)loadSubViews
{
    _segmentV =[[ZCCSegmentView alloc]initWithFrame:CGRectMake(0, 0, Self_W, 40) WithTitleArray:self.segMentArr TextColor:self.normalColor SelectTextColor:self.selectColor  NorFont:self.normalFont SelFont:self.selectFont LineImage:self.lineImage CurrentIndex:self.currentSelectIndex];
    _segmentV.delegate =self;
    _segmentV.backgroundColor =[UIColor redColor];
    [self addSubview:_segmentV];
    
    _bottomScrollV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, _segmentV.frame.size.height, Self_W, Self_H-_segmentV.frame.size.height)];
    _bottomScrollV.contentSize =CGSizeMake(Self_W*_segMentArr.count, _bottomScrollV.frame.size.height);
    _bottomScrollV.pagingEnabled =YES;
    _bottomScrollV.delegate =self;
    _bottomScrollV.showsHorizontalScrollIndicator =NO;
    [self addSubview:_bottomScrollV];
    
    
    for (int i =0; i <self.controllers.count; i ++) {
        
        UITableViewController* vc =self.controllers[i];
        [self.fatherController addChildViewController:vc];
    }
    ((UITableViewController*)self.controllers[_currentSelectIndex]).view.frame = CGRectMake(_currentSelectIndex*Self_W, 0, Self_W, Self_H);
    [_bottomScrollV addSubview:[(UITableViewController*)self.controllers[_currentSelectIndex] tableView]];
    
    [_bottomScrollV setContentOffset:CGPointMake(_currentSelectIndex*Self_W, 0) animated:YES];
}
- (void)resetTopSegmetUIWithFrame:(CGRect)frame
{
    _segmentV.frame =frame;
    [_segmentV loadSubViews];
}
#pragma mark -ZCCSegmentViewDelegate
- (void)zccSegmentViewDidSelect:(UIButton *)button AndIndex:(int)index
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.bottomScrollV setContentOffset:CGPointMake(index*Self_W, 0) animated:YES];
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)scrollView.contentOffset.x/Self_W;
    [self buttonSelectMethodWithIndex:page AndButton:self.segmentV.buttonArr[page]];
    
}
- (void)buttonSelectMethodWithIndex:(int)index AndButton:(UIButton*)sender
{
    _currentSelectIndex =index;
    [self reFreshButton];
    [self reFreshiBottomLineViewWithTagIndex:index];
    sender.selected =!sender.selected;
    sender.titleLabel.font =sender.selected==YES?self.selectFont:self.normalFont;
    
}
- (void)reFreshButton
{
    for (UIButton* tempBtn in self.segmentV.buttonArr) {
        tempBtn.selected =NO;
        tempBtn.titleLabel.font =tempBtn.selected==YES?self.selectFont:self.normalFont;
    }
}
- (void)reFreshiBottomLineViewWithTagIndex:(int)index
{
    NSString* title_0 =self.segMentArr[index];
    CGRect frame =[title_0 boundingRectWithSize:CGSizeMake(self.segmentV.buttonWidth, 20) options:NSStringDrawingTruncatesLastVisibleLine |   NSStringDrawingUsesFontLeading    |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.selectFont} context:nil];
    CGFloat lineWidth =frame.size.width;
    [UIView animateWithDuration:0.25 animations:^{
        self.segmentV.lineIV.frame =CGRectMake((index)*self.segmentV.buttonWidth+(self.segmentV.buttonWidth-lineWidth)/2, self.segmentV.frame.size.height-2, lineWidth, 2);
    }];
    
   ((UITableViewController*)self.controllers[index]).view.frame = CGRectMake(index*Self_W, 0, Self_W, Self_H);
    
    [_bottomScrollV addSubview:[(UITableViewController*)self.controllers[index] tableView]];
    
    
}
@end
