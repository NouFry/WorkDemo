//
//  Demo1ViewController.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/14.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()<UITextFieldDelegate>
- (IBAction)alertInfo:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation Demo1ViewController

//如果代码的自动补全功能失效.则在window->organizer中右击该工程名,选择"remove from organizer"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

//触摸空白,弹出或者收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    收键盘
    [self.textField resignFirstResponder];
//    弹出键盘
//    [self.textField becomeFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing");
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

- (IBAction)alertInfo:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSLog(@"%@",title);
}
@end
