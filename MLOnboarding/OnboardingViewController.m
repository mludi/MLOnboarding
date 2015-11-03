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
@property (nonatomic, strong) NSArray *theViewControllers;
@end

@implementation OnboardingViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    OnboardingContentViewController *firstViewController = [[OnboardingContentViewController alloc] initWithTitle:@"Content Controller 1"];
    OnboardingContentViewController *secondViewController = [[OnboardingContentViewController alloc] initWithTitle:@"Content Controller 2"];
    OnboardingContentViewController *thirdViewController = [[OnboardingContentViewController alloc] initWithTitle:@"Content Controller 3"];
    self.theViewControllers = @[firstViewController, secondViewController, thirdViewController];
    
    NSAssert([self.theViewControllers count] >= 1, @"1 Controller is required");
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    [self.pageViewController setViewControllers:@[self.theViewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    NSDictionary *views = @{
                            @"pageViewController": self.pageViewController.view
                            };
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewController]|" options:kNilOptions metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[pageViewController]|" options:kNilOptions metrics:nil views:views]];
}


#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    if (!viewController) {
        return self.theViewControllers[0];
    }
    NSUInteger index = [self.theViewControllers indexOfObject:viewController];
    NSParameterAssert(index != NSNotFound);
    if (index <= 0) {
        return nil;
    }
    // return previous controller
    return self.theViewControllers[index - 1];
    

}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (!viewController) {
        return self.theViewControllers[0];
    }
    NSUInteger index = [self.theViewControllers indexOfObject:viewController];
    NSParameterAssert(index != NSNotFound);
    if (index >= [self.theViewControllers count] - 1) {
        // we're at the end of the self.theViewControllers array
        return nil;
    }
    // return next controller
    return self.theViewControllers[index + 1];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.theViewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}


@end
