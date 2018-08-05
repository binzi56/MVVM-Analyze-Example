//
//  ZBMVVMProjectViewController.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/8/1.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMProjectViewController.h"
#import "ZBMVVMProjectModel.h"
#import "ZBMVVMProjectViewModel.h"
#import "ZBMVVMProjectView.h"

@interface ZBMVVMProjectViewController ()

@property (nonatomic, strong) ZBMVVMProjectView      *projectView;
@property (nonatomic, strong) ZBMVVMProjectModel     *projectModel;
@property (nonatomic, strong) ZBMVVMProjectViewModel *projectViewModel;

@end

@implementation ZBMVVMProjectViewController


- (void)yd_addSubviews
{
    [self.view addSubview:self.projectView];
}

#pragma mark - system
- (void)updateViewConstraints
{
    [self.projectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}


#pragma mark - lazy load
- (ZBMVVMProjectView *)projectView
{
    if (!_projectView) {
        _projectView = [[ZBMVVMProjectView alloc] initWithViewModel:self.projectViewModel];
    }
    return _projectView;
}


- (ZBMVVMProjectModel *)projectModel
{
    if (!_projectModel) {
        _projectModel = [[ZBMVVMProjectModel alloc] init];
    }
    return _projectModel;
}

- (ZBMVVMProjectViewModel *)projectViewModel
{
    if (!_projectViewModel) {
        _projectViewModel = [[ZBMVVMProjectViewModel alloc] initWithModel:self.projectModel];
    }
    return _projectViewModel;
}





@end
