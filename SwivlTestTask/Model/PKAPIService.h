//
//  PKAPIService.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

@interface PKAPIService : NSObject <AppleGuiceInjectable, AppleGuiceSingleton>

- (void)fetchGithubUsersSince:(NSUInteger)since withCompletion:(PKSuccessErrorResultArrayBlock)completion;

@end
