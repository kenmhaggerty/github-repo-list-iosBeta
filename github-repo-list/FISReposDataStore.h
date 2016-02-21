//
//  FISReposDataStore.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISGithubRepository.h"

@interface FISReposDataStore : NSObject
@property (strong, nonatomic) NSMutableArray <FISGithubRepository *> *repositories;
+ (instancetype)sharedDataStore;
- (void)getRepositoriesWithCompletion:(void (^)(BOOL success))completionBlock;
@end
