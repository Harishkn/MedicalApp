//
//  BookDoctorViewController.m
//  MedicalApp
//
//  Created by test on 12/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "BookDoctorViewController.h"

@interface BookDoctorViewController ()

@end

@implementation BookDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorTableViewCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.dNameLbl.text = @"Harish";
    
    cell.specializedLbl.text = @"Dentist";
    
    cell.addressLbl.text = @"Vijayanagar 6th main ";
    
    cell.secondView.layer.cornerRadius = 5;
    

    return cell;
}

@end
