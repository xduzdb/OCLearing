//
//  DateSingleTon.h
//  testA
//
//  Created by Xduzdb on 2025/2/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHCurDate : NSObject

+ (instancetype)shared;
- (NSString *)getCurDate;

@end

NS_ASSUME_NONNULL_END
