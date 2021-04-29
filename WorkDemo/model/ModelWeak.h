//
//  ModelWeak.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/11.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelDemo.h"

@interface ModelWeak : NSObject

//    以下一般是weak(assign)
//    IBOutlet
//    delegate
//    数值类型


//    以下用copy
//    NSString
@property (nonatomic ,weak) ModelDemo *weakDemo;
@end
