//
//  CWQueue.h
//  Examples
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWQueue : NSObject

@property (readonly) NSUInteger count;
@property (readonly) BOOL isEmpty;
@property (readonly) NSArray *items;

- (nullable id)peek;
- (void)enqueue:(nullable id)item;
- (nullable id)dequeue;
- (void)clear;

@end

NS_ASSUME_NONNULL_END

