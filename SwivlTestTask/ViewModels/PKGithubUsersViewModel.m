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

@interface PKGithubUsersViewModel ()
{
    PKGithubUsersView *_view;
}

@property (weak, nonatomic) PKTableViewDataSource   *pk_tableViewDatasource;
@property (weak, nonatomic) PKAPIService            *pk_APIService;

@end

@implementation PKGithubUsersViewModel

#pragma mark - getter/setter

- (void)setView:(PKGithubUsersView *)view
{
    _view = view;
    
    [_view setTableViewDelegate:self.pk_tableViewDatasource];
    [_view setTableViewDataSource:self.pk_tableViewDatasource];
    
    @weakify(self);
    [_view setTopRefreshControlDidTriggerRefreshBlock:^()
    {
        @strongify(self);
        [self.pk_APIService fetchGithubUsersSince:0 withCompletion:^(NSArray *result, NSError *error)
        {
            @strongify(self);
            if (!error && result.count)
            {
                [self.pk_tableViewDatasource setItems:result];
                [self->_view endTopRefreshing];
            }
        }];
    }];
    
    [_view setTopRefreshControlDidTriggerRefreshBlock:^()
     {
         @strongify(self);
         [self.pk_APIService fetchGithubUsersSince:0 withCompletion:^(NSArray *result, NSError *error)
          {
              @strongify(self);
              if (!error && result.count)
              {
                  [self.pk_tableViewDatasource setItems:result];
                  [self->_view endTopRefreshing];
              }
          }];
     }];
}

- (PKGithubUsersView*)view
{
    return _view;
}

@end
