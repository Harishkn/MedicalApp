//
//  RootViewController.h
//  PageViewDemo
//
//  Created by abc on 18/02/15.
//  Copyright (c) 2015 com.TheAppGuruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface RootViewController : UIViewController
<UIPageViewControllerDataSource>
@property (weak, nonatomic) IBOutlet UILabel *nameLabl;

@property (nonatomic,strong) UIPageViewController *PageViewController;
@property (nonatomic,strong) NSArray *arrPageTitles;
@property (nonatomic,strong) NSArray *arrPageImages;
@property(nonatomic,strong)NSArray* registerArray;

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index;

- (IBAction)btnStartAgain:(id)sender;

- (IBAction)registerButton:(id)sender;
@end
