//
//  MianTabBarController.m
//  iWifi
//
//  Created by apple  on 14-9-12.
//  Copyright (c) 2014年 tangsanmei. All rights reserved.
//

#import "MianTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "MineViewController.h"
#import "BaseNavViewController.h"

@interface MianTabBarController ()

@end

@implementation MianTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbarBg"]];
    
    [self loadViewControllers];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"FirstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadViewControllers{
    NSArray *titles = @[@"首页",@"消息",@"发现",@"包",@"我的"];
    NSArray *normImageNames = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_bag",@"tabbar_profile"];
    
    NSArray *selectedImageNames = @[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_bag_selected",@"tabbar_profile_selected"];
//    NSArray *hahah = [normImageNames makeObjectsPerformSelector:@selector(appendFormat:) withObject:@"_selected"];
    
    
    BaseNavViewController *oneNV = [[BaseNavViewController alloc] initWithRootViewController:[[OneViewController alloc] init]];
    BaseNavViewController *twoNV = [[BaseNavViewController alloc] initWithRootViewController:[[TwoViewController alloc] init]];
    BaseNavViewController *treNV = [[BaseNavViewController alloc] initWithRootViewController:[[ThreeViewController alloc] init]];
    BaseNavViewController *fouNV = [[BaseNavViewController alloc] initWithRootViewController:[[FourViewController alloc] init]];
    BaseNavViewController *minNV = [[BaseNavViewController alloc] initWithRootViewController:[[MineViewController alloc] init]];
    self.viewControllers = @[oneNV,twoNV,treNV,fouNV,minNV];
    
    self.delegate = self;
    
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem *item = [self.tabBar.items objectAtIndex:i];
        item.title = titles[i];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:127/255.0f green:127/255.0f blue:127/255.0f alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        item.image = [[UIImage imageNamed:normImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:selectedImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    
}

#pragma mark - -----
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
 
    return YES;
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}


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
