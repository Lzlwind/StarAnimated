# StarAnimated
StarAnimated
##星星动画
`hello world`
###第一种
1.根据传入星星个数,来显示需要点亮的星星(可以动态)
`_starView = [[StarView alloc]initWithFrame:CGRectMake(100, 100, 166, 30) StarCount:5 isTouch:NO];`
2.类似评价时候显示星星个数
```
 _starViewTouch = [[StarView alloc]initWithFrame:CGRectMake(100, 250, 166, 30) StarCount:5 isTouch:YES];
    _starViewTouch.touchIndex = ^(NSInteger num){
        NSLog(@"评价为%ld星",num);
    };
```

![Untitled112.gif](http://upload-images.jianshu.io/upload_images/942406-e537a284679c7e6c.gif?imageMogr2/auto-orient/strip)
