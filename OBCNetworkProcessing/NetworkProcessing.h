//
//  NetworkProcessing.h
//  OBCNetworkProcessing
//
//  Created by Conny Yang on 4/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkProcessing : NSObject
{
    NSURLRequest *urlRequest;
}


@property (nonatomic, retain) NSURLRequest * urlRequest;

-(NetworkProcessing *)init:(NSURLRequest *)urlRequest;

-(void)downloadJSON: (void (^)(NSDictionary* dic, NSURLResponse * response, NSError * error)) completion;

@end
