//
//  ZJCircleProgressView.h
//  ZJCircleProgressView
//
//  Created by ZeroJ on 16/10/16.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJCircleProgressView : UIView
/** 头部的image 需要时才设置*/
@property (strong, nonatomic) UIImage *headerImage;
/** 设置或者获取当前进度 */
@property (assign, nonatomic) CGFloat progress;
/** 开始的角度 默认为 -90°*/
@property (assign, nonatomic) CGFloat beginAngle;
/** 进度条的宽度 默认为10 */
@property (assign, nonatomic) CGFloat lineWidth;
/** 进度条的背景颜色 默认为灰色 */
@property (strong, nonatomic) UIColor *trackBackgroundColor;
/** 进度条的颜色 默认为蓝色 */
@property (strong, nonatomic) UIColor *trackColor;
/** 是否是顺时针 默认为YES*/
@property (assign, nonatomic) BOOL clickWise;
/** 进度条两端的样式 默认为kCGLineCapRound*/
@property (assign, nonatomic) CGLineCap lineCap;

/** 显示进度的label, 可设置他的相关属性, hidden, textColor... */
@property (strong, nonatomic, readonly) UILabel *progressLabel;

@end
