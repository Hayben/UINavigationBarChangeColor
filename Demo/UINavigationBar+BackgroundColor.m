//
//  UINavigationBar+BackgroundColor.m
//  Demo
//
//  Created by 123 on 15/12/19.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import "UINavigationBar+BackgroundColor.h"

#import <objc/runtime.h>

static NSString * const overlayKey = @"selfKey";

@implementation UINavigationBar (BackgroundColor)

- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)H_setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        
        [self insertSubview:self.overlay atIndex:0];
        
    }
    
    self.overlay.backgroundColor = backgroundColor;
    
}


@end
