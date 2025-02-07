//
//  main.m
//  testA
//
//  Created by Xduzdb on 2025/2/7.
//

#import <Foundation/Foundation.h>
#import "JHCurDate.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        JHCurDate *jhCurDate = [JHCurDate shared];
        NSDate *bDate = [NSDate date];
        NSLog(@"BeginDate: %@", [jhCurDate getCurDate]);
        int i = 0;
        while (i < 10000000) {
            i++;
        }
        NSDate *eDate = [NSDate date];
        NSLog(@"EndDate: %@", [jhCurDate getCurDate]);
        NSTimeInterval timeInterval = [eDate timeIntervalSinceDate:bDate] * 1000;
        NSLog(@"timeInterval: %.3f ms", timeInterval);
    }
    return 0;
}
