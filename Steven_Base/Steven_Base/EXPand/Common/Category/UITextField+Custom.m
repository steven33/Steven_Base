//
//  UITextField+Custom.m
//  Qugou
//
//  Created by wwq on 14-10-23.
//  Copyright 2014年 Qugou. All rights reserved.
//

#import "UITextField+Custom.h"

@implementation UITextField (Custom)

//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}

@end
