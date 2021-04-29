//
//  ViewDemo.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/14.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "ViewDemo.h"

@implementation ViewDemo


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    self.backgroundColor = [UIColor redColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
