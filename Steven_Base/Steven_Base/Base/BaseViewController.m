//
//  BaseViewController.m
//  Yiyouba
//
//  Created by tangsanmei on 8/3/16.
//  Copyright (c) 2016年 tangsanmei. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSLog(@"%u",self.pushOrPresentType);
    
    if (self.pushOrPresentType == Push) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }else if (self.pushOrPresentType == Present){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }else if (self.pushOrPresentType == NoType){//首页（没有push也没有Present）
        
        
    }else{
        
    }
}

#pragma mark - Super-presentViewController method
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    BaseViewController *ToPresentVc;
    if ([viewControllerToPresent isKindOfClass:[BaseNavViewController class]]) {
        UINavigationController *NV = (UINavigationController *)viewControllerToPresent;
        ToPresentVc = (BaseViewController *)NV.viewControllers.lastObject;
    }else{
        ToPresentVc = (BaseViewController *)viewControllerToPresent;
    }
    
    ToPresentVc.pushOrPresentType = Present;
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    
}


- (void)backAction{
    if (self.pushOrPresentType == Push) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (self.pushOrPresentType == Present){
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else if (self.pushOrPresentType == NoType){//首页（没有push也没有Present）
        
    }else{
        
    }
}

- (BOOL)canLoadNewData:(NSString *)resultPath :(NSInteger)maxTime
{
    //判断第一个最新的存储时间
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:resultPath]) {
        
        NSDictionary *fileAttributes=[fileManager attributesOfItemAtPath:resultPath error:nil];
        NSDate *createDate=[fileAttributes objectForKey:NSFileCreationDate];
        NSDate *currentDate = [NSDate date];
        NSTimeInterval  currentTime = [currentDate timeIntervalSinceNow];
        NSTimeInterval  createTime = [createDate timeIntervalSinceNow];
        if ((currentTime-createTime)/60/60>=maxTime) {
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}

/*
#pragma mark-不让横屏
- (BOOL)shouldAutorotate {
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
