//
//  SJStaticTableviewSectionViewModel.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SJStaticTableviewSectionViewModel : NSObject

@property (nonatomic, copy)   NSString *sectionHeaderTitle;         //该section的标题
@property (nonatomic, copy)   NSString *sectionFooterTitle;         //该section的标题
@property (nonatomic, strong) NSMutableArray  *cellViewModelsArray;        //该section的数据源

@property (nonatomic, assign) CGFloat  sectionHeaderHeight;         //header的高度
@property (nonatomic, assign) CGFloat  sectionFooterHeight;         //footer的高度

@property (nonatomic, assign) CGSize leftImageSize;                 //当前组cell左侧image的大小
@property (nonatomic, strong) UIColor *leftLabelTextColor;          //当前组cell左侧label里文字的颜色
@property (nonatomic, strong) UIFont *leftLabelTextFont;            //当前组cell左侧label里文字的字体
@property (nonatomic, assign) CGFloat leftImageAndLabelGap;         //当前组左侧image和label的距离，存在默认值

@property (nonatomic, strong) UIColor *indicatorLeftLabelTextColor; //当前组cell右侧label里文字的颜色
@property (nonatomic, strong) UIFont *indicatorLeftLabelTextFont;   //当前组cell右侧label里文字的字体
@property (nonatomic, assign) CGSize indicatorLeftImageSize;        //当前组cell右侧image的大小
@property (nonatomic, assign) CGFloat indicatorLeftImageAndLabelGap;//当前组cell右侧image和label的距离，存在默认值


- (instancetype)initWithCellViewModelsArray:(NSArray *)cellViewModelsArray;

@end
