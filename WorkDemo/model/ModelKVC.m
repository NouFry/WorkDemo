//
//  ModelKVC.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/16.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "ModelKVC.h"



@implementation subKVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.string = @"subKVC";
    }
    return self;
}

@end


@implementation ModelKVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.string = @"P_String";
        self.sub = [[subKVC alloc] init];
        self.array = @[@"1",@"2"];
        self.dict = @{@"key1":@"11",
                        @"key2":@"22"};
        
    }
    return self;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@ is undefined",key);
}
@end
