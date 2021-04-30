//
//  PlistToViewViewController.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/15.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "PlistToViewViewController.h"

@interface PlistToViewViewController ()
@property (nonatomic ,strong) NSArray *configArray;
@end

@implementation PlistToViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"google" ofType:@"plist"];
    self.configArray = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"self.configArray:\n%@",self.configArray);
    
    CGRect frame = CGRectMake(0, 0, 1, 1);
    NSLog(@"%@",NSStringFromCGRect(frame));
    [self generateViewFromArray];
    // Do any additional setup after loading the view.
}

- (void)generateViewFromArray {
//    每行
    for (NSArray *lineArray in self.configArray) {
//        每行中的每个元素
        for (NSDictionary *dict in lineArray) {
            NSString *className = dict[@"className"];
            NSString *frameString = dict[@"frame"];
            NSString *bgColorString = dict[@"backgroundColor"];
            
            CGRect frame = CGRectFromString(frameString);
            UIView *view = [[NSClassFromString(className) alloc] initWithFrame:frame];
            [self.view addSubview:view];
            
            if ([className isEqualToString:@"UIButton"]) {
                NSString *action = dict[@"action"];
                NSString *title = dict[@"title"];
                NSString *color = dict[@"color"];
                
                UIButton *button = (UIButton *)view;
                [button setTitle:title forState:UIControlStateNormal];
                [button addTarget:self action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
                
                UIColor *titleColor = nil;
                if ([color isEqualToString:@"whiteColor"]) {
                    titleColor = [UIColor whiteColor];
                } else if ([color isEqualToString:@"lightGrayColor"]) {
                    titleColor = [UIColor lightGrayColor];
                } else if ([color isEqualToString:@"blackColor"]) {
                    titleColor = [UIColor blackColor];
                }
                [button setTitleColor:titleColor forState:UIControlStateNormal];
                
                UIColor *backgroundColor = nil;
                if ([bgColorString isEqualToString:@"lightGrayColor"]) {
                    backgroundColor = [UIColor lightGrayColor];
                }
                else {
                    backgroundColor = [UIColor clearColor];
                }
                [button setBackgroundColor:backgroundColor];
                
            } else if ([className isEqualToString:@"UIView"]) {
                
//                UIColor *someColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
                
                if ([bgColorString isEqualToString:@"blackColor"]) {
                    view.backgroundColor = [UIColor blackColor];
                }
                
            } else if ([className isEqualToString:@"UITextField"]) {
                UITextField *textField = (UITextField *)view;
                textField.borderStyle = UITextBorderStyleLine;
                
            } else if ([className isEqualToString:@"UIImageView"]) {
                UIImageView *imageView = (UIImageView *)view;
                NSString *imageName = dict[@"image"];
                imageView.image = [UIImage imageNamed:imageName];
            }
            
        }
        
    }
    
}

- (void)press:(UIButton *)sender {
    NSLog(@"%@",[sender titleForState:UIControlStateNormal]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
