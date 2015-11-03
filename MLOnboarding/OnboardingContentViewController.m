//
//  ViewController.m
//  MLOnboarding
//
//  Created by Matthias Ludwig on 03.11.15.
//  Copyright © 2015 Matthias Ludwig. All rights reserved.
//

#import "OnboardingContentViewController.h"

@interface OnboardingContentViewController ()
@property (nonatomic, copy) NSString *theTitle;
@end

@implementation OnboardingContentViewController

#pragma mark - ViewLifeCycle

- (instancetype)initWithTitle:(NSString *)inTitle {
    if (self = [super init]) {
        self.theTitle = inTitle;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = self.theTitle;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label];

    NSDictionary *views = @{
            @"label": label
    };

    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|" options:kNilOptions metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:kNilOptions metrics:nil views:views]];


}

@end
