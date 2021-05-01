//
//  CategoryViewController.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/16.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "CategoryViewController.h"
#import "NSString+Revert.h"
#import "ModelKVC.h"
@interface CategoryViewController ()<UITextFieldDelegate>

@end

@implementation CategoryViewController


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"%@",NSStringFromRange(range));
    NSLog(@"%@",string);
//    删除操作中的string变量是@""
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    for (int index = 0; index < [string length]; index ++) {
        unichar ch = [string characterAtIndex:index];
//        第一版,可能会引起无法删除字符的BUG
        if (ch > '9' || ch < '0') {
            return NO;
        }
    }
    
//    
    
    return YES;
}

//Notification 1
- (void)registerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive:) name:@"UngacyMessage" object:nil];

}
//Notification 2
- (void)receive:(NSNotification *)sender {
    NSLog(@"%@",sender.name);
    NSLog(@"%@",[sender object]);
    NSLog(@"%@",[sender userInfo]);
    
    
}
//Notification 3
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UngacyMessage" object:@"1" userInfo:@{@"key":@"value"}];
}
- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"123";
//    这种写法不好.建议不写,可能会引起编译器出错.
//    属性和变量不宜以new开头
//    NSString *newString   ->XXXX
    NSString *revertString  = [str revert];
    NSLog(@"%@",revertString);
    
    
    
    
//    KVC
    ModelKVC *kvcDemo = [[ModelKVC alloc] init];
    
    NSString *string = kvcDemo.string;
    NSString *theSameString = [kvcDemo valueForKey:@"string"];
    if ([string isEqualToString:theSameString]) {
        NSLog(@"valueForKey:string  == self.string");
    }
    
    kvcDemo.string = @"set String";
    NSLog(@"%@",kvcDemo.string);
    [kvcDemo setValue:@"setValue:forKey:" forKey:@"string"];
    NSLog(@"%@",kvcDemo.string);
    
    [kvcDemo setValue:@"setValue:forKey:" forKey:@"keyNotExist"];
    
    
//    kvcDemo.sub.string  ==
    NSString *subString = [kvcDemo valueForKeyPath:@"sub.string"];
    NSLog(@"%@",subString);
    
    [self registerNotification];
}
//Notification 4
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UngacyMessage" object:nil];
}
@end
