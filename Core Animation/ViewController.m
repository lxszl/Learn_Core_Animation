//
//  ViewController.m
//  Core Animation
//
//  Created by 梁兴胜 on 2016/9/29.
//  Copyright © 2016年 梁兴胜. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Category.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self maskTest];
    self.view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    self.view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.view3];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self CATransform3D];
}

- (void)maskTest {
    
    _view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 100, 100)];
    _view2 = [[UIView alloc]initWithFrame:CGRectMake(150, 50, 100, 100)];
    
    _view1.backgroundColor = [UIColor cyanColor];
    _view2.backgroundColor = [UIColor cyanColor];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = CGRectMake(25, 25, 50, 50);
    UIImage *image = [UIImage imageNamed:@"stan"];
    image = [image imageByResizeToSize:CGSizeMake(100, 100)];
    maskLayer.contents = (__bridge id _Nullable)(image.CGImage);
    //    _view1.layer.mask = maskLayer;
    _view1.layer.contents = (__bridge id _Nullable)(image.CGImage);
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc]init];
    maskLayer1.frame = CGRectMake(25, 25, 50, 50);
    maskLayer1.contents = (__bridge id _Nullable)([UIImage imageNamed:@"wode_icon_shezhi_hui"].CGImage);
    _view2.layer.mask = maskLayer1;
    
    [self.view addSubview:_view1];
    [self.view addSubview:_view2];
    
    //create opaque button
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(50, 150);
    [self.view addSubview:button1];
    
    //create translucent button
    UIButton *button2 = [self customButton];
    
    button2.center = CGPointMake(250, 150);
    button2.alpha = 0.5;
    [self.view addSubview:button2];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //enable rasterization for the translucent button
    //    button2.layer.shouldRasterize = YES;
    //    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


- (UIButton *)customButton
{
    //create button
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    
    //add label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
}

- (void)CGAffineTransform{
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    //    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //    transform = CGAffineTransformRotate(transform, M_PI_2/2);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    [UIView animateWithDuration:0.25 animations:^{
        
        self.view3.layer.affineTransform =transform;
    }];
}

-(void)CATransform3D{
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.view3.layer.transform = transform;
}
@end
