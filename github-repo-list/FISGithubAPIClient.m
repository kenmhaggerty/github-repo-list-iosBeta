//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"
#import "FISPrivateInfo.h"

@implementation FISGithubAPIClient

+ (void)getRepositoriesWithCompletion:(void (^)(NSArray <NSDictionary *> *repositories))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:[FISGithubAPIClient stringForURL]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            completionBlock(nil);
            return;
        }
        
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        completionBlock(json);
    }] resume];
}

+ (NSString *)stringForURL {
    
    return [NSString stringWithFormat:@"https://api.github.com/repositories?client_id=%@&client_secret=%@", GithubClientID, GithubClientSecret];
}

@end
