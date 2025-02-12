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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview: self.button];
    [self.button addSubview: self.label];
    
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
    for (int i = 0; i < 1000000; i++) {
        @autoreleasepool {
            NSString *str = [NSString stringWithFormat:@"hello--%d", i];
            NSLog(@"%@", str);
        }
    }
}

# pragma mark 初始化组件
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        _button.backgroundColor = UIColor.blackColor;
        [_button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
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
