//
//  UIImage+stretch1.h
//
//  Created by wwq on 11-5-10.
//  Copyright 2014年 Qugou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImage (UIImage_stretch)
+ (UIImage *)stretchableImage:(NSString *)imageName leftCap:(NSInteger)leftCap topCap:(NSInteger)topCap;
+ (UIImage *)imageByName:(NSString *)name ofType:(NSString *)extension;
+ (UIImage *)imageByName:(NSString *)name;
@end
