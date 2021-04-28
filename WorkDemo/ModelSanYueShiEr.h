//
//  ModelSanYueShiEr.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/12.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelSanYueShiEr : NSObject

@property (nonatomic ,strong) NSString *str;
//reference count
//引用计数

//strong----->
//申请会议室   0 + 1  = 1

//while
//人进来   +1--retain
//人出去   -1--release
//

//1 - 1 = 0 会议室可以用.
//<-----strong


//weak
//reference count 不变
//weak

//ARC
@end
