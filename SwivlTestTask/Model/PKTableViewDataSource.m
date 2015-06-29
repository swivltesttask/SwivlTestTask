//
//  PKTableViewDataSource.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKTableViewDataSource.h"
#import "PKConfigurable.h"

@interface PKTableViewDataSource ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listItems;
@property (nonatomic, strong) NSMutableDictionary *reuseIdentifiers;

@end

@implementation PKTableViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.reuseIdentifiers = [NSMutableDictionary new];
    }
    return self;
}

- (void)registerCellWithNibName:(NSString*)nibName forItemClassName:(NSString *)className
{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibName];
    self.reuseIdentifiers[className] = nibName;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listItems.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PKListItem> item = self.listItems[indexPath.row];
    
    UITableViewCell<PKConfigurable> *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifiers[NSStringFromClass([item class])]];
    if ([cell conformsToProtocol:@protocol(PKConfigurable)])
    {
        [cell configureWithItem:item];
    }
    
    return cell;
}

- (void)setItems:(NSArray *)items
{
    self.listItems = [items mutableCopy];
    [self.tableView reloadData];
}

- (void)addItems:(NSArray *)items
{
    [self.tableView beginUpdates];
    NSMutableArray *indexPathsArray = [NSMutableArray arrayWithCapacity:items.count];
    [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        [indexPathsArray addObject:[NSIndexPath indexPathForRow:idx + self.listItems.count inSection:0]];
    }];
    [self.listItems addObject:items];
    [self.tableView insertRowsAtIndexPaths:indexPathsArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (id<PKListItem>)lastItem
{
    return self.listItems.lastObject;
}

@end
