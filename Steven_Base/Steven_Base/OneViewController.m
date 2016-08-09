//
//  OneViewController.m
//  Steven_Base
//
//  Created by qugo on 16/8/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "OneViewController.h"
#import "OtherViewController.h"
#import "BaseNavViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一个界面";
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 80, 40)];
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(80, 200, 80, 40)];
    button2.tag = 2;
    button2.backgroundColor = [UIColor greenColor];
    [button2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
   
}

- (void)push:(UIButton *)sender
{
    if (sender.tag == 0) {
        [self.navigationController pushViewController:[[OtherViewController alloc] init] animated:YES];
    }else{
        [self presentViewController:[[BaseNavViewController alloc] initWithRootViewController:[[OtherViewController alloc] init]] animated:YES completion:^{
            
        }];
    }
}

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
