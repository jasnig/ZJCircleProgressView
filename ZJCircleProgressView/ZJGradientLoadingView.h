//
//  ZJGradientLoadingView.h
//  ZJCircleProgressView
//
//  Created by ZeroJ on 16/10/17.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJGradientLoadingView : UIView
/** 颜色数组 */
@property (strong, nonatomic) NSArray<UIColor *> *colors;
/** 进度条宽度 默认为10 */
@property (assign, nonatomic) CGFloat lineWidth;
/** 中间空白部分的颜色 默认为 whiteColor */
@property (strong, nonatomic) UIColor *centerColor;
/** 动画时间 默认为1s*/
@property (assign, nonatomic) CGFloat animateDuration;

@end
