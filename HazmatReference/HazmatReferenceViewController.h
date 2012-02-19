//
//  HazmatReferenceViewController.h
//  HazmatReference
//
//  Created by Eduardo Arino De La Rubia on 2/18/12.
//  Copyright (c) 2012 Global Tetrahedron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HazmatReferenceViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *hazmatCode;
@property (weak, nonatomic) IBOutlet UITextView *hazmatCodeDescription;


@end
