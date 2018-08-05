//
//  ZBMVVMSimpleViewModel.h
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/7/30.
//  Copyright © 2018年 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBMVVMSimpleViewModel : NSObject

@property (nonatomic, strong) NSString *nameStr;

//绑定model
- (void)bindModel:(id)model;

//按钮点击方法的实现
- (void)changeButtonTextAction;

@end
