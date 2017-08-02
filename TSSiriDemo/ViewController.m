//
//  ViewController.m
//  TSSiriDemo
//
//  Created by Dylan Chen on 2017/8/2.
//  Copyright © 2017年 Dylan Chen. All rights reserved.
//

#import "ViewController.h"
#import <Speech/Speech.h>
#import "TSSpeechHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *siriBtu;//开始
@property (weak, nonatomic) IBOutlet UITextView *siriTextView;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;//结束
@property (weak, nonatomic) IBOutlet UITextView *allTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)startAction:(id)sender {
    //开始
    TSSpeechHelper * helper = [TSSpeechHelper sharedHelper];
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
    }];
    
    [helper setSentenceSpeechHandler:^(TSSpeechHelper * speechHelper,NSString * codeString){
    
        self.siriTextView.text = codeString;
    }];
    
    [helper setAllSpeechHandler:^(TSSpeechHelper * speechHelper,NSString * codeString){
        
        self.allTextView.text = codeString;
    }];
    
    [helper setStateHandler:^(TSSpeechHelper * speechHelper,BOOL avalible){
        
        if(avalible){
            NSLog(@"状态变化: 录音变得不可以用了");
        }else{
            NSLog(@"状态变化: 录音变可以用了");
        }
    }];
    
    //开始识别
    [helper startRecording];
}

- (IBAction)stopAction:(id)sender {
    //结束
    [[TSSpeechHelper sharedHelper]stopRecording];
}



@end
