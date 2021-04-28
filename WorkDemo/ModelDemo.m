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

- (void)askDelegateToAnswer:(id)question {
    [self.delegate answerSomeoneQuestion:question];
//    if ([self.delegate conformsToProtocol:@protocol(DemoProtocol)] ) {
//        
//    } else {
//        NSLog(@"Delegate Error!");
//    }
}
@end



