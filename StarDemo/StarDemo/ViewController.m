//
//  ViewController.m
//  StarDemo
//
//  Created by lzl on 2016/10/11.
//  Copyright © 2016年 lzl. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"
@interface ViewController ()
@property (nonatomic,strong)StarView *starView;
@property (nonatomic,strong)StarView *starViewTouch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _starView = [[StarView alloc]initWithFrame:CGRectMake(100, 100, 166, 30) StarCount:5 isTouch:NO];

    _starViewTouch = [[StarView alloc]initWithFrame:CGRectMake(100, 250, 166, 30) StarCount:5 isTouch:YES];
    _starViewTouch.touchIndex = ^(NSInteger num){
        NSLog(@"评价为%ld星",num);
    };
    
    
    [self.view addSubview:_starView];
    [self.view addSubview:_starViewTouch];
    
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height - 200, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    

}
- (IBAction)lightStar:(UIButton *)sender {

    [_starView lightStar:3 animated:YES];
}
- (IBAction)clearStar:(UIButton *)sender {
    [_starView clearStar];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
