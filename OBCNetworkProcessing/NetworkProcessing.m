//
//  NetworkProcessing.m
//  OBCNetworkProcessing
//
//  Created by Conny Yang on 4/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "NetworkProcessing.h"

@implementation NetworkProcessing

-(NetworkProcessing *)init:(NSURLRequest *)urlRequest
{
    self.urlRequest = urlRequest;
    
    return self;
}

-(void)downloadJSON: (void (^)(NSDictionary* dic, NSURLResponse * response, NSError * error)) completion
{
    [[[NSURLSession sharedSession] dataTaskWithRequest:self.urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if ([[NSThread currentThread] isMainThread]){
            NSLog(@"In main thread--completion handler");
        }
        else{
            NSLog(@"Not in main thread--completion handler");
        }

        NSHTTPURLResponse * httpResponse;

        if(response != nil){
            httpResponse = response;
            
            if(data == nil)
            {
                
            }
            else
            {
                switch([httpResponse statusCode]){
                    case 200:{
                        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                        //NSLog(@"data:%@",data);

                        completion(json,response,error);
                        break;
                        
                    }
                    default:
                        break;
                        
                }
            }

        }
        
    }]resume];
}

@end
