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
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (nonatomic, strong) CALayer *view4Layer;
@end

@implementation ViewController
- (IBAction)changeView4Color:(id)sender {
    
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:0.5];
//    [CATransaction setCompletionBlock:^{
//        
//        CGAffineTransform transform= self.view4Layer.affineTransform;;
//        transform = CGAffineTransformRotate(transform, M_PI_4);
//        self.view4Layer.affineTransform = transform;
//        
//    }];
//    self.view4Layer.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0].CGColor;
//    [CATransaction commit];
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"backgroundColor";
//    animation.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
//    animation.delegate = self;
//    [self.view4Layer addAnimation:animation forKey:nil];
    
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"backgroundColor";
    keyAnima.duration = 2;
    keyAnima.values = @[
                        (__bridge id)[UIColor blueColor].CGColor,
                        (__bridge id)[UIColor cyanColor].CGColor,
                        (__bridge id)[UIColor orangeColor].CGColor,
                        (__bridge id)[UIColor blueColor].CGColor,
                        
                        ];
    [self.view4Layer addAnimation:keyAnima forKey:nil];
}
//-(void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
//    
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.view4Layer.backgroundColor = (__bridge CGColorRef)anim.toValue;
//    [CATransaction commit];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self maskTest];
    self.view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    self.view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.view3];
    
    self.view4Layer = [CALayer layer];
    self.view4Layer.backgroundColor = [UIColor cyanColor].CGColor;
    self.view4Layer.frame = CGRectMake(50, 50, 50, 50);
    
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionMoveIn;
//    transition.subtype = kCATransitionFromBottom;
//    self.view4Layer.actions = @{@"backgroundColor":transition};
    [self.view4.layer addSublayer:self.view4Layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self CATextLayer];
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
- (void)CAShapeLayer{
    //绘制一个简单的火柴人
    UIBezierPath *path = [[UIBezierPath alloc]init];
//    [path moveToPoint:CGPointMake(225, 100)];
    [path addArcWithCenter:CGPointMake(200, 100) radius:30 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path moveToPoint:CGPointMake(200, 125)];
    [path addLineToPoint:CGPointMake(200, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(200, 175)];
    [path addLineToPoint:CGPointMake(225, 225)];
    [path moveToPoint:CGPointMake(175, 175)];
    [path addLineToPoint:CGPointMake(225, 175)];
    //下面这段代码绘制了一个有三个圆角一个直角的矩形
//    CGRect rect = CGRectMake(50, 50, 100, 100);
//    CGSize radii = CGSizeMake(20, 20);
//    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
//    //create path
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.lineWidth = 10;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    layer.path = path.CGPath;
    
    [self.view3.layer addSublayer:layer];
}

- (void)CATextLayer {
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.textView.bounds;
    UIFont *font = [UIFont systemFontOfSize:20];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef cgFont = CGFontCreateWithFontName(fontName);
    
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.wrapped = YES;
    textLayer.foregroundColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.font = cgFont;
    textLayer.fontSize = font.pointSize;
    textLayer.string = @"Lorem ipsum dolor sit amet, consectetur adipiscing\elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvin. Nunc quis nunc at mauris pharetra condimentum ut ac neque. ";
    CGFontRelease(cgFont);
    [self.textView.layer addSublayer:textLayer];
}
@end
