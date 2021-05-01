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
        
        
        [self addObserver:self forKeyPath:@"string" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
        NSLog(@"%@",change);
        NSLog(@"%@",keyPath);
        NSLog(@"%@",object);
        NSLog(@"%@",context);
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@ is undefined",key);
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"string" context:nil];
    [self removeObserver:self forKeyPath:@"array" context:nil];
}
@end
