//
//  PKGithubUsersView.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKGithubUsersView.h"

#import <CCBottomRefreshControl/UIScrollView+BottomRefreshControl.h>

@interface PKGithubUsersView ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (assign, nonatomic) id<UITableViewDelegate> tableViewDataSource;
@property (copy, nonatomic) PKInfoBlock topRefreshControlDidTriggerRefreshBlock;
@property (copy, nonatomic) PKInfoBlock bottomRefreshControlDidTriggerRefreshBlock;

@property (strong, nonatomic) UIRefreshControl *topRefreshControl;
@property (strong, nonatomic) UIRefreshControl *bottomRefreshControl;

@end

@implementation PKGithubUsersView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.topRefreshControl = [UIRefreshControl new];
    [self.topRefreshControl addTarget:self action:@selector(topRefreshControlDidTriggerRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.topRefreshControl];
    self.bottomRefreshControl = [UIRefreshControl new];
    [self.bottomRefreshControl addTarget:self action:@selector(bottomRefreshControlDidTriggerRefresh:) forControlEvents:UIControlEventValueChanged];
    self.tableView.bottomRefreshControl = self.bottomRefreshControl;
}

- (void)endBottomRefreshing
{
    [self.topRefreshControl endRefreshing];
}

- (void)endTopRefreshing
{
    [self.bottomRefreshControl endRefreshing];
}

#pragma mark - private

- (void)topRefreshControlDidTriggerRefresh:(UIRefreshControl*)sender
{
    if (self.topRefreshControlDidTriggerRefreshBlock)
    {
        self.topRefreshControlDidTriggerRefreshBlock();
    }
}

- (void)bottomRefreshControlDidTriggerRefresh:(UIRefreshControl*)sender
{
    if (self.bottomRefreshControlDidTriggerRefreshBlock)
    {
        self.bottomRefreshControlDidTriggerRefreshBlock();
    }
}

@end
