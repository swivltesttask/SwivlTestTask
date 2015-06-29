//
//  PKBaseViewController.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKBaseViewController.h"

@interface PKBaseViewController ()

@end

@implementation PKBaseViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [AppleGuice injectImplementationsToInstance:self];
    }
    return self;
}

@end
