//
//  PKGithubUsersView.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

@interface PKGithubUsersView : UIView

- (void)setTableViewDelegate:(id<UITableViewDelegate>)delegate;
- (void)setTableViewDataSource:(id<UITableViewDelegate>)dataSource;
- (void)endTopRefreshing;
- (void)endBottomRefreshing;
- (void)setTopRefreshControlDidTriggerRefreshBlock:(PKInfoBlock)block;
- (void)setBottomRefreshControlDidTriggerRefreshBlock:(PKInfoBlock)block;

@end
