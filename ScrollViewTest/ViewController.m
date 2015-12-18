//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Work on 17/12/15.
//  Copyright © 2015 spraveenk91. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong, getter=generateDummyTextFromPlist) NSString *dummyText;

@end

@implementation ViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect labelFrame = self.instructionsLabel.frame; // Keep the current frame value 😉
    
    self.instructionsLabel.text = self.dummyText;
    
    CGRect labelRect = [self.dummyText boundingRectWithSize:CGSizeMake(labelFrame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:17] } context:nil];
    
    self.instructionsLabel.frame = CGRectMake(labelFrame.origin.x, labelFrame.origin.y, labelFrame.size.width, labelRect.size.height);
}

/*
 * Modify the scorllview.contentSize here
 */
- (void)viewDidLayoutSubviews {
    self.submitButton.frame = CGRectMake(self.submitButton.frame.origin.x, self.instructionsLabel.frame.origin.y + self.instructionsLabel.frame.size.height + 35.0, self.submitButton.frame.size.width, self.submitButton.frame.size.height); // Setting button frame here because label frame alignment finishes here 😜😜
    
    self.registrationScrollView.contentSize = CGSizeMake(self.registrationScrollView.frame.size.width, self.submitButton.frame.origin.y + self.submitButton.frame.size.height); // Finally set the content size here to finish the scrollView scrolling 😍
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Getter method to get text from Info.Plist
/**
 * Method to generate the dummy text from Project's Info.Plist file
 * @return Returns generated text from Plist File
 */
- (NSString *)generateDummyTextFromPlist {
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    return dict[@"dummyText"];
}

@end
