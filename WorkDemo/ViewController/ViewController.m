//
//  ViewController.m
//  WorkDemo
//
//  Created by Ungacy Tao on 15/3/11.
//  Copyright (c) 2015年 com.ailk. All rights reserved.
//

#import "ViewController.h"

#import "ModelWeak.h"
#import "ModelStrong.h"
#import "ModelDelegate.h"
#import "ModelSubSvc.h"
#import "ViewDemo.h"
#import <QuartzCore/QuartzCore.h>

//private
@interface ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) ModelStrong *strong;
@property (nonatomic ,strong) ModelWeak *weak;
@property (weak, nonatomic) IBOutlet UITextField *sthText;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic ,strong) NSMutableArray *subsvcArray;
//[ModelSubSvc]

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"subSvc" ofType:@"plist"];
    self.subsvcArray = [NSMutableArray array];
    NSArray *subSvcDictArray = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in subSvcDictArray) {
        ModelSubSvc *subsvc = [[ModelSubSvc alloc] init];
        [subsvc initWithDictionary:dict];
        [self.subsvcArray addObject:subsvc];
    }
    
    
    ModelDemo *demo = [[ModelDemo alloc] init];
    self.strong = [[ModelStrong alloc] init];
    self.strong.strongDemo = demo;// +1
    self.weak = [[ModelWeak alloc] init];
    self.weak.weakDemo = demo;// +0
    
    NSLog(@"%d",demo.count);
    NSLog(@"%d",self.strong.strongDemo.count);
    NSLog(@"%d",self.weak.weakDemo.count);
    
    demo.count = 1;

    NSLog(@"%d",demo.count);
    NSLog(@"%d",self.strong.strongDemo.count);
    NSLog(@"%d",self.weak.weakDemo.count);
//    /*示例#1
//    demo = nil;
//    NSLog(@"%d",demo.count);//0
//    NSLog(@"%d",self.strong.strongDemo.count);//1
//    NSLog(@"%d",self.weak.weakDemo.count);//1
// */
    
    /*示例#2
     weak.weakDemo = nil;
     NSLog(@"%d",demo.count);//1
     NSLog(@"%d",self.strong.strongDemo.count);//1
     NSLog(@"%d",self.weak.weakDemo.count);//0
     */
    
//*   示例#2
//    self.strong.strongDemo = nil;
//    demo = nil;
//    NSLog(@"%d",demo.count);//1
//    NSLog(@"%d",self.strong.strongDemo.count);//0
//    NSLog(@"%d",self.weak.weakDemo.count);//1
//     */
    
    
    
    
    
    
    _sthText.delegate = self;
    _sthText.returnKeyType = UIReturnKeyGo;
    
//    add by ungacy @ 2015.3.14
    ModelDemo *demo2 = [[ModelDemo alloc] init];
    [demo2 demo];
    
    
//    [self addDemoView];
    
}


- (void)addDemoView {
    
    ViewDemo *demo = [[ViewDemo alloc] initWithFrame:CGRectMake(20, 22, 100, 100)];
    demo.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:demo];
    
}
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    
//    return NO;
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_sthText resignFirstResponder];
    
    
    
    ModelDelegate *myDelegate = [[ModelDelegate alloc] init];
    self.strong.strongDemo.delegate = myDelegate;
    [self.strong.strongDemo askDelegateToAnswer:textField.text];
    return YES;
}



#pragma mark UITableView data source

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"澳门主号\t\t澳门副号";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    00
//    01
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tableCellHeight" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *key = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    NSNumber *number = dict[key];
    if (number == nil) {
        return 44;
    }
    return [number floatValue];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
        UIImage *image = [UIImage imageNamed:@"Image"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(100, 0, 22,22);
        if (indexPath.row < 10) {
            [cell.contentView addSubview:imageView];
        } else {
            
            [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            NSArray *subViews = [cell.contentView subviews];
            for (UIView *view in subViews) {
                [view removeFromSuperview];
            }
        }
        return cell;
        
    }
    return nil;
}



- (IBAction)pressButton:(id)sender {
    NSLog(@"%d",self.weak.weakDemo.count);//1
    
    self.sthText.text = @"Hello,";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
