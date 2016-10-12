//
//  StarView.h
//  StarDemo
//
//  Created by lzl on 2016/10/11.
//  Copyright © 2016年 lzl. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^indexBlock)(NSInteger);
@interface StarView : UIView
/**
 *  星星视图
 *
 *  @param frame 星星大小 建议width至少等于height*count 保证星星的正方形
 *  @param count 星星数量
 *
 *  @return 
 */
-(instancetype)initWithFrame:(CGRect)frame StarCount:(NSInteger)count isTouch:(BOOL)touch;

//点亮星星
- (void)lightStar:(NSInteger)num animated:(BOOL)animated;
//清除星星
-(void)clearStar;

@property (nonatomic,copy) indexBlock touchIndex;

@end
