//
//  UIImage+stretch1.m
//
//  Created by wwq on 11-5-10.
//  Copyright 2014年 Qugou. All rights reserved.
//

#import "UIImage+stretch.h"

@implementation UIImage (UIImage_stretch)

+ (UIImage *)stretchableImage:(NSString *)imageName leftCap:(NSInteger)leftCap topCap:(NSInteger)topCap {
    UIImage *image = [UIImage imageByName:imageName];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
    return newImage;
}

+ (UIImage *)imageByName:(NSString *)name ofType:(NSString *)extension {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)imageByName:(NSString *)name {
    @try {
        if (name && [name length] > 0) {
            NSRange rang = [name rangeOfString:@"."];
            BOOL isDefault = NO;
            if (rang.location == NSNotFound) {
                isDefault = YES;
            }
            
            NSString *filePath = nil;
            if (isDefault) {
                filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
            } else {
                NSArray *array = [name componentsSeparatedByString:@"."];
                filePath = [[NSBundle mainBundle] pathForResource:[array objectAtIndex:0] ofType:[array objectAtIndex:1]];
            }
            return [UIImage imageWithContentsOfFile:filePath];
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    return nil;
}

@end
