//
//  CrashDemoViewController.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/16.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "CrashDemoViewController.h"

@implementation CrashDemoViewController
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive:) name:@"UngacyMessage" object:nil];
}
- (void)receive:(NSNotification *)sender {
    NSLog(@"%@",sender.name);
    NSLog(@"%@",[sender object]);
    NSLog(@"%@",[sender userInfo]);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UngacyMessage" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UngacyMessage" object:nil];
}
@end
