//
//  ZBMVVMSimpleViewController.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/7/29.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMSimpleViewController.h"
#import "ZBMVVMSimpleView.h"
#import "ZBMVVMSimpleModel.h"
#import "ZBMVVMSimpleViewModel.h"

@interface ZBMVVMSimpleViewController ()

@property (nonatomic, strong) ZBMVVMSimpleModel     *simpleModel;
@property (nonatomic, strong) ZBMVVMSimpleView      *simpleView;
@property (nonatomic, strong) ZBMVVMSimpleViewModel *simpleViewModel;

@end

@implementation ZBMVVMSimpleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化
    self.simpleModel.name = @"帅斌";
    
    //创建视图
    [self.view addSubview:self.simpleView];
    
    /*绑定关系*/
    //viewModel绑定model
    [self.simpleViewModel bindModel:self.simpleModel];
    //view绑定viewModel
    [self.simpleView bindViewModel:self.simpleViewModel];

    
}


#pragma mark - lazy load
- (ZBMVVMSimpleView *)simpleView
{
    if(!_simpleView){
        _simpleView = [[ZBMVVMSimpleView alloc] init];
    }
    return _simpleView;
}

- (ZBMVVMSimpleModel *)simpleModel
{
    if(!_simpleModel){
        _simpleModel = [[ZBMVVMSimpleModel alloc] init];
    }
    return _simpleModel;
}


- (ZBMVVMSimpleViewModel *)simpleViewModel
{
    if(!_simpleViewModel){
        _simpleViewModel = [[ZBMVVMSimpleViewModel alloc] init];
    }
    return _simpleViewModel;
}


@end
