//
//  RegisterViewController.m
//  MedicalApp
//
//  Created by test on 11/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *mediOutLet;
@property (weak, nonatomic) IBOutlet UIButton *docOutLet;
@property (weak, nonatomic) IBOutlet UIButton *patientOutl;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@property (strong,nonatomic)NSArray* imageArray;
@property (strong,nonatomic)NSArray* nameArray;
- (IBAction)dismiss:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageArray = @[@"patient",@"doctor",@"insurance",@"diagnostic",@"medical",@"gym",@"therpy",@"diet"];
    
    self.nameArray = @[@"Patient",@"Doctor",@"Insurance",@"Diagnostic",@"Medical",@"Gym",@"Therpy",@"Diet"];
    self.secondView.layer.cornerRadius=5;
    
    self.logoImageView.layer.cornerRadius=50;
    
    self.patientOutl.layer.cornerRadius=5;
    self.docOutLet.layer.cornerRadius=5;
    self.mediOutLet.layer.cornerRadius=5;
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
#pragma mark - Collection view Delegate methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.displayImage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.nameArray[indexPath.row]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:[self.imageArray objectAtIndex:indexPath.row] sender:self];
    
    
    
    
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
