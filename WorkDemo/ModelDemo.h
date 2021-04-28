//
//  ModelDemo.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/11.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoProtocol.h"


@interface ModelDemo : NSObject

@property (nonatomic ,assign) int count;
@property (nonatomic ,assign) id<DemoProtocol> delegate;
//retain
//release

-(void)askDelegateToAnswer:(id)question;

@end