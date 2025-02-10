//
//  DateSingleTon.m
//  testA
//
//  Created by Xduzdb on 2025/2/7.
//

#import "JHCurDate.h"

@implementation JHCurDate

static JHCurDate *jhCurDate = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jhCurDate = [[JHCurDate alloc] init];
    });
    return jhCurDate;
}

+ (NSDateFormatter *)sharedFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    });
    return formatter;
}

- (NSString *)getCurDate {
    // 输出当前时间
    NSDate *curDate = [NSDate date];
    NSString *dateString = [[JHCurDate sharedFormatter] stringFromDate:curDate];
    return dateString;
}

@end
