//
//  ZJCirclePieProgressView.h
//  ZJCircleProgressView
//
//  Created by ZeroJ on 16/10/17.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJCirclePieProgressView : UIView
/** 设置或者获取当前进度 */
@property (assign, nonatomic) CGFloat progress;
/** 开始的角度 默认为 -90°*/
@property (assign, nonatomic) CGFloat beginAngle;
/** 外边边缘的宽度 设置为<=0 时表示不需要外部边缘 默认为2 */
@property (assign, nonatomic) CGFloat lineWidth;
/** 进度条的颜色 默认为灰色 */
@property (strong, nonatomic) UIColor *progressColor;
/** 外部边缘的颜色 默认为蓝色 */
@property (strong, nonatomic) UIColor *lineColor;
@end
