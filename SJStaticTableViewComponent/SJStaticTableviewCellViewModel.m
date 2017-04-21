//
//  SJStaticTableviewCellViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewCellViewModel.h"


@interface SJStaticTableviewCellViewModel()

@property (nonatomic, assign, readwrite) BOOL hasIndicatorImageAndLabel;                   //右侧尖头左侧的文本和image是否同时存在
@property (nonatomic, assign, readwrite) CGFloat indicatorLeftImgWidth;                    //右侧图片宽度
@property (nonatomic, assign, readwrite) CGFloat indicatorLeftImgHeight;                   //右侧图片高度

@end


@implementation SJStaticTableviewCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {        
        _cellHeight = 44;
        _cellID = @"defaultCell";
        _staticCellType = SJStaticCellTypeSystemAccessoryDisclosureIndicator;//默认是存在三角箭头的cell
        _isImageFirst = YES;
        
        //都是默认配置
        _leftLabelTextFont = SJLeftTitleTextFont;
        _leftLabelTextColor = SJLeftTitleTextColor;
        _leftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _leftImageAndLabelGap = SJLeftMiddleGap;
        _indicatorLeftLabelTextFont = SJIndicatorLeftTitleTextFont;
        _indicatorLeftLabelTextColor = SJIndicatorLeftTitleTextColor;
        _indicatorLeftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _indicatorLeftImageAndLabelGap = SJRightMiddleGap;
    }
    return self;
}


- (void)setLeftTitle:(NSString *)leftTitle
{
    if (_leftTitle != leftTitle) {
        
        _leftTitle = leftTitle;
        _leftTitleLabelSize = [self sizeForTitle:leftTitle withFont:_leftLabelTextFont];
        
        //very long title
        if (_leftTitleLabelSize.width > SJTitleWidthLimit) {
            CGSize size = _leftTitleLabelSize;
            size.width = SJTitleWidthLimit;
            _leftTitleLabelSize = size;
        }
        
    }
}

- (void)setLeftLabelTextFont:(UIFont *)leftLabelTextFont
{
    if (_leftLabelTextFont != leftLabelTextFont) {
        
        if (![self font1:_leftLabelTextFont hasSameFontSizeOfFont2:leftLabelTextFont]) {
            //如果新的宽度大于原来的宽度，需要重新设置，否则不需要
            _leftLabelTextFont = leftLabelTextFont;
            CGSize size = [self sizeForTitle:self.leftTitle withFont:leftLabelTextFont];
            if (size.width > self.leftTitleLabelSize.width) {
                self.leftTitleLabelSize = size;
            }
        }
    }
}

- (void)setIndicatorLeftTitle:(NSString *)indicatorLeftTitle
{
    if (_indicatorLeftTitle != indicatorLeftTitle) {
        
        _indicatorLeftTitle = indicatorLeftTitle;
        _indicatorLeftLabelSize = [self sizeForTitle:_indicatorLeftTitle withFont:_indicatorLeftLabelTextFont];
        
        //very long title
        if (_indicatorLeftLabelSize.width > SJTitleWidthLimit) {
            CGSize size = _indicatorLeftLabelSize;
            size.width = SJTitleWidthLimit;
            _indicatorLeftLabelSize = size;
        }
        
        if (_indicatorLeftImage) {
            _hasIndicatorImageAndLabel = YES;
        }
    }
}


- (void)setIndicatorLeftImage:(UIImage *)indicatorLeftImage
{
    if (_indicatorLeftImage != indicatorLeftImage) {
        
        _indicatorLeftImage = indicatorLeftImage;
        
        CGFloat limitHeight = self.cellHeight - 2*SJTopGap;
        CGFloat indicatorLeftImageWidth = 0.0f;
        CGFloat indicatorLeftImageHeight = 0.0f;
        
        if (_indicatorLeftImage.size.height < limitHeight) {
            indicatorLeftImageHeight = _indicatorLeftImage.size.height;
            indicatorLeftImageWidth = _indicatorLeftImage.size.width;
            
        }else{
            // image with very large height
            indicatorLeftImageHeight = limitHeight;
            indicatorLeftImageWidth = (_indicatorLeftImage.size.width / _indicatorLeftImage.size.height) * indicatorLeftImageHeight ;
        }
        
        _indicatorLeftImageSize = CGSizeMake(indicatorLeftImageWidth, indicatorLeftImageHeight);
        
        if (_indicatorLeftTitle) {
            _hasIndicatorImageAndLabel = YES;
        }
        
    }
}


- (void)setIndicatorLeftLabelTextFont:(UIFont *)indicatorLeftLabelTextFont
{
    if (_indicatorLeftLabelTextFont != indicatorLeftLabelTextFont) {
        
        if (![self font1:_indicatorLeftLabelTextFont hasSameFontSizeOfFont2:indicatorLeftLabelTextFont]) {
            
            //如果新的宽度大于原来的宽度，需要重新设置，否则不需要
            _indicatorLeftLabelTextFont = indicatorLeftLabelTextFont;
            CGSize size = [self sizeForTitle:self.indicatorLeftTitle withFont:indicatorLeftLabelTextFont];
            if (size.width > self.indicatorLeftLabelSize.width) {
                self.indicatorLeftLabelSize = size;
            }
        }
        
    }
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

@end

