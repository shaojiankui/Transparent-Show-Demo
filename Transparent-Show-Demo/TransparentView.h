//
//  TransparentView.h
//  Transparent-Show-Demo
//
//  Created by Jakey on 14-8-7.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransparentView : UIView<UIGestureRecognizerDelegate>
{
    UIImageView *_backgroundImageView;
    UIImageView *_transparentImageView;
    UIImageView *_watchImageView;
    UIButton *_watchButton;
    CGPoint startPoint;
    CGPoint endPoint;
    
}
@property (nonatomic, retain) UIImage *watchButtonImage;
@property (nonatomic)         NSInteger watchHeight;
@property (nonatomic, retain) UIImage *backgroundImage;
@property (nonatomic, retain) UIImage *transparentImage;
@property (nonatomic, retain) UIImage *watchImage;
@property (nonatomic, readwrite) CGFloat moveMinY;
@property (nonatomic, readwrite) CGFloat moveMaxY;

@end
