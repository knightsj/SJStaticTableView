//
//  SJStaticTableviewSectionViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewSectionViewModel.h"
#import "SJConst.h"
#import "SJStaticTableviewCellViewModel.h"

@implementation SJStaticTableviewSectionViewModel

- (instancetype)initWithCellViewModelsArray:(NSArray *)cellViewModelsArray
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 10;
        _sectionFooterHeight = 10;
        _leftLabelTextFont = SJLeftTitleTextFont;
        _leftLabelTextColor = SJLeftTitleTextColor;
        _leftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _leftImageAndLabelGap = SJLeftMiddleGap;
        _indicatorLeftLabelTextFont = SJIndicatorLeftTitleTextFont;
        _indicatorLeftLabelTextColor = SJIndicatorLeftTitleTextColor;
        _indicatorLeftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _indicatorLeftImageAndLabelGap = SJRightMiddleGap;
        _cellViewModelsArray = [cellViewModelsArray mutableCopy];
    }
    return self;
}

- (void)setLeftLabelTextFont:(UIFont *)leftLabelTextFont
{
    if (_leftLabelTextFont != leftLabelTextFont) {
        
        if (![self font1:_leftLabelTextFont hasSameFontSizeOfFont2:leftLabelTextFont]) {
            
            _leftLabelTextFont = leftLabelTextFont;
            
            //如果新的宽度大于原来的宽度，需要重新设置，否则不需要
            [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel * viewModel, NSUInteger idx, BOOL * _Nonnull stop) {
                viewModel.leftLabelTextFont = _leftLabelTextFont;
                CGSize size = [self sizeForTitle:viewModel.leftTitle withFont:_leftLabelTextFont];
                if (size.width > viewModel.leftTitleLabelSize.width) {
                    viewModel.leftTitleLabelSize = size;
                }
            }];
            
        }
    }
}

- (void)setLeftLabelTextColor:(UIColor *)leftLabelTextColor
{
    if (![self color1:_leftLabelTextColor hasTheSameRGBAOfColor2:leftLabelTextColor]) {
         _leftLabelTextColor = leftLabelTextColor;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setLeftLabelTextColor:) withObject:_leftLabelTextColor];
    }
}

- (void)setLeftImageSize:(CGSize)leftImageSize
{
    SJStaticTableviewCellViewModel *viewMoel = _cellViewModelsArray.firstObject;
    
    CGFloat cellHeight = viewMoel.cellHeight;
    if ( (!CGSizeEqualToSize(_leftImageSize, leftImageSize)) && (leftImageSize.height < cellHeight)) {
        _leftImageSize = leftImageSize;
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel *viewModel, NSUInteger idx, BOOL * _Nonnull stop)
        {
            viewMoel.leftImageSize = _leftImageSize;
        }];
    }
}

- (void)setLeftImageAndLabelGap:(CGFloat)leftImageAndLabelGap
{
    if (_leftImageAndLabelGap != leftImageAndLabelGap) {
        _leftImageAndLabelGap = leftImageAndLabelGap;
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel * viewModel, NSUInteger idx, BOOL * _Nonnull stop) {
            viewModel.leftImageAndLabelGap = _leftImageAndLabelGap;
        }];
    }
}

- (void)setIndicatorLeftLabelTextFont:(UIFont *)indicatorLeftLabelTextFont
{
    if (_indicatorLeftLabelTextFont != indicatorLeftLabelTextFont) {
        
        if (![self font1:_indicatorLeftLabelTextFont hasSameFontSizeOfFont2:indicatorLeftLabelTextFont]) {
            _indicatorLeftLabelTextFont = indicatorLeftLabelTextFont;
            
            //如果新的宽度大于原来的宽度，需要重新设置，否则不需要
            [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel * viewModel, NSUInteger idx, BOOL * _Nonnull stop) {
                viewModel.indicatorLeftLabelTextFont = _indicatorLeftLabelTextFont;
                CGSize size = [self sizeForTitle:viewModel.indicatorLeftTitle withFont:_indicatorLeftLabelTextFont];
                if (size.width > viewModel.indicatorLeftLabelSize.width) {
                    viewModel.indicatorLeftLabelSize = size;
                }
            }];
        }
        
    }
}

- (void)setIndicatorLeftLabelTextColor:(UIColor *)indicatorLeftLabelTextColor
{
    if (![self color1:_indicatorLeftLabelTextColor hasTheSameRGBAOfColor2:indicatorLeftLabelTextColor]) {
        _indicatorLeftLabelTextColor = indicatorLeftLabelTextColor;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setIndicatorLeftLabelTextColor:) withObject:_indicatorLeftLabelTextColor];
    }
}


- (void)setIndicatorLeftImageSize:(CGSize)indicatorLeftImageSize
{
    SJStaticTableviewCellViewModel *viewMoel = _cellViewModelsArray.firstObject;
    CGFloat cellHeight = viewMoel.cellHeight;
    
    if ( (!CGSizeEqualToSize(_indicatorLeftImageSize, indicatorLeftImageSize)) && (indicatorLeftImageSize.height < cellHeight)) {
        
        _indicatorLeftImageSize = indicatorLeftImageSize;
        
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel *viewModel, NSUInteger idx, BOOL * _Nonnull stop)
         {
             viewMoel.indicatorLeftImageSize = _indicatorLeftImageSize;
         }];
    }
    
}

- (void)setIndicatorLeftImageAndLabelGap:(CGFloat)indicatorLeftImageAndLabelGap
{
    if (_indicatorLeftImageAndLabelGap != indicatorLeftImageAndLabelGap) {
        _indicatorLeftImageAndLabelGap = indicatorLeftImageAndLabelGap;
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel * viewModel, NSUInteger idx, BOOL * _Nonnull stop) {
            viewModel.indicatorLeftImageAndLabelGap = _indicatorLeftImageAndLabelGap;
        }];
    }
}

//判断字体大小是否一致
- (BOOL)font1:(UIFont *)font1 hasSameFontSizeOfFont2:(UIFont *)font2
{
    BOOL res = NO;
    UIFontDescriptor *font1Des = font1.fontDescriptor;
    NSNumber *font1Number = [font1Des objectForKey:@"NSFontSizeAttribute"];
    
    UIFontDescriptor *font2Des = font2.fontDescriptor;
    NSNumber *font2Number = [font2Des objectForKey:@"NSFontSizeAttribute"];
    
    if ([font1Number integerValue] == [font2Number integerValue]) {
        res = YES;
    }
    
    return res;
}

//判断颜色是否相等
- (BOOL)color1:(UIColor *)color1 hasTheSameRGBAOfColor2:(UIColor *)color2
{
    BOOL res = NO;
    
    CGFloat red1,red2,green1,green2,blue1,blue2,alpha1,alpha2;
    
    //取出color1的背景颜色的RGBA值
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    
    //取出color2的背景颜色的RGBA值
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    
    if ((red1 == red2)&&(green1 == green2)&&(blue1 == blue2)&&(alpha1 == alpha2)) {
        res = YES;
    }
    
    return res;
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

@end
