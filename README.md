# ZJCircleProgressView
实现几种常用的圆环形进度条, 饼状进度, 以及彩色加载动画效果


![circleProgress.gif](http://upload-images.jianshu.io/upload_images/1271831-f9755ecaf6eafa5d.gif?imageMogr2/auto-orient/strip)

```
self.progressView = [[ZJCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
// 背景色
self.progressView.trackBackgroundColor = [UIColor yellowColor];
// 进度颜色
self.progressView.trackColor = [UIColor greenColor];
self.progressView.headerImage = [self drawImage];
// 开始角度位置
//    self.progressView.beginAngle =
// 自定义progressLabel的属性...
self.progressView.progressLabel.textColor = [UIColor lightGrayColor];
//    self.progressView.progressLabel.hidden = YES;
[self.view addSubview:self.progressView];

- (IBAction)slide:(id)sender {
    UISlider *slider = (UISlider *)sender;
    // 改变进度
    self.progressView.progress = slider.value;
    self.pieProgressView.progress = slider.value;

}
```