//
//  PKConfigurable.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKItem.h"

@protocol PKConfigurable <NSObject>

- (void)configureWithItem:(id<PKItem>)item;

@end
