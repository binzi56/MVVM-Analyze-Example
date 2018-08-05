//
//  ZBMVVMProjectView.m
//  ZBMVVMDemo
//
//  Created by 帅斌 on 2018/8/4.
//  Copyright © 2018年 personal. All rights reserved.
//

#import "ZBMVVMProjectView.h"
#import "ZBMVVMProjectViewModel.h"

static const NSInteger topImageHeight  = 200;
static const NSInteger headImageHeight = 80;

@interface ZBMVVMProjectView()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView            *mainTableView;

@property (nonatomic, strong) ZBMVVMProjectViewModel *projectViewModel;

@property (nonatomic, strong) UIImageView            *topImageView;

@property (nonatomic, strong) UIImageView            *bgImageView;

@property (nonatomic, strong) UIImageView            *headImageView;

@property (nonatomic, strong) UILabel                *nameLabel;

@end
@implementation ZBMVVMProjectView


#pragma mark - private
- (instancetype)initWithViewModel:(id<YDViewModelProtocol>)viewModel
{
    self.projectViewModel = viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)yd_setupViews
{
    [self addSubview:self.mainTableView];
    self.mainTableView.tableHeaderView = self.topImageView;
    self.mainTableView.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    [self.mainTableView.backgroundView addSubview:self.bgImageView];
    
    [self.topImageView addSubview:self.headImageView];
    [self.topImageView addSubview:self.nameLabel];
    

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

#pragma mark - system
- (void)updateConstraints
{
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [super updateConstraints];
}

- (void)yd_bindViewModel
{
    @weakify(self);
    [RACObserve(self.mainTableView, contentOffset) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        CGPoint currentPoint = [x CGPointValue];
        if (currentPoint.y < 0) {
            CGFloat totalOffset = topImageHeight + ABS(currentPoint.y);
            CGFloat f = totalOffset / topImageHeight;
            self.bgImageView.frame =  CGRectMake(- (SCREEN_WIDTH * f - SCREEN_WIDTH) / 2, 0, SCREEN_WIDTH * f, totalOffset);
        }else{
            self.bgImageView.frame = CGRectMake(0, -currentPoint.y, SCREEN_WIDTH, topImageHeight);
        }
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierString = @"projectIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifierString];
    }
    cell.imageView.image = [UIImage imageNamed:[self.projectViewModel getCellImageUrlWithIndex:indexPath.section]];
    cell.textLabel.text = [self.projectViewModel getCellTitleWithIndex:indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.projectViewModel.dataArray.count;
}


#pragma mark - lazy load
- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _mainTableView.sectionHeaderHeight = 5;
        _mainTableView.sectionFooterHeight = 0;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

- (UIImageView *)topImageView
{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topImageHeight)];
    }
    return _topImageView;
}

- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - headImageHeight - 15, topImageHeight - headImageHeight / 2.0, headImageHeight, headImageHeight)];
        _headImageView.image = [UIImage imageNamed:@"avatar"];
        
    }
    return _headImageView;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topImageHeight)];
        _bgImageView.image = [UIImage imageNamed:@"cat"];
    }
    return _bgImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - headImageHeight - 130, topImageHeight - 40, 100, 40)];
        _nameLabel.text = @"火之玉";
        _nameLabel.font = [UIFont systemFontOfSize:16 weight:0.6];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _nameLabel;
}

@end
