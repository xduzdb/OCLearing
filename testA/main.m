//
//  main.m
//  testA
//
//  Created by Xduzdb on 2025/2/7.
//

#import <Foundation/Foundation.h>
#import "JHCurDate.h"
#import <pthread/pthread.h>

@interface JHFunctions : NSObject
- (void)timeConsumingOperation; // 声明实例方法
@end

@implementation JHFunctions

- (void)timeConsumingOperation {
    // 执行耗时操作
    int i = 0;
    while (i < 100) {
        // 操作栈空间
//            int n = i; // 7.9ms - 8.75ms
        // 操作堆空间
//            NSString *n = @"hello"; // 循环多次只有一个hello -》 存储在常量区 89.7ms - 91.8ms
//            NSString *m = [NSString stringWithFormat:@"hello %d", i]; // 3242.558ms - 3388.658ms
        // I/O操作
        NSLog(@"%d", i); // 368834.744 ms
        i++;
    }
}

@end

void *demo(void *param) {
    NSString *name = (__bridge NSString *)param;
    NSLog(@"Thread: %@ %@", name, [NSThread currentThread]);
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建日期单例
//        JHCurDate *jhCurDate = [JHCurDate shared];
        // 记录开始时间
//        NSDate *bDate = [NSDate date];
//        NSLog(@"BeginDate: %@", [jhCurDate getCurDate]);
//        JHFunctions *func = [[JHFunctions alloc] init];
        
        
        
        
        // 耗时操作
        // 1. 简单异步执行
//        [ func performSelectorInBackground: @selector(timeConsumingOperation) withObject: nil];
        
        
        // 2. 使用GCD异步执行
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            [func timeConsumingOperation];
//        });
        
        
        // 3. 使用pthread
//        NSLog(@"Thread: %@", [NSThread currentThread]);
//        pthread_t pthread;
//        NSString *name = @"JH";
//        int result = pthread_create(&pthread, NULL, demo, (__bridge void *)(name));
//        if (result == 0) {
//            NSLog(@"OK");
//        } else {
//            NSLog(@"Fail");
//        }
//        // 保证子线程执行完毕（阻塞主线程）
//        pthread_join(pthread, NULL);
        
        
        // 4. 使用NSThread
        // （1）直接start -》 void
//        [NSThread detachNewThreadSelector:<#(nonnull SEL)#> toTarget:<#(nonnull id)#> withObject:<#(nullable id)#>];
        // （2）手动start
//        NSThread * thread = [[NSThread alloc] initWithTarget:<#(nonnull id)#> selector:<#(nonnull SEL)#> object:<#(nullable id)#>]; // object传递参数
//        [thread start]; // start后，放到就绪队列
        
        
        
        
        
        
        
         // 记录结束时间
//        NSDate *eDate = [NSDate date];
//        NSLog(@"EndDate: %@", [jhCurDate getCurDate]);
//        // 计算时间差
//        NSTimeInterval timeInterval = [eDate timeIntervalSinceDate:bDate] * 1000;
//        NSLog(@"timeInterval: %.3f ms", timeInterval);
    }
    return 0;
}


