//
//  RAYCircleView.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/21.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAYCircleView : UIView

@property (strong, nonatomic) UIView *circleView;
@property (strong, nonatomic) UILabel*titleLabel;

- (void)setBackgroundColorWithView:(UIColor *)carryColor;
- (void)setTitleWithLabel:(NSString *)title;

@end
