//
//  ViewController.m
//  OBCNetworkProcessing
//
//  Created by Conny Yang on 3/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ViewController.h"
#import "NetworkProcessing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * urlString = @"https://api.darksky.net/forecast/33c371344898311931ea3058dcc4730f/42.3601,-71.0589";
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NetworkProcessing * networkProcessing = [[NetworkProcessing alloc]init:urlRequest];
    NSLog(@"----------Download Now-------------");
    [networkProcessing downloadJSON:^(NSDictionary *dic, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",dic);
        });
        
    }];
    
    
    NSLog(@"----------Download End-------------");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
