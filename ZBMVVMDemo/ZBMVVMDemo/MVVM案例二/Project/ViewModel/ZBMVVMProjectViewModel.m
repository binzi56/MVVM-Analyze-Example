//
//  ZBMVVMProjectViewModel.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/8/4.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMProjectViewModel.h"
#import "ZBMVVMProjectModel.h"

@interface ZBMVVMProjectViewModel ()

@property (nonatomic, strong) ZBMVVMProjectModel *model;

@end
@implementation ZBMVVMProjectViewModel

- (instancetype)initWithModel:(id)model
{
    return [super initWithModel:model];
}

- (NSString *)getCellImageUrlWithIndex:(NSInteger)index
{
    ZBMVVMProjectModel *model = self.dataArray[index];
    return model.picUrl;
}

- (NSString *)getCellTitleWithIndex:(NSInteger)index
{
    ZBMVVMProjectModel *model = self.dataArray[index];
    return model.content;
}


#pragma mark - lazy load
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 20; i++) {
            ZBMVVMProjectModel *model = [[ZBMVVMProjectModel alloc] init];
            model.picUrl = @"dog";
            model.content = [NSString stringWithFormat:@"标题_%02ld", i + 1];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

@end
