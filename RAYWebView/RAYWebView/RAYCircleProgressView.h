//
//  RAYCircleProgressView.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/17.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAYCircleProgressView : UIView

@property (nonatomic, strong) CAShapeLayer *trackLayer;
@property (nonatomic, strong) UIBezierPath *trackPath;

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UIBezierPath *progressPath;

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic) float progress;//0~1之间的数
@property (nonatomic) float progressWidth;

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
