//
//  ViewController.m
//  MSBombAnimation
//
//  Created by mr.scorpion on 16/4/29.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "MSExplodeView.h"

@interface ViewController ()
{
    MSExplodeView *_explodeView;
}
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    _explodeView = [[MSExplodeView alloc] initWithFrame:self.view.bounds];
    _explodeView.image = [UIImage imageNamed:@"img1.jpg"];
//    _explodeView.image = [UIImage imageWithCIImage:[self convertCGImage:[UIImage imageNamed:@"img1.jpg"]]];
    [self.view addSubview:_explodeView];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [self.button setTitle:@"Explode" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.button.showsTouchWhenHighlighted = YES;
    self.button.center = self.view.center;
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(explode) forControlEvents:UIControlEventTouchDown];
    [self.view bringSubviewToFront:self.button];
}

/**
 *  爆炸
 */
- (void)explode
{
    static int flag = 0;
    [_explodeView explodeWithPrepareImage:[UIImage imageNamed:[NSString stringWithFormat:@"img%d.jpg", flag++%2]]];
}


//- (CIImage *)convertCGImage:(UIImage *)image
//{
//    //将CGImage转换为CIImage
//    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
//    //用过滤器生成新的CIImage
//    CIFilter *filter = [CIFilter filterWithName:@"CIHoleDistortion"];
//    CIVector *vector = [CIVector vectorWithX:self.view.frame.size.width*image.scale/2
//                                           Y:self.view.frame.size.height*image.scale/2];
//    [filter setValue:ciImage forKey:@"inputImage"];
//    [filter setValue:vector forKey:@"inputCenter"];
//    [filter setValue:@(10.0) forKey:@"inputRadius"];
//    CIImage *outputImage = [filter outputImage];
//    return outputImage;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
