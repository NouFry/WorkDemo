//
//  NSString+Revert.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/16.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "NSString+Revert.h"

@implementation NSString (Revert)

-(NSString *)revert {
    
    int length = [self length];
    NSMutableString *revertString = [NSMutableString string];
    for (int index = 0; index < length; index ++) {
        unichar ch = [self characterAtIndex:index];
        [revertString insertString:[NSString stringWithFormat:@"%c",ch] atIndex:0];
    }
    return revertString;
}
@end
