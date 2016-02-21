//
//  FISReposDataStore.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISReposDataStore.h"
#import "FISGithubAPIClient.h"

@implementation FISReposDataStore

+ (instancetype)sharedDataStore {
    static FISReposDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISReposDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories = [NSMutableArray new];
    }
    return self;
}

- (void)getRepositoriesWithCompletion:(void (^)(BOOL success))completionBlock {
    
    [FISGithubAPIClient getRepositoriesWithCompletion:^(NSArray <NSDictionary *> *repositories) {
        
        if (!repositories) {
            completionBlock(NO);
            return;
        }
        
        NSDictionary *dictionary;
        for (NSUInteger i = 0; i < repositories.count; i++) {
            dictionary = repositories[i];
            [self.repositories addObject:[FISGithubRepository repoFromDictionary:dictionary]];
        }
        completionBlock(YES);
    }];
}

@end
