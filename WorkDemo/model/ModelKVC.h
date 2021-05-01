//
//  ModelKVC.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/16.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface subKVC : NSObject
@property (nonatomic ,copy) NSString *string;
@end

@interface ModelKVC : NSObject
@property (nonatomic ,copy) NSString *string;
@property (nonatomic ,strong) subKVC *sub;
@property (nonatomic ,strong) NSArray *array;
@property (nonatomic ,strong) NSDictionary *dict;
@end
