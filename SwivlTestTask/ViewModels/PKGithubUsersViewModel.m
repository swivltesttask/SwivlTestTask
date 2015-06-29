//
//  PKGithubUsersViewModel.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKGithubUsersViewModel.h"

#import "PKGithubUsersView.h"
#import "PKTableViewDataSource.h"
#import "PKAPIService.h"
#import "PKGithubUserCell.h"
#import "PKNoItemsCell.h"

@interface PKGithubUsersViewModel ()
{
    PKGithubUsersView *_view;
}

@property (strong, nonatomic) PKTableViewDataSource   *pk_tableViewDatasource;
@property (strong, nonatomic) PKAPIService            *pk_APIService;

@end

@implementation PKGithubUsersViewModel

#pragma mark - getter/setter

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)setView:(PKGithubUsersView *)view
{
    _view = view;
    
    [_view.tableView setDelegate:self.pk_tableViewDatasource];
    [_view.tableView setDataSource:self.pk_tableViewDatasource];

    [self.pk_tableViewDatasource setTableView:_view.tableView];

    [self.pk_tableViewDatasource registerCellWithNibName:NSStringFromClass([PKGithubUserCell class]) forItemClassName:NSStringFromClass([PKGithubUserCell class])];
    [self.pk_tableViewDatasource registerNoItemsCellNibName:NSStringFromClass([PKNoItemsCell class])];
    
    @weakify(self);
    [_view setTopRefreshControlDidTriggerRefreshBlock:^()
    {
        @strongify(self);
        [self.pk_APIService fetchGithubUsersSince:0
                                   withCompletion:^(NSArray *result, NSError *error)
        {
            @strongify(self);
            if (!error && result.count)
            {
                [self.pk_tableViewDatasource setItems:result];
                [self->_view endTopRefreshing];
            }
        }];
    }];
    
    [_view setBottomRefreshControlDidTriggerRefreshBlock:^()
    {
         @strongify(self);
         [self.pk_APIService fetchGithubUsersSince:self.pk_tableViewDatasource.lastItem.paginationToken
                                    withCompletion:^(NSArray *result, NSError *error)
          {
              @strongify(self);
              if (!error && result.count)
              {
                  [self.pk_tableViewDatasource addItems:result];
                  [self->_view endBottomRefreshing];
              }
          }];
     }];
}

- (PKGithubUsersView*)view
{
    return _view;
}

@end
