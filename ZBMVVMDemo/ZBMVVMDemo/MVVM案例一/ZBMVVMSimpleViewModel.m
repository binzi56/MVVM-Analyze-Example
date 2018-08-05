//
//  ZBMVVMSimpleViewModel.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/7/30.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMSimpleViewModel.h"
#import "ZBMVVMSimpleModel.h"

@interface ZBMVVMSimpleViewModel()

@property (nonatomic, strong) ZBMVVMSimpleModel *model;
@property (nonatomic, assign) BOOL              isClick;

@end
@implementation ZBMVVMSimpleViewModel

//绑定model
- (void)bindModel:(id)model
{
    self.model = model;
    self.nameStr = self.model.name;
}

//按钮点击方法的实现
- (void)changeButtonTextAction
{
    _isClick = !_isClick;
    if(_isClick){
       self.model.name = @"火之玉";
    }else{
       self.model.name = @"帅斌";
    }
    self.nameStr = self.model.name;
}

@end
