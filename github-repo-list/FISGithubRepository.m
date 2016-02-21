//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

+ (instancetype)repoFromDictionary:(NSDictionary *)dictionary {
    
    FISGithubRepository *repository = [[FISGithubRepository alloc] init];
    [repository setFullName:dictionary[@"full_name"]];
    [repository setHtmlURL:[NSURL URLWithString:dictionary[@"html_url"]]];
    [repository setRepositoryID:[dictionary[@"id"] stringValue]];
    return repository;
}

- (BOOL)isEqual:(id)object {
    
    if (![object isKindOfClass:[FISGithubRepository class]]) return NO;
    
    FISGithubRepository *repository = (FISGithubRepository *)object;
    
    return (([self.fullName isEqualToString:repository.fullName]) && ([self.htmlURL isEqual:repository.htmlURL]) && ([self.repositoryID isEqualToString:repository.repositoryID]));
}

@end
