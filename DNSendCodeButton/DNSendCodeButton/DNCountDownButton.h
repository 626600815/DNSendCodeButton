//
//  DNCountDownButton.h
//  DNSendCodeButton
//
//  Created by mainone on 16/9/7.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DNCountDownButton;

typedef NSString *(^CountDownChanging)(DNCountDownButton *countDownButton, NSUInteger second);
typedef NSString *(^CountDownFinished)(DNCountDownButton *countDownButton, NSUInteger second);

typedef void (^TouchedCountDownButtonHandler)(DNCountDownButton *countDownButton, NSInteger tag);

@interface DNCountDownButton : UIButton {
    NSInteger _second;
    NSUInteger _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
    
    CountDownChanging _countDownChanging;
    CountDownFinished _countDownFinished;
    TouchedCountDownButtonHandler _touchedCountDownButtonHandler;
}

@property(nonatomic,strong) id userInfo;

/**
 *  点击按钮响应
 */
-(void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
/**
 *  倒计时改变回调
 */
-(void)countDownChanging:(CountDownChanging)countDownChanging;
/**
 *  倒计时完成回调
 */
-(void)countDownFinished:(CountDownFinished)countDownFinished;
/**
 *  设置开始倒计时时间
 */
-(void)startCountDownWithSecond:(NSUInteger)second;
/**
 *  停止倒计时
 */
-(void)stopCountDown;

@end
