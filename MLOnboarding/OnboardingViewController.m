//
//  OnboardingViewController.m
//  MLOnboarding
//
//  Created by Matthias Ludwig on 03.11.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"


@interface OnboardingViewController ()<UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation OnboardingViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    OnboardingContentViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[initialViewController];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    NSDictionary *views = @{
                            @"pageViewController": self.pageViewController.view
                            };
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewController]|" options:kNilOptions metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[pageViewController]|" options:kNilOptions metrics:nil views:views]];
}

#pragma mark - Helper
- (OnboardingContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    OnboardingContentViewController *childViewController = [[OnboardingContentViewController alloc] init];
    childViewController.index = index;
    
    return childViewController;
    
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    OnboardingContentViewController *onboardingContentViewController = (OnboardingContentViewController *)viewController;
    NSUInteger index = onboardingContentViewController.index;
    if (index == 0) {
        return nil;
    }

    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    OnboardingContentViewController *onboardingContentViewController = (OnboardingContentViewController *)viewController;
    NSUInteger index = onboardingContentViewController.index;
    
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


@end
