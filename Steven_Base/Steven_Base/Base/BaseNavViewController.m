//
//  BaseNavViewController.m
//  iWifi
//
//  Created by apple  on 14-9-16.
//  Copyright (c) 2014年 tangsanmei. All rights reserved.
//

#import "BaseNavViewController.h"
#import "BaseViewController.h"
#import <objc/runtime.h>

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17],NSFontAttributeName, nil]];
    
    //右滑手势返回上一级界面
    /*
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }*/
    // 获取代理
    id target = self.interactivePopGestureRecognizer.delegate;
    // 创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    // 设置pan手势的代理
    pan.delegate = self;
    // 添加手势
    [self.view addGestureRecognizer:pan];
    // 将系统自带的手势覆盖掉
    self.interactivePopGestureRecognizer.enabled = NO;
}
#pragma mark-UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}
#pragma mark -Super Push method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BaseViewController *PushVc = (BaseViewController *)viewController;
    if (self.viewControllers.count == 0) {
        PushVc.pushOrPresentType = NoType;
        [PushVc setHidesBottomBarWhenPushed:NO];
    }else{
        PushVc.pushOrPresentType = Push;
        if (self.viewControllers.count == 1) {
            [PushVc setHidesBottomBarWhenPushed:YES];
        }
    }
    [super pushViewController:viewController animated:animated];
    
}


/*
#pragma mark-下面这些写在baseNV里面控制
-(NSUInteger)supportedInterfaceOrientations{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}
-(BOOL)shouldAutorotate{
    return self.visibleViewController.shouldAutorotate;
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
