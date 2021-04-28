//
//  ModelSanYueShiEr.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/12.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "ModelSanYueShiEr.h"

@implementation ModelSanYueShiEr

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)method {
    
    NSString *string1 = @"2";
    self.str = string1;
    string1 = @"1";
    
    NSLog(@"%@",self.str);//2
}
@end
