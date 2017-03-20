//
//  SJStaticTableviewCellViewModel.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SJConst.h"

typedef NS_ENUM(NSInteger, SJStaticCellType) {
    
    //系统风格的各种cell类型，已封装好，可以直接用
    SJStaticCellTypeSystemLogout,                          //退出登录cell（已封装好）
    SJStaticCellTypeSystemAccessoryNone,                   //右侧没有任何控件
    SJStaticCellTypeSystemAccessorySwitch,                 //右侧是开关
    SJStaticCellTypeSystemAccessoryDisclosureIndicator,    //右侧是三角箭头(箭头左侧可以有一个image或者一个label，或者二者都有，根据传入的参数决定)
    
    //需要用户自己添加的自定义cell类型
    SJStaticCellTypeMeAvatar,                              //个人页“我”cell
    
};


typedef void(^SwitchValueChagedBlock)(BOOL isOn);           //switch开关切换时调用的block


@interface SJStaticTableviewCellViewModel : NSObject

@property (nonatomic, assign) SJStaticCellType staticCellType;                  //类型


@property (nonatomic, copy)   NSString *cellID;                                  //cell reuser identifier
@property (nonatomic, assign) NSInteger identifier;                              //区别每个cell，用于点击

// =============== 系统默认cell左侧 =============== //
@property (nonatomic, strong) UIImage  *leftImage;                               //左侧的image，按需传入
@property (nonatomic, assign) CGSize leftImageSize;                              //左侧image的大小，存在默认设置

@property (nonatomic, copy)   NSString *leftTitle;                               //cell主标题，按需传入
@property (nonatomic, strong) UIColor *leftLabelTextColor;                       //当前组cell左侧label里文字的颜色
@property (nonatomic, strong) UIFont *leftLabelTextFont;                         //当前组cell左侧label里文字的字体

@property (nonatomic, assign) CGFloat leftImageAndLabelGap;                      //左侧image和label的距离，存在默认值


// =============== 系统默认cell右侧 =============== //
@property (nonatomic, copy)   NSString *indicatorLeftTitle;                      //右侧箭头左侧的文本，按需传入
@property (nonatomic, strong) UIColor *indicatorLeftLabelTextColor;              //右侧文字的颜色，存在默认设置，也可以自定义
@property (nonatomic, strong) UIFont *indicatorLeftLabelTextFont;                //右侧文字的字体，存在默认设置，也可以自定义
@property (nonatomic, strong) UIImage *indicatorLeftImage;                       //右侧箭头左侧的image，按需传入
@property (nonatomic, assign) CGSize indicatorLeftImageSize;                     //右侧尖头左侧image大小，存在默认设置，也可以自定义

@property (nonatomic, assign, readonly)  BOOL hasIndicatorImageAndLabel;         //右侧尖头左侧的文本和image是否同时存在，只能通过内部计算

@property (nonatomic, assign) CGFloat indicatorLeftImageAndLabelGap;             //右侧尖头左侧image和label的距离，存在默认值
@property (nonatomic, assign) BOOL isImageFirst;                                 //右侧尖头左侧的文本和image同时存在时，是否是image挨着箭头，默认为YES
@property (nonatomic, copy) SwitchValueChagedBlock switchValueDidChangeBlock;    //切换switch开关的时候调用的block


// =============== 长宽数据 =============== //
@property (nonatomic, assign) CGFloat cellHeight;                                //cell高度,默认是44，可以设置
@property (nonatomic, assign) CGSize  leftTitleLabelSize;                        //左侧默认Label的size，传入text以后内部计算
@property (nonatomic, assign) CGSize  indicatorLeftLabelSize;                    //右侧label的size


// =============== 自定义cell的数据放在这里 =============== //
@property (nonatomic, strong) UIImage *avatarImage;
@property (nonatomic, strong) UIImage *codeImage;
@property (nonatomic, copy)   NSString *userName;
@property (nonatomic, copy)   NSString *userID;



@end
