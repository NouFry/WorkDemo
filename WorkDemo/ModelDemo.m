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



