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

@property (nonatomic ,strong) NSDictionary *dict;
@property (nonatomic ,strong) NSSet *set;
@property (nonatomic ,strong) NSArray *array;
@property (nonatomic ,strong) NSMutableDictionary *mdict;
@property (nonatomic ,strong) NSMutableSet*mset;
@property (nonatomic ,strong) NSMutableArray *marray;
@property (nonatomic ,strong) NSDate *date;


@property (nonatomic ,assign) id<DemoProtocol> delegate;
//retain
//release

-(void)askDelegateToAnswer:(id)question;
- (void)demo;
@end