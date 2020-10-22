//
//  STArrayEx.h
//  TSArraySample
//
//  Created by apple on 2020/10/22.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STArrayEx : NSObject {
    NSMutableArray *mArray;
    dispatch_queue_t controlQueue;
}
- (instancetype)init;
- (void)add:(id)object;
- (void)remove:(id)object;
- (long long)count;
@end

NS_ASSUME_NONNULL_END
