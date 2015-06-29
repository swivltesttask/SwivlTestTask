//
//  PKConstants.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

typedef void(^PKInfoBlock)();
typedef void(^PKSuccessErrorBlock)(NSError *error);
typedef void(^PKSuccessErrorResultBlock)(id result, NSError *error);
typedef void(^PKSuccessErrorResultArrayBlock)(NSArray *result, NSError *error);