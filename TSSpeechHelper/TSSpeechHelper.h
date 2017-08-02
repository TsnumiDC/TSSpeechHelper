//
//  TSSpeechHelper.h
//  TSSiriDemo
//
//  Created by Dylan Chen on 2017/8/2.
//  Copyright © 2017年 Dylan Chen. All rights reserved.
//  语音识别助手,可以用来识别语音
//  注意,要配置以下权限,加载info中
//  Privacy - Speech Recognition Usage Description      录音权限
//  Privacy - Microphone Usage Description              话筒权限

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TSSpeechHelperErrorType) {
    TSSpeechHelperErrorTypeDefault = 0,//未知错误
    TSSpeechHelperErrorTypeNoNotPossible,//设备不支持
    TSSpeechHelperErrorTypeAudioStartError,//打开录音失败
    TSSpeechHelperErrorTypeUserRefuse,//用户拒绝
    TSSpeechHelperErrorTypeNoPermission//没有授权
};


@class TSSpeechHelper;

typedef void(^TSSpeechHelperHandler)(TSSpeechHelper * speechHelper,NSString * codeString);
typedef void(^TSSpeechErrorHandler)(TSSpeechHelper * speechHelper,TSSpeechHelperErrorType errorType);
typedef void(^TSSpeechStateChangeHandler)(TSSpeechHelper * speechHelper,BOOL avalible);

@interface TSSpeechHelper : NSObject

@property (strong,nonatomic)TSSpeechHelperHandler sentenceSpeechHandler;//每一句调用一次,返回当前说的最后一句
@property (strong,nonatomic)TSSpeechHelperHandler allSpeechHandler;//每一句调用一次,返回当前说的所有话拼接起来
@property (strong,nonatomic)TSSpeechErrorHandler errorHandler;//调动失败的回调
@property (strong,nonatomic)TSSpeechStateChangeHandler stateHandler;//当状态改变的时候的回调,比如可以录音变成了不可以录音

/**
 单例类
 @return 用于初始化单例类
 */
+ (instancetype)sharedHelper;

/**
 用于开始,结束录音
 */
- (void)startRecording;
- (void)stopRecording;

@end
