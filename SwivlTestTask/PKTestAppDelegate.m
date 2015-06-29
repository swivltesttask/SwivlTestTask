//
//  PKTestAppDelegate.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKTestAppDelegate.h"

@implementation PKTestAppDelegate

+ (void)initialize
{
    [AppleGuice setInstanceCreationPolicy:AppleGuiceInstanceCreationPolicyLazyLoad];
    [AppleGuice setMethodInjectionPolicy:AppleGuiceMethodInjectionPolicyAutomatic];
    [AppleGuice setIocPrefix:@"_pk_"];
    [AppleGuice startServiceWithImplementationDiscoveryPolicy:AppleGuiceImplementationDiscoveryPolicyRuntime];
}

@end
