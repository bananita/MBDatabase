//
//  MBDetailViewController.h
//  MBDatabase
//
//  Created by Michał Banasiak on 10/14/13.
//  Copyright (c) 2013 SO MANY APPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
