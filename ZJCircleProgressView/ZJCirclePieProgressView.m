//
//  ZJCirclePieProgressView.m
//  ZJCircleProgressView
//
//  Created by ZeroJ on 16/10/17.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJCirclePieProgressView.h"

static CGFloat radiusFromAngle(CGFloat angle) {
    return (angle * M_PI)/180;
}

@implementation ZJCirclePieProgressView

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit {
    _progressColor = [UIColor redColor];
    _lineColor = [UIColor lightGrayColor];
    _beginAngle = radiusFromAngle(-90);
    _lineWidth = 2.f;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    
    // 获取当前上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGFloat slideLength = self.bounds.size.width;
    CGFloat centerX = slideLength/2;
    CGFloat centerY = slideLength/2;

    if (_lineWidth > 0) { // 需要绘制边缘
        // 添加边缘轨道
        CGContextAddArc(currentContext, centerX, centerY, (slideLength-_lineWidth)/2, 0, 2*M_PI, 0);
        // 设置轨道宽度
        CGContextSetLineWidth(currentContext, _lineWidth);
        // 设置颜色
        [self.lineColor setStroke];
        // 绘制轨道
        CGContextStrokePath(currentContext);
        
    }
    CGFloat deltaAngle = _progress*2*M_PI;
    
    // 需要移动当前点到圆心
    CGContextMoveToPoint(currentContext, centerX, centerY);
    CGContextAddArc(currentContext, centerX, centerY, (slideLength-_lineWidth)/2-_lineWidth, self.beginAngle, self.beginAngle+deltaAngle, 0);
    
    // fill模式来绘制封闭的扇形 不是stroke
    [self.progressColor setFill];
    CGContextFillPath(currentContext);
    
}


- (void)setProgress:(CGFloat)progress {
    
    if (progress > 1 || progress < 0) return;
    _progress = progress;
    // 标记为需要重新绘制, 将会在下一个绘制循环中, 调用drawRect:方法重新绘制
    [self setNeedsDisplay];
}

@end
