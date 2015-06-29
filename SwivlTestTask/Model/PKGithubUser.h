//
//  PKGithubUser.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKListItem.h"

@interface PKGithubUser : NSObject <PKListItem>

@property (nonatomic, assign)   NSUInteger userId;
@property (nonatomic, copy)     NSString *username;
@property (nonatomic, strong)   NSString *avatarURL;
@property (nonatomic, strong)   NSString *htmlURL;

@end
