//
//  BaseViewController.h
//  Yiyouba
//
//  Created by tangsanmei on 8/3/16.
//  Copyright (c) 2016年 tangsanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PushOrPresentType {
    NoType = 0,
    Push = 1,
    Present = 2,
}PushOrPresentType;

@interface BaseViewController : UIViewController

@property (nonatomic)PushOrPresentType pushOrPresentType;


- (void)backAction;




-(BOOL) isEmpty:(NSString *) str;
- (BOOL)canLoadNewData:(NSString *)resultPath :(NSInteger)maxTime;
-(NSString *)getErrStrWithErrCode:(NSString *)errCode;
@end
