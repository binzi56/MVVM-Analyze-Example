//
//  ZBMVVMSimpleView.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/7/30.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMSimpleView.h"
#import "ZBMVVMSimpleViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ZBMVVMSimpleView()

@property (nonatomic, strong) UIButton              *nameButton;
@property (nonatomic, strong) ZBMVVMSimpleViewModel *viewModel;

@end
@implementation ZBMVVMSimpleView

- (instancetype)init
{
    self = [super init];
    if(self){
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        
        self.nameButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _nameButton.frame = CGRectMake(0, 0, 100, 50);
        _nameButton.center = CGPointMake(self.frame.size.width / 2.0, (self.frame.size.height / 3.0 * 1));
        _nameButton.backgroundColor = [UIColor blackColor];
        [_nameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nameButton addTarget:self action:@selector(nameButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nameButton];
    }
    return self;
}
//按钮点击方法
- (void)nameButtonAction
{
    if(self.viewModel){
        [self.viewModel changeButtonTextAction];
    }
}
//绑定viewModel
- (void)bindViewModel:(id)viewModel
{
    self.viewModel = viewModel;
    @weakify(self);
    [[RACObserve(self.viewModel, nameStr) ignore:nil] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.nameButton setTitle:x forState:UIControlStateNormal];
    }];
}

@end
