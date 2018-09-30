//
//  ViewController.m
//  TouchAnimationVC
//
//  Created by ftimage2 on 2018/9/29.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"

#define SCREEN_WIDTHL                     [[UIScreen mainScreen] bounds].size.width

#define SCREEN_HEIGHTL                     [[UIScreen mainScreen] bounds].size.height

#define KIsiPhoneX ((int)((SCREEN_HEIGHTL/SCREEN_WIDTHL)*100) == 216)?YES:NO



#define UI_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define UI_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define UI_IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREENSIZE_IS_35  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define SCREENSIZE_IS_40  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define SCREENSIZE_IS_47  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define SCREENSIZE_IS_55  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)

//判断iPHoneXr
#define SCREENSIZE_IS_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPHoneX、iPHoneXs
#define SCREENSIZE_IS_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define SCREENSIZE_IS_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhoneXs Max
#define SCREENSIZE_IS_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

//状态栏、导航栏、标签栏高度
#define Height_NavContentBar 44.0f


#define Height_TapBar (IS_IPhoneX_All ? 83.0 : 49.0)


#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))



//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)




#define Height_StatusBar [[UIApplication sharedApplication] statusBarFrame].size.height
#define Height_NavBar self.navigationController.navigationBar.frame.size.height

#define Height_TopBar (Height_StatusBar+Height_NavBar)
//适配iPhoneXS  Max，iPhoneXS，iPhoneXR


@interface ViewController ()

@property(nonatomic, strong)UIView *shapView;
@property(nonatomic,strong)NSMutableArray *lineMutableArr;

@property(nonatomic, strong)CAShapeLayer *shapeLayerView;
@property(nonatomic, strong)UIBezierPath *bezierPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    touchView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchView];
    
    [[UIApplication sharedApplication] statusBarFrame];
    
    [UIScreen instancesRespondToSelector:@selector(currentMode)];
    
    NSLog(@"SCREEN_HEIGHTL = %f,SCREEN_WIDTHL = %f",SCREEN_HEIGHTL,SCREEN_WIDTHL);
    NSLog(@"%d",(int)((SCREEN_HEIGHTL/SCREEN_WIDTHL)*100));
    if ((int)((SCREEN_HEIGHTL/SCREEN_WIDTHL)*100) == 216) {
        NSLog(@"YES,we can use it!-----iPhoneXS Max，iPhoneXS，iPhoneXR，iPhoneX ");
    }else{
        NSLog(@"NO,we can`t use it!");
    }
    
    
    NSLog(@"current-----Width:%f------Height:%f",SCREEN_WIDTHL,SCREEN_HEIGHTL);
    NSLog(@"-------Height_StatusBar:%f-----Height_NavBar:%f-----Height_TopBar:%f",Height_StatusBar,Height_NavBar,Height_TopBar);
    
    if (@available(iOS 11.0, *)) {
        NSLog(@"---------Safe:%f",self.view.safeAreaInsets.top);
    } else {
        // Fallback on earlier versions
    }
}


//Generally, all responders which do custom touch handling should override all four of these methods.

// 开始触摸
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches.allObjects firstObject];
    CGPoint point = [touch locationInView:self.view];
    [_lineMutableArr addObject:touch];
    
    [self addLine];
    
    CGPoint pointPre = [touch preciseLocationInView:self.view];
    NSLog(@"-----point-X:%f----Y:%f",point.x, point.y);
    NSLog(@"-----pointPre-X:%f----Y:%f",pointPre.x, pointPre.y);
    NSLog(@"-----touch Num:%lu",(unsigned long)touch.tapCount);
    
    NSLog(@"----------touch Began----%lu---",(unsigned long)touches.allObjects);
    
    
}

// 触摸移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches.allObjects firstObject];
    CGPoint point = [touch locationInView:self.view];
    CGPoint pointPre = [touch preciseLocationInView:self.view];
    
    [_lineMutableArr addObject:touch];
    
    [self addLine];
    
    NSLog(@"-----point-X:%f----Y:%f",point.x, point.y);
    NSLog(@"-----pointPre-X:%f----Y:%f",pointPre.x, pointPre.y);
    NSLog(@"-----touch Num:%lu",(unsigned long)touch.tapCount);
    NSLog(@"-------touch Moved--------%lu---",(unsigned long)touches.allObjects);
}

//触摸结束
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches.allObjects firstObject];
    CGPoint point = [touch locationInView:self.view];
    CGPoint pointPre = [touch preciseLocationInView:self.view];
    
    [_lineMutableArr addObject:touch];
    
    [self addLine];
    
    NSLog(@"-----point-X:%f----Y:%f",point.x, point.y);
    NSLog(@"-----pointPre-X:%f----Y:%f",pointPre.x, pointPre.y);
    NSLog(@"-----touch Num:%lu",(unsigned long)touch.tapCount);
    
    NSLog(@"------touch End--------%lu---",(unsigned long)touches.allObjects);
}
//touch 取消
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
    NSLog(@"------touch Cancelled-------%lu---",(unsigned long)touches.allObjects);
}


-(void)addLine{
    _bezierPath = [[UIBezierPath alloc] init];
    _shapeLayerView = [[CAShapeLayer alloc] init];
    BOOL isFirst = true;
    for (UITouch *tempTouch in self.lineMutableArr) {
        if (isFirst) {
            [_bezierPath moveToPoint:[tempTouch locationInView:self.view]];
        }else{
            [_bezierPath addLineToPoint:[tempTouch locationInView:self.view]];
        }
        isFirst = false;
        
    }
    _shapeLayerView.path = _bezierPath.CGPath;
    _shapeLayerView.lineWidth = 2;
    _shapeLayerView.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_shapeLayerView];
    
    
    
//    https://blog.csdn.net/u013410274/article/details/78894440
//    https://www.jianshu.com/p/d5d0bdafaefe
}


@end
