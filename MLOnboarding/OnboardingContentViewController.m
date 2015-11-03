//
//  ViewController.m
//  MLOnboarding
//
//  Created by Matthias Ludwig on 03.11.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "OnboardingContentViewController.h"

@interface OnboardingContentViewController ()

@end

@implementation OnboardingContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"Screen Number: %ld", (long)self.index];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label];

    NSDictionary *views = @{
            @"label": label
    };

    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:kNilOptions metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:kNilOptions metrics:nil views:views]];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
