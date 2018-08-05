//
//  ZBMVVMProjectViewModel.h
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/8/4.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "YDViewModel.h"

@interface ZBMVVMProjectViewModel : YDViewModel

@property (nonatomic, strong) NSMutableArray *dataArray;

//获取cell的图片Url
- (NSString *)getCellImageUrlWithIndex:(NSInteger)index;
//获取cell的标题
- (NSString *)getCellTitleWithIndex:(NSInteger)index;


@end
