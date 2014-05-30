//
//  ViewController.m
//  DaYueYue
//
//  Created by xiazhidi on 14-5-30.
//  Copyright (c) 2014年 chentoo. All rights reserved.
//

#import "ViewController.h"
#import "YueYueView.h"
#import "D2048ViewController.h"

@interface ViewController () <YueYueViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *gameView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *to2048Button;

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
- (IBAction)b2048ButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"to2048VC" sender:self];
}

#pragma mark - YueYueView Delegate

- (void)YueYueViewDidPressed:(YueYueView *)yyView
{
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",[self.scoreLabel.text integerValue] + 1];
    if (self.scoreLabel.text.integerValue == 5)
    {
        self.to2048Button.hidden = NO;
        [self b2048ButtonPressed:nil];
    }
    else
    {
        YueYueView *yyView1 = [YueYueView viewWithPosition:[self randomPosition]];
        yyView1.delegate = self;
        [yyView1 showInView:self.gameView];
    }
}
@end
