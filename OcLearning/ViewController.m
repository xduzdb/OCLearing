//
//  ViewController.m
//  OcLearning
//
//  Created by Xduzdb on 2025/2/11.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
//@property (nonatomic, copy) void(^blockA)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建子线程 -- NSThread
//    NSThread *thread = [[NSThread alloc] init];
    // 添加事件源
//    [self.button performSelector:@selector(clickAction) onThread:thread withObject:nil waitUntilDone:NO]; // 开启子线程消息循环
//    [self.button addTarget:self action:@selector(startRunLoop) forControlEvents:UIControlEventTouchUpInside]; // 点击事件
    
    // 添加事件源 --- GCD
//    [self.button addTarget:self action:@selector(startGCD) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button addTarget:self action:@selector(singleIns) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 添加子视图
    [self.view addSubview: self.button];
    [self.button addSubview: self.label];
//    self.blockA = ^{
//        NSLog(@"im block!");
//    };
    
    // 自动布局设置
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints: @[
        [self.button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.button.widthAnchor constraintEqualToConstant:100],
        
        [self.label.centerXAnchor constraintEqualToAnchor:self.button.centerXAnchor],
        [self.label.centerYAnchor constraintEqualToAnchor:self.button.centerYAnchor],
    ]];
    
}

# pragma mark 方法
- (void)clickAction {
    for (int i = 0; i < 1; i++) {
        @autoreleasepool {
            NSString *str = [NSString stringWithFormat:@"hello--%d--%@", i, [NSThread currentThread]];
            NSLog(@"%@", str);
//            self.blockA();
        }
    }
}

- (void)startRunLoop {
    NSLog(@"JH-Coming!");
    [[NSRunLoop currentRunLoop] run];
    NSLog(@"JH-Ending!");
}

- (void)startGCD {
    // 创建子线程 -- GCD
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self clickAction];
    });
}

- (void)downLoadApp {
    dispatch_queue_t queue = dispatch_queue_create("jh", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"JH-Begin === %@", [NSThread currentThread]);
        dispatch_barrier_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"hello!");
        });
        NSLog(@"JH-End === %@", [NSThread currentThread]);
    });
}

- (void)singleIns {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        static dispatch_once_t onceToken;
        NSLog(@"1=====%zd", onceToken);
        dispatch_once(&onceToken, ^{
            NSLog(@"2=====%zd", onceToken);
        });
        NSLog(@"3=====%zd", onceToken);
    });
}

# pragma mark 初始化组件
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        _button.backgroundColor = UIColor.blackColor;
    }
    return _button;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = UIColor.whiteColor;
        _label.text = @"点击";
        [_label sizeToFit];
    }
    return _label;
}
@end
