//
//  StarView.m
//  StarDemo
//
//  Created by lzl on 2016/10/11.
//  Copyright © 2016年 lzl. All rights reserved.
//

#import "StarView.h"

@interface StarView ()

@property (nonatomic) NSInteger starCount;       //总星星
@property (nonatomic) NSInteger starLightCount;  //亮着的星星
@property (nonatomic) NSInteger currentLightStarIndex;//当前点亮的星星个数
@property (nonatomic,strong) NSTimer *timer;     //定时器
@property (nonatomic) BOOL isTouch;
@property (nonatomic) CGFloat starWidth;
@property (nonatomic) CGFloat starHeight;
@property (nonatomic) CGFloat starMargin;
@property (nonatomic) CGFloat touchX;//触摸点x
@property (nonatomic) CGFloat viewWidth;
@end

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame StarCount:(NSInteger)count isTouch:(BOOL)touch{

    if (self = [super initWithFrame:frame]) {
        _starMargin = 4;
        _starCount = count;
        _isTouch = touch;
        _starWidth = (frame.size.width-(count - 1)*_starMargin)/count;
        _starHeight = frame.size.height;
        _viewWidth = frame.size.width;
        [self setUp];
    }
    return self;
}

- (void)setUp{

    _starCount = MAX(1, _starCount);
    
    if (_isTouch) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchView)];
        [self addGestureRecognizer:tap];
    }

    for (int i = 0; i < _starCount; i ++) {
        UIImageView *starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_starWidth*i + _starMargin*i, 0, _starWidth, _starHeight)];
        starImageView.image = [UIImage imageNamed:@"star"];
        [self addSubview:starImageView];
    }

}


//点亮星星
- (void)lightStar:(NSInteger)num animated:(BOOL)animated {
    [self stopTimer];
    [self clearStar];

    num = MIN(num, _starCount);
    num = MAX(0, num);

    _starLightCount = num;

    if (animated) {
        //当前点亮的星星下标
        _currentLightStarIndex = 0;
        if (_starLightCount > 0) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animatedStar) userInfo:nil repeats:YES];
        }
    }
    else{

        for (int i = 0; i < num; i ++) {
            UIImageView *currentImage = (UIImageView *)[self.subviews objectAtIndex:i];
            currentImage.image = [UIImage imageNamed:@"star_hl"];
        }
        _currentLightStarIndex = _starLightCount;
    }

  


}


- (void)animatedStar{
    if (_currentLightStarIndex >= _starLightCount) {
        [self stopTimer];
        return;
    }

    UIImageView *image = (UIImageView *)[self.subviews objectAtIndex:_currentLightStarIndex];
    image.image = [UIImage imageNamed:@"star_hl"];
    [UIView animateWithDuration:0.5 animations:^{
        image.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        image.transform = CGAffineTransformMakeScale(1, 1);
    }];
    _currentLightStarIndex++;
}

- (void)touchView{

    NSInteger touchIndex = 0;
    CGFloat index = _touchX / (_starWidth+_starMargin);

    NSString *indexStr = [NSString stringWithFormat:@"%.2f",index];
    if (indexStr) {
        if ([indexStr rangeOfString:@"."].location != NSNotFound) {
            touchIndex = [[[indexStr componentsSeparatedByString:@"."] firstObject] integerValue] + 1;
        }
        else{
            touchIndex = [indexStr integerValue] + 1;
        }
    }
    touchIndex = MAX(0, touchIndex);
    touchIndex = MIN(touchIndex, _starCount);
    if (_touchIndex) {
        self.touchIndex(touchIndex);
    }
    [self lightStar:touchIndex animated:NO];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    _touchX = touchPoint.x;
    
}

//清除星星
-(void)clearStar{

    for (int i = 0; i < _starCount; i ++) {
        UIImageView *currentImage = (UIImageView *)[self.subviews objectAtIndex:i];
        currentImage.image = [UIImage imageNamed:@"star"];
    }
}

-(void)stopTimer{
    [_timer invalidate];
    _timer = nil;
}


- (void)dealloc{
    [self stopTimer];
}





@end
