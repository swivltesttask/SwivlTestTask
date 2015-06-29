//
//  PKAPIService.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKAPIService.h"

#import "PKGithubUser.h"

@implementation PKAPIService

- (void)fetchGithubUsersSince:(NSUInteger)since withCompletion:(PKSuccessErrorResultArrayBlock)completion
{
    PKSuccessErrorResultArrayBlock blk = [completion copy];

    NSString *requestString = [NSString stringWithFormat:@"https://api.github.com/users%@", since ? [NSString stringWithFormat:@"?since=%lu", (unsigned long)since] : @""];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestString]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (!connectionError)
        {
            NSHTTPURLResponse *httpResponse = [response isKindOfClass:[NSHTTPURLResponse class]] ? (NSHTTPURLResponse*)response : nil;
            if (httpResponse.statusCode != 200)
            {
                if (blk)
                {
                    blk(nil, [NSError new]);
                }
            }
            else
            {
                NSError *error = nil;
                
                NSArray *resultJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

                if (!error)
                {
                    if ([resultJSON isKindOfClass:[NSArray class]])
                    {
                        NSMutableArray *result = [NSMutableArray arrayWithCapacity:[resultJSON count]];

                        [resultJSON enumerateObjectsUsingBlock:^(NSDictionary *object, NSUInteger idx, BOOL *stop)
                        {
                            PKGithubUser *user  = [PKGithubUser new];
                            
                            user.userId         = [object[@"id"] unsignedIntegerValue];
                            user.username       = object[@"login"];
                            user.avatarURL      = object[@"avatar_url"];
                            
                            [result addObject:user];
                        }];
                        
                        if (blk)
                        {
                            blk(result, nil);
                        }
                    }
                    else
                    {
                        if (blk)
                        {
                            blk(nil, [NSError new]);
                        }
                    }
                }
                else
                {
                    if (blk)
                    {
                        blk(nil, error);
                    }
                }
            }
        }
        else
        {
            if (blk)
            {
                blk(nil, connectionError);
            }
        }
    }];
}

@end
