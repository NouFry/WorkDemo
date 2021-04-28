//
//  ModelSubSvc.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/13.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelSubSvc : NSObject
@property (nonatomic ,copy) NSString *subSvcName;
@property (nonatomic ,copy) NSString *subSvcID;
@property (nonatomic ,copy) NSString *status;

- (void)initWithDictionary:(NSDictionary *)dict;

@end
