//
//  Model.m
//  GitHubTrending
//
//  Created by Andres Diez on 2016-08-15.
//  Copyright © 2016 Andres Diez. All rights reserved.
//

#import "Model.h"
#import <AFNetworking/AFNetworking.h>

@interface Model()

@property (nullable, nonatomic, strong) NSArray *value;
@property NSString *URLADD;
@property NSInteger length;

@end


@implementation Model

-(void) loadModel:(void(^)())callBack{
    NSString * URLADD=@"https://api.github.com/search/repositories?q=starts:%3E100&sort=stars&order=asc";
    
    NSURL *URL = [NSURL URLWithString:URLADD];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    __weak typeof(self) weakSelf = self;
    
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        weakSelf.value = responseObject[@"items"];
        weakSelf.isLoaded = YES;
        weakSelf.length=[weakSelf.value count];
        callBack();
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(NSString*) row:(NSInteger)index{
    return self.value[index][@"name"];
}

-(NSDictionary*) detail:(NSInteger)index{
    return self.value[index];
}

-(NSUInteger)getLength{
    return self.length;
}


@end
