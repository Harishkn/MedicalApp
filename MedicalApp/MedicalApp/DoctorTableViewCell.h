//
//  DoctorTableViewCell.h
//  MedicalApp
//
//  Created by test on 12/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *specializedLbl;
@property (weak, nonatomic) IBOutlet UILabel *addressLbl;
- (IBAction)likeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)bookAppointment:(id)sender;

@end
