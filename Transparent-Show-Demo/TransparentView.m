//
//  TransparentView.m
//  Transparent-Show-Demo
//
//  Created by Jakey on 14-8-7.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "TransparentView.h"

@implementation TransparentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        // Initialization code
        self.moveMinY = 10;
		self.moveMaxY = 10;
    }
    return self;
}

-(void)didMoveToSuperview
{
    static BOOL isInited = TRUE;
    if (isInited)
    {
        [self layerViews];
        isInited = NO;
    }
}

-(void)layerViews{
    _backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _backgroundImageView.image = self.backgroundImage;
    [self addSubview:_backgroundImageView];
    
    self.watchImage = [UIImage imageNamed:@"watch.png"];
    _watchImageView = [[UIImageView alloc]initWithImage:self.watchImage];
    _watchImageView.userInteractionEnabled = YES;
    //重要
    _watchImageView.clipsToBounds = YES;
    _watchImageView.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.watchHeight);

    
    _transparentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,-(self.frame.size.height/2), self.frame.size.width, self.frame.size.height)];
    _transparentImageView.image = self.transparentImage;
    [_watchImageView addSubview:_transparentImageView];

    _watchButton = [[UIButton alloc]initWithFrame:CGRectMake(_watchImageView.frame.size.width-self.watchHeight, 0, self.watchHeight, self.watchHeight)];
    [_watchImageView addSubview:_watchButton];
    [_watchButton setBackgroundImage:self.watchButtonImage forState:UIControlStateNormal];
    [self addSubview:_watchImageView];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    startPoint = [touch locationInView:touch.view.superview];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint prePoint = [touch previousLocationInView:touch.view.superview];
    CGPoint nextPoint = [touch locationInView:touch.view.superview];
    float deltaY = nextPoint.y - prePoint.y;
    NSLog(@"deltaX%f",deltaY);
    _watchImageView.center = CGPointMake(_watchImageView.center.x,_watchImageView.center.y +deltaY);
    _transparentImageView.center = CGPointMake(_transparentImageView.center.x,_transparentImageView.center.y -deltaY);

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

/*手势弱爆了
-(void)handleDragGestures:(UIPanGestureRecognizer*)dragSender{
    //CGPoint originPoint;
    
    if (dragSender.state == UIGestureRecognizerStateBegan)
    {
       startPoint = [dragSender locationInView:dragSender.view.superview];
    }
    else if (dragSender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint oldPoint = [dragSender velocityInView:dragSender.view.superview];
        CGPoint newPoint = [dragSender locationInView:dragSender.view.superview];
        NSLog(@"oldPoint .y%f",oldPoint.y);
        NSLog(@"newPoint .y%f",newPoint.y);

        CGFloat deltaY = newPoint.y-oldPoint.y;
        NSLog(@"deltaX%f",deltaY);
                dragSender.view.center = CGPointMake(dragSender.view.center.x,newPoint.y);
        _transparentImageView.center = CGPointMake(_transparentImageView.center.x,newPoint.y);
    }
    
}
 // 这个方法在touchesBegan:withEvent:之前调用，为一个新的touch对象进行调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    startPoint = [touch previousLocationInView:touch.view.superview];
    return YES;
}
 */
@end
