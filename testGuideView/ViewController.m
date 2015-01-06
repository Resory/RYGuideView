//
//  ViewController.m
//  testGuideView
//
//  Created by Resory on 15/1/4.
//  Copyright (c) 2015年 Resory. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

#define IPHONE_WIDTH    ([[UIScreen mainScreen] bounds].size.width) //屏幕宽度
#define IPHONE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height) //屏幕长度
#define Small_Screen    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO) //3.5寸屏

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scr;
@property (nonatomic, strong) UIImageView *Bg_one;
@property (nonatomic, strong) UIImageView *Bg_two;
@property (nonatomic, strong) UIImageView *Bg_three;

@property (nonatomic, strong) UIImageView *bg_one_k;
@property (nonatomic, strong) UIImageView *bg_one_bubble_10;
@property (nonatomic, strong) UIImageView *bg_one_bubble_20;
@property (nonatomic, strong) UIView      *bg_one_word;

@property (nonatomic, strong) UIImageView *bg_two_circle;
@property (nonatomic, strong) UIImageView *bg_two_bottom;
@property (nonatomic, strong) UIImageView *bg_two_lightOne;
@property (nonatomic, strong) UIImageView *bg_two_lightTwo;
@property (nonatomic, strong) UIImageView *bg_two_lightThree;
@property (nonatomic, strong) UIView      *bg_two_word;

@property (nonatomic, strong) UIImageView *bg_three_rain_1;
@property (nonatomic, strong) UIImageView *bg_three_rain_2;
@property (nonatomic, strong) UIImageView *bg_three_rain_3;
@property (nonatomic, strong) UIImageView *bg_three_hand;
@property (nonatomic, strong) UIView      *bg_three_word;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    _scr.contentSize = (CGSize){IPHONE_WIDTH * 3 , IPHONE_HEIGHT};
    _scr.pagingEnabled = YES;
    _scr.delegate = self;
    _scr.bounces = NO;
    _scr.showsHorizontalScrollIndicator = NO;
    
    [self configureBgone];
    [self configureBgtwo];
    [self configureBgthree];
    
    [self.view addSubview:_scr];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - 初始化

- (void)configureBgone
{
    CGFloat flowHeight = Small_Screen ? -45 : 0;
    
    _Bg_one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    _Bg_one.image = [UIImage imageNamed:@"01-bg"];
    
    //K线
    _bg_one_k = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240 + flowHeight, IPHONE_WIDTH, 157.5)];
    _bg_one_k.image = [UIImage imageNamed:@"01-K"];
    [_Bg_one addSubview:_bg_one_k];
    
    //气泡10%,20%
    _bg_one_bubble_10 = [[UIImageView alloc] initWithFrame:CGRectMake(115, 300 + flowHeight, 0.01, 0.01)];
    _bg_one_bubble_20 = [[UIImageView alloc] initWithFrame:CGRectMake(178, 233 + flowHeight, 0.01, 0.01)];
    _bg_one_bubble_10.image = [UIImage imageNamed:@"01-10%"];
    _bg_one_bubble_20.image = [UIImage imageNamed:@"01-20%"];
    [_Bg_one addSubview:_bg_one_bubble_10];
    [_Bg_one addSubview:_bg_one_bubble_20];
    
    //文字
    _bg_one_word = [[UIView alloc] initWithFrame:CGRectMake(0, -200, IPHONE_WIDTH, 200)];
    UILabel *bigWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, IPHONE_WIDTH, 31.0)];
    bigWord.textAlignment = NSTextAlignmentCenter;
    bigWord.font = [UIFont boldSystemFontOfSize:31.0];
    bigWord.textColor = [UIColor colorWithRed:0 green:214/255.0 blue:254/255.0 alpha:1.0];
    bigWord.text = @"发现更多好项目";
    UILabel *smallWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, IPHONE_WIDTH, 22)];
    smallWord.textAlignment = NSTextAlignmentCenter;
    smallWord.font = [UIFont systemFontOfSize:22];
    smallWord.textColor = [UIColor whiteColor];
    smallWord.text = @"项目多多,优质资源,及时推荐";
    [_bg_one_word addSubview:smallWord];
    [_bg_one_word addSubview:bigWord];
    [_Bg_one addSubview:_bg_one_word];
    
    //底部轮滚
    UIImageView *lungun = [[UIImageView alloc] initWithFrame:CGRectMake((IPHONE_WIDTH-92)/2.0, IPHONE_HEIGHT - 40, 92, 7)];
    lungun.image = [UIImage imageNamed:@"lungun01"];
    [_Bg_one addSubview:lungun];
    
    for (UIView *v in _scr.subviews) {
        if(v.frame.origin.x == 0)
        {
            [v removeFromSuperview];
        }
    }
    
    [_scr addSubview:_Bg_one];
    [self configureBgoneAnimation];
}

- (void)configureBgtwo
{
    CGFloat floatHeght = 50;
    
    _Bg_two = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    _Bg_two.image = [UIImage imageNamed:@"02-bg"];
    
    //圆圈
    _bg_two_circle = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH/2.0, IPHONE_HEIGHT/2.0+floatHeght, 0.01, 0.01)];
    _bg_two_circle.image = [UIImage imageNamed:@"02-Circle"];
    [_Bg_two addSubview:_bg_two_circle];
    
    //底部手
    _bg_two_bottom = [[UIImageView alloc] initWithFrame:CGRectMake(0, IPHONE_HEIGHT, IPHONE_WIDTH, 265)];
    _bg_two_bottom.image = [UIImage imageNamed:@"02-hand"];
    [_Bg_two addSubview:_bg_two_bottom];
    
    //灯泡1,2,3
    _bg_two_lightOne = [[UIImageView alloc] initWithFrame:CGRectMake(20, 290+floatHeght, 0.01, 0.01)];
    _bg_two_lightOne.image = [UIImage imageNamed:@"02-1"];
    _bg_two_lightTwo = [[UIImageView alloc] initWithFrame:CGRectMake(60, 180+floatHeght, 0.01, 0.01)];
    _bg_two_lightTwo.image = [UIImage imageNamed:@"02-2"];
    _bg_two_lightThree = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH - 30, 240+floatHeght, 0.01, 0.01)];
    _bg_two_lightThree.image = [UIImage imageNamed:@"02-3"];
    [_Bg_two addSubview:_bg_two_lightOne];
    [_Bg_two addSubview:_bg_two_lightTwo];
    [_Bg_two addSubview:_bg_two_lightThree];
    
    //文字
    _bg_two_word = [[UIView alloc] initWithFrame:CGRectMake(0, -200, IPHONE_WIDTH, 200)];
    UILabel *bigWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, IPHONE_WIDTH, 31.0)];
    bigWord.textAlignment = NSTextAlignmentCenter;
    bigWord.font = [UIFont boldSystemFontOfSize:31.0];
    bigWord.textColor = [UIColor colorWithRed:0 green:214/255.0 blue:254/255.0 alpha:1.0];
    bigWord.text = @"发布创意项目";
    UILabel *smallWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, IPHONE_WIDTH, 22)];
    smallWord.textAlignment = NSTextAlignmentCenter;
    smallWord.font = [UIFont systemFontOfSize:22];
    smallWord.textColor = [UIColor whiteColor];
    smallWord.text = @"发起人,真实身份,资质审核";
    [_bg_two_word addSubview:smallWord];
    [_bg_two_word addSubview:bigWord];
    [_Bg_two addSubview:_bg_two_word];
    
    //底部轮滚
    UIImageView *lungun = [[UIImageView alloc] initWithFrame:CGRectMake((IPHONE_WIDTH-92)/2.0, IPHONE_HEIGHT - 40, 92, 7)];
    lungun.image = [UIImage imageNamed:@"lungun02"];
    [_Bg_two addSubview:lungun];
    
    for (UIView *v in _scr.subviews) {
        if(v.frame.origin.x == IPHONE_WIDTH)
        {
            [v removeFromSuperview];
        }
    }
    
    [_scr addSubview:_Bg_two];
}

- (void)configureBgthree
{
    _Bg_three = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH * 2, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    _Bg_three.image = [UIImage imageNamed:@"03-bg"];
    
    //雨1,2,3
    _bg_three_rain_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 398.5)];
    _bg_three_rain_1.image = [UIImage imageNamed:@"03-rain-1"];
    [_Bg_three addSubview:_bg_three_rain_1];
    _bg_three_rain_2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 185, 201.5)];
    _bg_three_rain_2.image = [UIImage imageNamed:@"03-rain-2"];
    _bg_three_rain_2.center = CGPointMake(-185/2.0-70, (-201.5/2.0)+70-70);
    [_Bg_three addSubview:_bg_three_rain_2];
    _bg_three_rain_3 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 176, 193.5)];
    _bg_three_rain_3.image = [UIImage imageNamed:@"03-rain-3"];
    _bg_three_rain_3.center = CGPointMake((100-(176/2.0)), -193.5/2.0);
    [_Bg_three addSubview:_bg_three_rain_3];
    
    //手
    _bg_three_hand = [[UIImageView alloc] initWithFrame:CGRectMake(IPHONE_WIDTH, 330, 211, 129)];
    _bg_three_hand.image = [UIImage imageNamed:@"03-hand"];
    [_Bg_three addSubview:_bg_three_hand];
    
    //文字
    _bg_three_word = [[UIView alloc] initWithFrame:CGRectMake(0, -200, IPHONE_WIDTH, 200)];
    UILabel *bigWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, IPHONE_WIDTH, 31.0)];
    bigWord.textAlignment = NSTextAlignmentCenter;
    bigWord.font = [UIFont boldSystemFontOfSize:31.0];
    bigWord.textColor = [UIColor colorWithRed:0 green:214/255.0 blue:254/255.0 alpha:1.0];
    bigWord.text = @"助理好项目";
    UILabel *smallWord = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, IPHONE_WIDTH, 22)];
    smallWord.textAlignment = NSTextAlignmentCenter;
    smallWord.font = [UIFont systemFontOfSize:22];
    smallWord.textColor = [UIColor whiteColor];
    smallWord.text = @"投资人,发布资源,支持创意";
    [_bg_three_word addSubview:smallWord];
    [_bg_three_word addSubview:bigWord];
    [_Bg_three addSubview:_bg_three_word];
    
    //底部轮滚
    UIImageView *lungun = [[UIImageView alloc] initWithFrame:CGRectMake((IPHONE_WIDTH-92)/2.0, IPHONE_HEIGHT - 40, 92, 7)];
    lungun.image = [UIImage imageNamed:@"lungun03"];
    [_Bg_three addSubview:lungun];
    
    for (UIView *v in _scr.subviews) {
        if(v.frame.origin.x == IPHONE_WIDTH *2)
        {
            [v removeFromSuperview];
        }
    }
    
    [_scr addSubview:_Bg_three];
}

#pragma mark -
#pragma mark - 动效

- (void)configureBgoneAnimation
{
    //K线动画效果-1
    POPBasicAnimation *k_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
    k_animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 157.5)];
    k_animation.toValue = [NSValue valueWithCGSize:CGSizeMake(IPHONE_WIDTH, 157.5)];
    k_animation.completionBlock = ^(POPAnimation *anim, BOOL finshed)
    {
        //气泡10-2
        if(finshed)
        {
            POPBasicAnimation *bubble_10_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            bubble_10_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(4600, 6000)];
            bubble_10_animation.completionBlock = ^(POPAnimation *anim, BOOL finshed)
            {
                //气泡20-3
                if(finshed)
                {
                    POPBasicAnimation *bubble_20_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
                    bubble_20_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(4600, 6000)];
                    [_bg_one_bubble_20 pop_addAnimation:bubble_20_animation forKey:@"bubble_20_animation"];
                }
            };
            [_bg_one_bubble_10 pop_addAnimation:bubble_10_animation forKey:@"bubble_10_animation"];
        }
    };
    [_bg_one_k pop_addAnimation:k_animation forKey:@"k_animation"];
    
    //文字-1
    POPSpringAnimation *word_animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    word_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(IPHONE_WIDTH/2.0, 100)];
    word_animation.springSpeed = 1.0;
    [_bg_one_word pop_addAnimation:word_animation forKey:@"word_animation"];
}

- (void)configureBgtwoAnimation
{
    //圆圈-1
    POPSpringAnimation *c_animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    c_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(19600, 19600)];
    c_animation.dynamicsMass = 10;
    [_bg_two_circle pop_addAnimation:c_animation forKey:@"c_animation"];
    
    //手-1
    POPBasicAnimation *h_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    h_animation.toValue = @(IPHONE_HEIGHT-265/2.0);
    h_animation.duration = 1.0;
    h_animation.completionBlock = ^(POPAnimation *anim, BOOL finshed){
        if(finshed)
        {
            //灯1-2
            POPBasicAnimation *lOne_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            lOne_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(4250, 4450)];
            lOne_animation.completionBlock = ^(POPAnimation *anim, BOOL finshed){
                //灯2-3
                POPBasicAnimation *lTwo_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
                lTwo_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(6350, 6700)];
                lTwo_animation.completionBlock = ^(POPAnimation *anim, BOOL finshed){
                    //灯3-4
                    POPBasicAnimation *lThree_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
                    lThree_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(4200, 4500)];
                    [_bg_two_lightThree pop_addAnimation:lThree_animation forKey:@"lThree_animation"];
                };
                [_bg_two_lightTwo pop_addAnimation:lTwo_animation forKey:@"lTwo_animation"];
            };
            [_bg_two_lightOne pop_addAnimation:lOne_animation forKey:@"lOne_animation"];
        }
    };
    [_bg_two_bottom pop_addAnimation:h_animation forKey:@"h_animation"];
    
    //文字-1
    POPSpringAnimation *word_animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    word_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(IPHONE_WIDTH/2.0, 100)];
    word_animation.springSpeed = 1.0;
    [_bg_two_word pop_addAnimation:word_animation forKey:@"word_animation"];
}

- (void)configureBgthreeAnimation
{
    //雨2-1
    POPBasicAnimation *rainTwo_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    rainTwo_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(185/2.0, (201/2.0)+70)];
    rainTwo_animation.duration = 2.0;
    [_bg_three_rain_2 pop_addAnimation:rainTwo_animation forKey:@"rainTwo_animation"];
    
    //雨3-1
    POPBasicAnimation *rainThree_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    rainThree_animation.toValue = [NSValue valueWithCGPoint:CGPointMake((100+176/2.0), 193.5/2.0)];
    rainThree_animation.duration = 3.0;
    [_bg_three_rain_3 pop_addAnimation:rainThree_animation forKey:@"rainThree_animation"];
    
    //手-1
    POPBasicAnimation *hand_animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    hand_animation.toValue = [NSValue valueWithCGPoint:CGPointMake((IPHONE_WIDTH-211/2.0), (330+129/2.0))];
    hand_animation.duration = 1.0;
    [_bg_three_hand pop_addAnimation:hand_animation forKey:@"hand_animation"];
    
    //文字-1
    POPSpringAnimation *word_animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    word_animation.toValue = [NSValue valueWithCGPoint:CGPointMake(IPHONE_WIDTH/2.0, 100)];
    word_animation.springSpeed = 1.0;
    [_bg_three_word pop_addAnimation:word_animation forKey:@"word_animation"];
}

#pragma mark -
#pragma mark - Scrollview Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/320;
    switch (index)
    {
        case 0:
            [self configureBgone];
            [self configureBgoneAnimation];
            break;
        case 1:
            [self configureBgtwo];
            [self configureBgtwoAnimation];
            break;
        case 2:
            [self configureBgthree];
            [self configureBgthreeAnimation];
            break;
    }
}



@end
