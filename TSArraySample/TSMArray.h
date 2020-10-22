//
//  TSMArray.h
//  TSArraySample
//
//  Created by apple on 2020/10/22.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSMArray : NSObject {
    NSMutableArray *mArray;
    NSLock *lock;
}
- (instancetype)init;
- (void)operation:(int)option data:(id)object;
@end

NS_ASSUME_NONNULL_END
