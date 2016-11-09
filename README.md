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

> 这是我写的<iOS自定义控件剖析>这本书籍中的一个demo, 如果你希望知道具体的实现过程和其他的一些常用效果的实现, 那么你应该能轻易在网上下载到免费的盗版书籍. 

> 当然作为本书的写作者, 还是希望有人能支持正版书籍. 如果你有意购买书籍, 在[这篇文章中](http://www.jianshu.com/p/510500f3aebd), 介绍了书籍中所有的内容和书籍适合阅读的人群, 和一些试读章节, 以及购买链接. 在你准备[购买](http://www.qingdan.us/product/13)之前, 请一定读一读里面的说明. 否则, 如果不适合你阅读, 虽然书籍售价35不是很贵, 但是也是一笔损失.


> 如果你希望联系到我, 可以通过[简书](http://www.jianshu.com/users/fb31a3d1ec30/latest_articles)联系到我
