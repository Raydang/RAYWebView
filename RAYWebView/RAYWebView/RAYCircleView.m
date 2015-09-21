//
//  RAYCircleView.m
//  RAYWebView
//
//  Created by 党磊 on 15/9/21.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import "RAYCircleView.h"

@implementation RAYCircleView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.circleView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:self.circleView];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.circleView.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = path.CGPath;
        self.circleView.layer.mask = maskLayer;
        
        self.titleLabel = [[UILabel alloc]initWithFrame:self.circleView.bounds];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor darkGrayColor];
        [self.circleView addSubview:self.titleLabel];
    }
    return self;
}

- (void) setBackgroundColorWithView:(UIColor *)carryColor {
    self.circleView.backgroundColor =  carryColor;
}

- (void) setTitleWithLabel:(NSString *)title {
    self.titleLabel.text = @"标题";
}

@end
