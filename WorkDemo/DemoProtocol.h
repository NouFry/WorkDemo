//
//  DemoProtocol.h
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/11.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DemoProtocol <NSObject>
@required
- (void)answerSomeoneQuestion:(id)question;
@optional
- (void)notAnswerSomeoneQuestion:(id)question;
@end
