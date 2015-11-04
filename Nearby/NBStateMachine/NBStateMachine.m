//
//  NBStateMachine.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBStateMachine.h"

@implementation NBStateMachine
+(NBStateMachine*)instance
{
    static NBStateMachine *globalInstance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        globalInstance = [[NBStateMachine alloc] init];
        
    });
    return globalInstance;
}
@end
