//
//  TableViewCell.h
//  MedicalApp
//
//  Created by test on 11/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UILabel *fNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sNameLabel;

@end
