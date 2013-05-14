//
//  ViewController.m
//  AirturnPedalInput
//
//  Created by Liam Dunne on 14/05/2013
//  Copyright (c) 2013 Lmd64. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    driver = [[AirturnPedalDriver alloc] initWithDelegate:self];
    [self.view addSubview:driver];
}

- (void)viewDidAppear:(BOOL)animated{
    [driver startMonitoring];
}

- (void)didReceiveInput:(NSString *)key{
    NSLog(@"Input received : %@",key);
}

@end
