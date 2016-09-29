//
//  UIImage+Category.h
//  Categorys
//
//  Created by nercita on 16/9/8.
//  Copyright © 2016年 nercita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageByResizeToSize:(CGSize)size;

///  切圆角
- (UIImage *)imageByCornerRadius;
@end
