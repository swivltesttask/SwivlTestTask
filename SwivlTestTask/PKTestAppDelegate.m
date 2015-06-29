//
//  PKTestAppDelegate.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKTestAppDelegate.h"

@implementation PKTestAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [AppleGuice setIocPrefix:@"pk_"];    
    [AppleGuice setInstanceCreationPolicy:AppleGuiceInstanceCreationPolicyCreateMocks];
    [AppleGuice startServiceWithImplementationDiscoveryPolicy:AppleGuiceImplementationDiscoveryPolicyRuntime];
    return YES;
}

@end
