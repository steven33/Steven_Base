//
//  TwoViewController.m
//  Steven_Base
//
//  Created by qugo on 16/8/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()



@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //xieyigezhushiyonglai cehejdcjdv
    
    NSDictionary *dic = @{@"dicName":@"你好世界",
                          @"dicage":@12,
                          @"dichah":@"你好世界",
                          @"dicsde":@"你好世界",};
    NSArray *arr = @[@"123",@"23",@"13",@"122",@"13323"];
    
    NSDictionary *modelDic =@{@"dic":dic,
                              @"age":@12,
                              @"age":@12,
                              @"age2":@12.233,
                              @"name":@"你好dfdggfgf",
                              @"arr":arr};
    
    
    NSMutableString *string = [NSMutableString stringWithString:@"\n"];
    
    for (NSString *key in modelDic.allKeys) {
        id value = modelDic[key];
        if ([value isKindOfClass:[NSString class]]) {
            [string appendString:[NSString stringWithFormat:@"@property (nonatomic,copy)NSString *%@;\n",key]];
            
        }
        else if ([value isKindOfClass:[NSDictionary class]]){
            [string appendString:[NSString stringWithFormat:@"@property (nonatomic,strong)NSDictionary *%@;\n",key]];
        }
        else if ([value isKindOfClass:[NSArray class]]){
            [string appendString:[NSString stringWithFormat:@"@property(nonatomic,strong)NSArray *%@;\n",key]];
        }
        else if ([value isKindOfClass:[NSNumber class]]){
            [string appendString:[NSString stringWithFormat:@"@property (nonatomic,assign)NSNumber *%@;\n",key]];
        }
    
    }
    NSLog(string);
    
    
}


@end
