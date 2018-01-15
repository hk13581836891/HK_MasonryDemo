//
//  ViewController.m
//  HK_MasonryDemo
//
//  Created by houke on 2018/1/15.
//  Copyright © 2018年 houke. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1、居中显示一个 view
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];//在使用 autolayout 之前必须先把视图加到 superview上，否则会报错
    //用 masonry的函数对添加的 view 进行约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    

/**
 equalTo 里放的是 view
 mas_equalTo 里放的是数值 支持 NSNumber,CGPoint,CGSize,UIEdgeInsets
 */
    
    //2、子 view 略小于 superView
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor yellowColor];
    [view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //以下三种方法效果相同
//        make.top.equalTo(view).with.offset(15);
//        make.left.equalTo(view).with.offset(15);
//        make.right.equalTo(view).with.offset(-15);
//        make.bottom.equalTo(view).with.offset(-15);
    make.top.left.bottom.and.right.equalTo(view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
        
//        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
        
    }];
    
    //3、两个高度100的 view等宽等间隔
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor greenColor];
    [view2 addSubview:view3];
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor purpleColor];
    [view2 addSubview:view4];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view2.mas_centerY);
        make.left.equalTo(view2).with.offset(15);
        make.right.equalTo(view4.mas_left).with.offset(-15);
        make.height.mas_equalTo(100);
        make.width.equalTo(view4);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view2.mas_centerY);
        make.left.equalTo(view3.mas_right).with.offset(15);
        make.right.equalTo(view2).with.offset(-15);
        make.height.equalTo(view3);
        make.width.equalTo(view3);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
















