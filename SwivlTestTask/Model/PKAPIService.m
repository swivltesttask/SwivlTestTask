//
//  PKAPIService.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKAPIService.h"

#import "PKGithubUser.h"

NSString * const PKGithubUsersAPIRequestPath        = @"https://api.github.com/users";
NSString * const PKGithubUsersAPISinceParameterName = @"since";

NSString * const PKGithubUserIdResponseKey          = @"id";
NSString * const PKGithubUserLoginResponseKey       = @"login";
NSString * const PKGithubUserAvatarURLResponseKey   = @"avatar_url";
NSString * const PKGithubUserHTMLURLResponseKey     = @"html_url";

#define PK_HTTP_OK 200

@implementation PKAPIService

- (void)fetchGithubUsersSince:(NSUInteger)since withCompletion:(PKSuccessErrorResultArrayBlock)completion
{
    PKSuccessErrorResultArrayBlock blk = [completion copy];

    NSString *requestString = [NSString stringWithFormat:@"%@%@", PKGithubUsersAPIRequestPath, since ? [NSString stringWithFormat:@"?%@=%lu", PKGithubUsersAPISinceParameterName, (unsigned long)since] : @""];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestString]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (!connectionError)
        {
            NSHTTPURLResponse *httpResponse = [response isKindOfClass:[NSHTTPURLResponse class]] ? (NSHTTPURLResponse*)response : nil;
            if (httpResponse.statusCode != PK_HTTP_OK)
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
                            
                            user.userId         = [object[PKGithubUserIdResponseKey] unsignedIntegerValue];
                            user.username       = object[PKGithubUserLoginResponseKey];
                            user.avatarURL      = object[PKGithubUserAvatarURLResponseKey];
                            user.htmlURL        = object[PKGithubUserHTMLURLResponseKey];
                            
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
