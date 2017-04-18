//
//  ViewController.m
//  AnimationDemo
//
//  Created by hongyimin on 2017/4/16.
//  Copyright © 2017年 DCKJ-IOS-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;//用于表现动画的UIView

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animationView.layer.backgroundColor = [UIColor redColor].CGColor;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)basicAnimationDisplay:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.duration = 1.0f;
    animation.toValue = @300;
    [self.animationView.layer addAnimation:animation forKey:nil];
}
- (IBAction)keyFrameAnimationDisplay:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    animation.duration = 1.0f;
    animation.keyTimes = @[@0,@0.3,@1];
    animation.values = @[@0,@30,@10];
    
    [self.animationView.layer addAnimation:animation forKey:nil];
}
- (IBAction)animationGroupDisplay:(id)sender {
    CABasicAnimation *groupmem1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    groupmem1.toValue = @300;
    CAKeyframeAnimation *groupmem2 = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    groupmem2.values = @[@0,@30,@10];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[groupmem1,groupmem2];
    group.duration = 2.0f;
    [self.animationView.layer addAnimation:group forKey:nil];
    
}


@end
