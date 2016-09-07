//
//  ViewController.m
//  DNSendCodeButton
//
//  Created by mainone on 16/9/7.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import "ViewController.h"
#import "DNCountDownButton.h"

@interface ViewController ()

@property (nonatomic, strong) DNCountDownButton *countDownButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.countDownButton countDownButtonHandler:^(DNCountDownButton *countDownButton, NSInteger tag) {
        countDownButton.enabled = NO;
        [countDownButton startCountDownWithSecond:10];
        [countDownButton countDownChanging:^NSString *(DNCountDownButton *countDownButton, NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒", second];
            return title;
        }];
        [countDownButton countDownFinished:^NSString *(DNCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
        }];
    }];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.countDownButton stopCountDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DNCountDownButton *)countDownButton {
    if (!_countDownButton) {
        _countDownButton = [DNCountDownButton buttonWithType:UIButtonTypeCustom];
        _countDownButton.frame = CGRectMake(100, 100, 108, 32);
        [_countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _countDownButton.backgroundColor = [UIColor redColor];
        [self.view addSubview:_countDownButton];
    }
    return _countDownButton;
}

@end
