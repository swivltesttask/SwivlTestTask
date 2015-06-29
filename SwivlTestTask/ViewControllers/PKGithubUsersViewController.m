//
//  PKGithubUsersViewController.m
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/28/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import "PKGithubUsersViewController.h"

#import "PKGithubUsersViewModel.h"
#import "PKGithubUsersView.h"

@interface PKGithubUsersViewController ()

@property (weak, nonatomic) IBOutlet UIView *githubUsersContainerView;

@property (strong, nonatomic) PKGithubUsersView *githubUsersView;
@property (strong, nonatomic) PKGithubUsersViewModel *pk_viewModel;

@end

@implementation PKGithubUsersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.githubUsersView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PKGithubUsersView class]) owner:nil options:nil] firstObject];
    [self.pk_viewModel setView:self.githubUsersView];
    
    [self.githubUsersContainerView addSubview:self.githubUsersView];
    EMBED_VIEW_INTO_VIEW_WITH_EDGE_INSETS(self.githubUsersView, self.githubUsersContainerView, UIEdgeInsetsZero);
}

@end
