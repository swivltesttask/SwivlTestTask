//
//  main.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PKAppDelegate.h"
#import "PKTestAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc,
                                 argv,
                                 nil,
                                 NSStringFromClass(NSClassFromString(@"XCTest") ?
                                                   [PKTestAppDelegate class] :
                                                   [PKAppDelegate class]
                                                   )
                                 );
    }
}
