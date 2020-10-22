//
//  TSMArray.m
//  TSArraySample
//
//  Created by apple on 2020/10/22.
//  Copyright © 2020 apple. All rights reserved.
//

#import "TSMArray.h"

@implementation TSMArray
- (instancetype)init {
    self = [super init];
    self->mArray = [NSMutableArray new];
    self->lock = [NSLock new];
    return self;
}

- (void)operation:(int)option data:(id)object {
    
    assert(object != nil);
    [lock lock];
    if (option == 0) {
        [self->mArray addObject:object];
    } else if (option == 1) {
        NSUInteger index = [self->mArray indexOfObject:object];
        if (index != NSNotFound) {
            [self->mArray removeObjectAtIndex:index];
        }
    }
    [lock unlock];
}
@end
