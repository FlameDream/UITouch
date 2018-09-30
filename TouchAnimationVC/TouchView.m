//
//  TouchView.m
//  TouchAnimationVC
//
//  Created by ftimage2 on 2018/9/30.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "TouchView.h"


#define ScreenWidth                     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                     [[UIScreen mainScreen] bounds].size.height



@implementation TouchView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"-----开始触摸---------");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"----开始触摸滑动-------");
    UITouch *touch  = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    // 获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self];
    
    CGFloat offsetX = currentPoint.x - prePoint.x;
    CGFloat offsetY = currentPoint.y - prePoint.y;
    
    CGPoint selfPoint = self.frame.origin;
    
    
    CGFloat currentX = self.frame.origin.x;
    CGFloat currentY = self.frame.origin.y;
    CGFloat currentWidth = self.frame.size.width;
    CGFloat currentHeight = self.frame.size.height;
    
    
    // 避免对象 屏幕四个边处理
    // 上边
    if (currentY + offsetY <= 0) {
        offsetY = -currentY;
    }
    
    //右边
    if (currentX + offsetX + currentWidth >= ScreenWidth) {
        offsetX = ScreenWidth - currentX - currentWidth;
    }
    
    // 下边
    if (currentY + currentHeight + offsetY >= ScreenHeight) {
        offsetY = ScreenHeight - currentY - currentHeight;
    }
    
    // 左边
    if (currentX + offsetX <= 0) {
        offsetX = -currentX;
    }
    
    
    NSLog(@"FlyElephant----当前位置:%@---之前的位置:%@-----self current:%@----",NSStringFromCGPoint(currentPoint),NSStringFromCGPoint(prePoint),NSStringFromCGPoint(selfPoint));
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"-----触摸结束-------");
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"-----触摸取消------------");
}
@end
