//
//  PKGithubUsersViewModel.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

@class PKGithubUsersView;

@interface PKGithubUsersViewModel : NSObject <AppleGuiceInjectable>

@property (nonatomic, weak) PKGithubUsersView *view;

@end
