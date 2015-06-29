//
//  PKTableViewDataSource.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKListItem.h"
#import "PKTableViewDataSourceProtocol.h"

@interface PKTableViewDataSource : NSObject <AppleGuiceInjectable, PKTableViewDataSourceProtocol>

- (void)setItems:(NSArray*)items;
- (void)addItems:(NSArray*)items;
- (id<PKListItem>)lastItem;

@end
