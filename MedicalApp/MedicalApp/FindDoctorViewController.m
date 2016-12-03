//
//  FindDoctorViewController.m
//  MedicalApp
//
//  Created by test on 11/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "FindDoctorViewController.h"

@interface FindDoctorViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSArray* imageArray;
@property (strong,nonatomic)NSArray* mainNameArray;
@property (strong,nonatomic)NSArray* subTitleArray;


@end

@implementation FindDoctorViewController
{
    BOOL isSearching;
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageArray = @[@"dentist1",@"doctor1",@"insurance1",@"diagnostic1",@"medicals1",@"gym1",@"therpy1"];
    
    self.mainNameArray = @[@"Dentist",@"Doctor",@"Insurance",@"Labs",@"Medical Stores",@"Fitness",@"Theraphy"];
    
    self.subTitleArray = @[@"search for dentist",@"Search For Doctors",@"Search for Labs",@"phsician near by you",@"Search For Medicals",@"Search For Fitness Center",@"Search For Theraphy"];
    
   // self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
   // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //[[[self.navigationController navigationBar] topItem] setTitle:@"The Title"];
    
 self.navigationItem.leftBarButtonItem.title = @"Location";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearching) {
        return [filteredContentList count];
    }
    else {
        return [self.imageArray count];
    }
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (isSearching) {
        cell.textLabel.text = [filteredContentList objectAtIndex:indexPath.row];
    }
    else{
        
       // cell.displayImage.layer.cornerRadius = 30;
    cell.displayImage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    
    cell.fNameLabel.text = [NSString stringWithFormat:@"%@",self.mainNameArray[indexPath.row]];
    
    cell.sNameLabel.text = [NSString stringWithFormat:@"%@",self.subTitleArray[indexPath.row]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"scene" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d",isSearching);
    
    //Remove all objects first.
    [filteredContentList removeAllObjects];
    
    if([searchText length] != 0) {
        isSearching = YES;
        [self searchTableList];
    }
    else {
        isSearching = NO;
    }
    // [self.tblContentList reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}
- (void)searchTableList {
    NSString *searchString = self.searchBar.text;
    
    for (NSString *tempStr in contentList) {
        NSComparisonResult result = [tempStr compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
        if (result == NSOrderedSame) {
            [filteredContentList addObject:tempStr];
        }
    }
}

@end
