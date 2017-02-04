//
//  NetworkProcessing.m
//  OBCNetworkProcessing
//
//  Created by Conny Yang on 4/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "NetworkProcessing.h"

@implementation NetworkProcessing

-(void)init:(NSURLRequest *)urlRequest
{
    self.urlRequest = urlRequest;
}

-(void)downloadJSON: (void (^)(NSDictionary* dic, NSURLResponse * response, NSError * error)) completion
{
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[NSURLSession sharedSession] dataTaskWithRequest:self.urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(response == nil){
            
        }
        
        if(data == nil)
        {
        
        }
        else
        {
            NSHTTPURLResponse * httpResponse = response;
            switch([httpResponse statusCode]){
                case 200:{
                    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                    completion(json,response,error);
                    break;

                }
                default:
                    break;
                    
            }
        }
    }];
}

@end
