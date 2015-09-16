//
//  UIView+Frame.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//


//直接修改frame的某个属性的方法
#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@end
