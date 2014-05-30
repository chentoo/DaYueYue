//
//  YueYueView.m
//  DaYueYue
//
//  Created by xiazhidi on 14-5-30.
//  Copyright (c) 2014年 chentoo. All rights reserved.
//

#import "YueYueView.h"

#define YUEYUEVIEW_WIDTH 100

@implementation YueYueView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = YUEYUEVIEW_WIDTH / 2;
        self.layer.masksToBounds = YES;
        
        self.image = [UIImage imageNamed:@"YueYueImage"];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
        [self addGestureRecognizer:tapGR];
    }
    return self;
}

+ (instancetype)viewWithPosition:(NSInteger)position
{
    YueYueView *view = [[YueYueView alloc] initWithPosition:position];
    return view;
}

- (id)initWithPosition:(NSInteger)position
{
    self = [self initWithFrame:[self frameForPosition:position]];
    
    return self;
}


- (void)showInView:(UIView *)view
{
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(1, 1);
                     } completion:^(BOOL finished) {
                         
                     }];
}


- (void)dismiss
{
    [self removeFromSuperview];
}

- (void)didPressed
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(0.8, 0.5);
                     } completion:^(BOOL finished) {
                         [self dismiss];
                     }];
}


- (void)tapGR:(UITapGestureRecognizer *)sender
{
    [self didPressed];
    [self.delegate YueYueViewDidPressed:self];
}




- (CGRect)frameForPosition:(NSInteger)position
{
    switch (position) {
        case 0:
        {
            CGRect frame = CGRectMake(20, 20, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 1:
        {
            CGRect frame = CGRectMake(120, 20, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 2:
        {
            CGRect frame = CGRectMake(220, 20, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 3:
        {
            CGRect frame = CGRectMake(20, 120, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 4:
        {
            CGRect frame = CGRectMake(120, 120, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 5:
        {
            CGRect frame = CGRectMake(220, 120, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 6:
        {
            CGRect frame = CGRectMake(20, 220, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 7:
        {
            CGRect frame = CGRectMake(120, 220, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
        case 8:
        {
            CGRect frame = CGRectMake(220, 220, YUEYUEVIEW_WIDTH, YUEYUEVIEW_WIDTH);
            return frame;
        }
            break;
            
        default:
            return CGRectZero;
            break;
    }
}

@end
