//
//  PKTableViewDataSourceProtocol.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

@protocol PKTableViewDataSourceProtocol <NSObject, UITableViewDelegate, UITableViewDataSource>

- (void)setTableView:(UITableView*)tableView;
- (UITableView*)tableView;

- (void)registerCellWithNibName:(NSString*)nibName forItemClassName:(NSString*)className;

@end
