//
//  ModelSubSvc.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/13.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "ModelSubSvc.h"

@implementation ModelSubSvc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subSvcID = @"未定义";
        self.subSvcName = @"未定义";
        self.status = @"未定义";
    }
    return self;
}

-(void)initWithDictionary:(NSDictionary *)dict {
    self.subSvcName = dict[@"subSvcName"];
    self.subSvcID = dict[@"subSvcID"];
    self.status = dict[@"status"];
}
@end
