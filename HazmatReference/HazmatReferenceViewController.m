//
//  HazmatReferenceViewController.m
//  HazmatReference
//
//  Created by Eduardo Arino De La Rubia on 2/18/12.
//  Copyright (c) 2012 Global Tetrahedron. All rights reserved.
//

#import "HazmatReferenceViewController.h"

@interface HazmatReferenceViewController()
@property (nonatomic, strong) NSDictionary * hazmatDB;
@end

@implementation HazmatReferenceViewController

@synthesize hazmatCode = _hazmatCode;
@synthesize hazmatCodeDescription = _hazmatCodeDescription;
@synthesize hazmatDB = _hazmatDB;

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.hazmatCode setDelegate:self];
}


- (NSDictionary *) hazmatDB 
{
    if (_hazmatDB == nil) {
        NSString *pathToPlist = [[NSBundle mainBundle]
                                    pathForResource:@"hazmat_codes"
                                    ofType:@"plist"];

        _hazmatDB = [NSDictionary dictionaryWithContentsOfFile:pathToPlist];
    }
    
    return _hazmatDB;
}

- (IBAction)findHazmatCode:(id)sender {
//    NSLog(@"Number of entries: %d", self.hazmatDB.count);
//    NSLog(@"Value of hazmat entry: %@", self.hazmatCode.text);
    
//    NSString* hazmatDescription = [self.hazmatDB valueForKey: self.hazmatCode.text];
//    NSLog(@"Description of hazmat entry: %@", hazmatDescription);
    
    //find a key that works
    NSArray *keyArray = [self.hazmatDB allKeys];
    int count = [keyArray count];
    bool found = NO;
    for (int i=0; i < count; i++) {
        NSString *key = [keyArray objectAtIndex:i];
        
        if ([key rangeOfString:self.hazmatCode.text].location != NSNotFound) {
            self.hazmatCodeDescription.text = [self.hazmatDB valueForKey: key];
            found = YES;
            break;
        }
    }
    
    if (! found) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Not Found"
                                                            message:[NSString stringWithFormat:@"Unable to find HazMat with code %@", self.hazmatCode.text]
                                                           delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self findHazmatCode:textField];
    return YES;
}

- (void)viewDidUnload {
    [self setHazmatCode:nil];
    [self setHazmatCodeDescription:nil];
    [super viewDidUnload];
}
@end
