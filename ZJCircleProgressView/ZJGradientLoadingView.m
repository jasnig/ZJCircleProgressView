//
//  ZJGradientLoadingView.m
//  ZJCircleProgressView
//
//  Created by ZeroJ on 16/10/17.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJGradientLoadingView.h"


@interface ZJGradientLoadingView ()
@property (strong, nonatomic) CAGradientLayer *upGradientLayer;
@property (strong, nonatomic) CAGradientLayer *downGradientLayer;

@property (strong, nonatomic) CAShapeLayer *centerLayer;


@end

@implementation ZJGradientLoadingView

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
    _lineWidth = 10.f;
    _centerColor = [UIColor whiteColor];
    _animateDuration = 1.f;
    [self.layer addSublayer:self.upGradientLayer];
    [self.layer addSublayer:self.downGradientLayer];
    // 最后添加... 覆盖在上面的小圆
    [self.layer addSublayer:self.centerLayer];
    [self addAnimations];
}


- (void)addAnimations {
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = @0.0;
    rotation.toValue = @(2 * M_PI);
    rotation.duration = _animateDuration;
    rotation.repeatCount = MAXFLOAT;
    
    [self.layer addAnimation:rotation forKey:nil];
}

- (void)setColors:(NSArray<UIColor *> *)colors {

    NSAssert(colors.count > 1, @"设置的颜色必须要大于1个");
    if (!colors || colors.count <= 1) return;
    
    NSMutableArray *upColorsArray = [NSMutableArray arrayWithCapacity:colors.count];
    NSMutableArray *downColorsArray = [NSMutableArray arrayWithCapacity:colors.count];

    // 保证 设置5个颜色以下的时候 看上去是平分的圆的效果
    if (colors.count < 5) {
        if (colors.count == 2) {
            [upColorsArray addObject: (id)(colors[0].CGColor)];
            [upColorsArray addObject: (id)(colors[1].CGColor)];
            
            [downColorsArray addObject: (id)(colors[1].CGColor)];
            [downColorsArray addObject: (id)(colors[0].CGColor)];
        }
        else if (colors.count == 3) {
            [upColorsArray addObject: (id)(colors[0].CGColor)];
            [upColorsArray addObject: (id)(colors[1].CGColor)];
            
            [downColorsArray addObject: (id)(colors[1].CGColor)];
            [downColorsArray addObject: (id)(colors[2].CGColor)];
            self.upGradientLayer.locations = @[@0.75, @1.0];
            self.downGradientLayer.locations = @[@0.25, @1.0];
        }
        else if (colors.count == 4) {
            int index = 0;
            for (UIColor *color in colors) {
                if (index < colors.count/2) {
                    [upColorsArray addObject:(id)(color.CGColor)];
                }
                else {
                    [downColorsArray addObject:(id)(color.CGColor)];
                }
                index++;
            }
 
        }
    }
    else {
        int index = 0;
        for (UIColor *color in colors) {
            if (index < colors.count/2) {
                [upColorsArray addObject:(id)(color.CGColor)];
            }
            else {
                [downColorsArray addObject:(id)(color.CGColor)];
            }
            index++;
        }
    }

    self.upGradientLayer.colors = upColorsArray;
    self.downGradientLayer.colors = downColorsArray;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = width/2;


    // 上半部分
    self.upGradientLayer.frame = CGRectMake(0, 0, width, height/2);
    // 下半部分
    self.downGradientLayer.frame = CGRectMake(0, height/2, width, height/2);

    //中心圆 白色
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_lineWidth, _lineWidth, width-2*_lineWidth, height-2*_lineWidth)];
    
    self.centerLayer.path = path.CGPath;


}

- (CAShapeLayer *)centerLayer {
    if (!_centerLayer) {
        CAShapeLayer *centerLayer = [CAShapeLayer layer];
        centerLayer.fillColor = self.centerColor.CGColor;
        _centerLayer = centerLayer;
    }
    return _centerLayer;
}


- (CAGradientLayer *)upGradientLayer {
    if (!_upGradientLayer) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
        _upGradientLayer = gradientLayer;
    }
    return _upGradientLayer;
}

- (CAGradientLayer *)downGradientLayer {
    if (!_downGradientLayer) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.startPoint = CGPointMake(1, 0);
        gradientLayer.endPoint = CGPointMake(0, 0);
        _downGradientLayer = gradientLayer;
    }
    return _downGradientLayer;
}
@end
