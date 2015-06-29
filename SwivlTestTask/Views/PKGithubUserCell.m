//
//  PKGithubUserCell.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKGithubUserCell.h"

#import "PKGithubUser.h"
#import <SDWebImage/SDWebImageManager.h>

@interface PKGithubUserCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;

@property (nonatomic, strong) NSString *avatarURL;

@end

@implementation PKGithubUserCell

@synthesize avatarURL = _avatarURL;

- (void)configureWithItem:(PKGithubUser*)item
{
    self.usernameLabel.text = item.username;
    
    self.linkLabel.attributedText = [[NSAttributedString alloc] initWithString:item.htmlURL
                                                                    attributes:@{
                                                                                 NSUnderlineStyleAttributeName  :@(NSUnderlineStyleSingle),
                                                                                 NSForegroundColorAttributeName :[UIColor blueColor]
                                                                                 }
                                     ];
    self.avatarURL = item.avatarURL;
}

- (void)setAvatarURL:(NSString *)avatarURL
{
    if (![avatarURL isEqualToString:_avatarURL])
    {
        _avatarURL = avatarURL;
        @weakify(self);
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:avatarURL]
                                                        options:SDWebImageRetryFailed
                                                       progress:nil
                                                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL)
        {
            @strongify(self);
            if ([self.avatarURL isEqualToString:avatarURL])
            {
                self.avatarImageView.image = image;
            }
        }];
    }
}

- (NSString*)avatarURL
{
    return _avatarURL;
}

@end
