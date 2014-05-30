//
//  YueYueView.h
//  DaYueYue
//
//  Created by xiazhidi on 14-5-30.
//  Copyright (c) 2014年 chentoo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YueYueView;
@protocol YueYueViewDelegate <NSObject>

@required

- (void)YueYueViewDidPressed:(YueYueView *)yyView;

@end


@interface YueYueView : UIImageView

@property (nonatomic, weak) id<YueYueViewDelegate> delegate;


- (void)showInView:(UIView *)view;
- (void)dismiss;

- (void)didPressed;
+ (instancetype)viewWithPosition:(NSInteger)position;

@end
