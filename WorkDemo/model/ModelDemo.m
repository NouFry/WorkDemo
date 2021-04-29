#import "ModelDemo.h"


@implementation ModelDemo


- (instancetype)init
{
    self = [super init];
    if (self) {
        _count = -1;
    }
    return self;
}


- (void)demo
{
    self.dict = [NSDictionary dictionaryWithObject:@"VALUE" forKey:@"KEY"];
    self.dict = @{@"KEY":@"VALUE",
                  @"KEY1":@"VALUE1"};
//   dict-> 1
    NSString *dictValue1 = [self.dict objectForKey:@"KEY"];
    NSString *dictValue2 = self.dict[@"KEY"];
    NSLog(@"%@",dictValue1);
    NSLog(@"%@",dictValue2);
    
    
    self.mdict = [NSMutableDictionary dictionary];
    
    [self.mdict setObject:@"MVALUE" forKey:@"MKEY"];
    NSString *mdictValue1 = self.mdict[@"MKEY"];//MVALUE
    NSLog(@"%@",mdictValue1);
    
    [self.mdict removeObjectForKey:@"SOMEKEY"];
    
    
    NSString *mdictValueNull = self.dict[@"MKEYNOTEXIST"];//nil
    if (mdictValueNull != nil ) {
        NSLog(@"mdictValueNull is not nil");
    } else {
        NSLog(@"mdictValueNull is nil");
    }
    
    self.set = [NSSet setWithObjects:@"1",@"2",@"1", nil];
    NSLog(@"set ->%@",self.set);//1,2
    
//    @[]
    self.array = @[@"1",@"2",@"1"];
    
    NSLog(@"array ->%@",self.array);//1,2
    
    self.mset = [NSMutableSet set];
    [self.mset addObject:@"3"];
    [self.mset removeObject:@"1"];
    NSLog(@"%@",self.mset);//2,3
    
    self.marray = [@[@"1",@"2",@"3"] mutableCopy];
    self.marray = [NSMutableArray arrayWithObjects:@"11",@"2",@"3", nil];
    
    [self.marray addObject:@"1"];
    NSLog(@"marray:%@",self.marray);//1,2,3,1
//    [self.marray removeObject:@"1"];
    NSLog(@"marray:%@",self.marray);//2,3
//    [self.marray removeObject:@"2" inRange:NSMakeRange(1, 1)];
    NSLog(@"marray:%@",self.marray);//
    [self.marray sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    NSLog(@"marray:%@",self.marray);//
    
    
    self.date = [NSDate date];
    
    NSLog(@"date->%@",[self.date descriptionWithLocale:@"zhCN"]);
    self.date = [self.date dateByAddingTimeInterval: -365*24 * 60 * 60];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd hh:mm:ss";
    NSString *dateString = [formatter stringFromDate:self.date];
    NSLog(@"dateString:%@",dateString);
    
#warning    获取今天下午17:30的字符串
    
    NSString *lastYearString = @"2014-03-14 11:47:12";
    NSDate *lastYearDate = [formatter dateFromString:lastYearString];
    NSString *subString1 = @"Hello,";
    NSString *subString2 = @"World!";
    NSMutableString *mString = [NSMutableString string];
    [mString appendString:subString1];
    [mString appendString:subString2];
    [mString appendFormat:@"%@ %@",subString1,subString2];
//    1
    NSString *string1 = [subString1 stringByAppendingString:subString2];
    NSString *string2 = [NSString stringWithFormat:@"%@ %@",subString1,subString2];
    
    BOOL isContains= [subString1  containsString:@"ll"];
    NSLog(@"isContains->%d",isContains);
    
    NSString *intString = @"1";
    NSString *floatString = @"2.2";
    NSString *twobString = @"2b3";
    NSString *sbString = @"sb";
    NSLog(@"%d",[intString intValue]);//1
    NSLog(@"%d",[floatString intValue]);//2
    NSLog(@"%f",[intString floatValue]);//1.0
    NSLog(@"%f",[floatString floatValue]);//2.2
    
    NSLog(@"%d",[twobString intValue]);//1->报错.2->0.3->2
    NSLog(@"%d",[sbString intValue]);//报错
    
    CGRect frame = CGRectMake(0, 0, 100, 100);
    frame.origin = CGPointMake(1, 1);
    frame.size = CGSizeMake(200, 200);
    
    
    
}
- (void)askDelegateToAnswer:(id)question {
    [self.delegate answerSomeoneQuestion:question];
//    if ([self.delegate conformsToProtocol:@protocol(DemoProtocol)] ) {
//        
//    } else {
//        NSLog(@"Delegate Error!");
//    }
}
@end



