//
//  RootViewController.m
//  PageViewDemo
//
//  Created by abc on 18/02/15.
//  Copyright (c) 2015 com.TheAppGuruz. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property(strong,nonatomic)NSString* arrString;
@property (weak, nonatomic) IBOutlet UIButton *registerOutLt;
@end

@implementation RootViewController

@synthesize PageViewController,arrPageTitles,arrPageImages;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrPageTitles = @[@"Patient",@"Doctor",@"Medicals",@"Gym",@"Diagnostics"];
   // self.arrPageTitles = @[@"Register For Patient",@"Register For Doctor",@"Register For Medicals",@"Register For Diagnostics",@"Register For Patient Gym"];
    arrPageImages =@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    self.nameLabl.text = [NSString stringWithFormat:@"%@",self.arrPageTitles];
    self.skipButton.layer.cornerRadius=5;
    self.registerButton.layer.cornerRadius=5;
    
    // Create page view controller
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.PageViewController.dataSource = self;
    
   
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.PageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50);
    
    [self addChildViewController:PageViewController];
    [self.view addSubview:PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
   [self setupPageControl];
}
- (void)setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor:[UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[UIColor blackColor]];
   // [[UIPageControl appearance] setBackgroundColor:[UIColor darkGrayColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Page View Datasource Methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    if (index == [self.arrPageTitles count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

#pragma mark - Other Methods
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.arrPageTitles count] == 0) || (index >= [self.arrPageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imgFile = self.arrPageImages[index];
    pageContentViewController.txtTitle = self.arrPageTitles[index];
    pageContentViewController.pageIndex = index;
    NSLog(@"%@ index",arrPageTitles[index]);
    
    //[self.registerOutLt setTitle:self.arrPageTitles[index] forState:UIControlStateNormal];
    
    self.arrString = self.registerArray[index];
    
    NSLog(@"%@ string",self.arrString);
    
    return pageContentViewController;
}

#pragma mark - No of Pages Methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.arrPageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)btnStartAgain:(id)sender
{
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (IBAction)registerButton:(id)sender
{
       
}
@end
