//
//  ViewController.m
//  DaYueYue
//
//  Created by xiazhidi on 14-5-30.
//  Copyright (c) 2014年 chentoo. All rights reserved.
//

#import "ViewController.h"
#import "YueYueView.h"

@interface ViewController () <YueYueViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *gameView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    YueYueView *yyView = [YueYueView viewWithPosition:[self randomPosition]];
    yyView.delegate = self;
    [yyView showInView:self.gameView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)randomPosition
{
    return arc4random() % 9;
}

#pragma mark - YueYueView Delegate

- (void)YueYueViewDidPressed:(YueYueView *)yyView
{
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",[self.scoreLabel.text integerValue] + 1];
    YueYueView *yyView1 = [YueYueView viewWithPosition:[self randomPosition]];
    yyView1.delegate = self;
    [yyView1 showInView:self.gameView];

}
@end
