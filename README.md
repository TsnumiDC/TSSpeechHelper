# TSSpeechHelper
封装于系统的语音识别,可以把语音转换成文字

- 首先需要以下权限

```
//  注意,要配置以下权限,加载info中
//  Privacy - Speech Recognition Usage Description      录音权限
//  Privacy - Microphone Usage Description              话筒权限
```

1. 使用语音识别系统,需要实现以下Block,用于回调

```
@property (strong,nonatomic)TSSpeechHelperHandler sentenceSpeechHandler;//每一句调用一次,返回当前说的最后一句
@property (strong,nonatomic)TSSpeechHelperHandler allSpeechHandler;//每一句调用一次,返回当前说的所有话拼接起来
@property (strong,nonatomic)TSSpeechErrorHandler errorHandler;//调动失败的回调
@property (strong,nonatomic)TSSpeechStateChangeHandler stateHandler;//当状态改变的时候的回调,比如可以录音变成了不可以录音
```

其中最后一个不是必须实现的,前两个可以根据需求二选一

2. 错误类型

```
[helper setErrorHandler:^(TSSpeechHelper *speechHelper, TSSpeechHelperErrorType errorType){

switch (errorType) {
case TSSpeechHelperErrorTypeDefault:{
NSLog(@"开启识别失败,未知错误");
}
break;
case TSSpeechHelperErrorTypeNoNotPossible:{
NSLog(@"开启识别失败,设备不支持");
}
break;
case TSSpeechHelperErrorTypeAudioStartError:{
NSLog(@"开启识别失败,开始录音失败");
}
break;
case TSSpeechHelperErrorTypeUserRefuse:{
NSLog(@"开启识别失败,用户拒绝录音");
}
break;
case TSSpeechHelperErrorTypeNoPermission:{
NSLog(@"开启识别失败,没有得到授权");
}
break;

default:
break;
}
```




