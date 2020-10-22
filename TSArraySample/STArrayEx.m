//
//  STArrayEx.m
//  TSArraySample
//
//  Created by apple on 2020/10/22.
//  Copyright © 2020 apple. All rights reserved.
//

#import "STArrayEx.h"

@implementation STArrayEx
- (instancetype)init {
    self = [super init];
    self->mArray = [NSMutableArray new];
    self->controlQueue = dispatch_queue_create("com.blah.queue", DISPATCH_QUEUE_SERIAL);
    return self;
}

- (void)add:(id)object {
    assert(object != nil);
    dispatch_async(self->controlQueue, ^{
        NSLog(@"%d", [NSThread isMainThread]);
        [self->mArray addObject:object];
    });
}

- (void)remove:(id)object {
    assert(object != nil);
    dispatch_async(self->controlQueue, ^{
        NSLog(@"%d", [NSThread isMainThread]);
        NSUInteger index = [self->mArray indexOfObject:object];
        if (index != NSNotFound) {
            [self->mArray addObject:object];
        }
    });
}

- (long long)count {
    __block long long count = 0;
    dispatch_sync(self->controlQueue, ^{
        count = self->mArray.count;
    });
    return count;
}
@end
