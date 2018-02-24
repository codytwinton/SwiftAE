//
//  CWStack.h
//  Examples
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWStack : NSObject

@property (readonly) NSUInteger count;
@property (readonly) BOOL isEmpty;
@property (readonly) NSArray *items;

- (nullable id)peek;
- (void)push:(nullable id)item;
- (nullable id)pop;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
