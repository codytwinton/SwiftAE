//
//  CWQueue.m
//  Examples
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import "CWQueue.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWQueue()

@property (strong) NSMutableArray *items;

@end

@implementation CWQueue

@synthesize items;

-(id)init {
	if (self = [super init]) {
		items = NSMutableArray.new;
	}

	return  self;
}

- (NSUInteger) count {
	return items.count;
}

- (BOOL) isEmpty {
	return items.count == 0;
}

- (nullable id) peek {
	return [items firstObject];
}

- (nullable id) dequeue {
	id item = [self peek];
	if (item == nil) { return nil; }
	[items removeObjectAtIndex:0];
	return item;
}

- (void)enqueue:(nullable id)item {
	if (item == nil) { return; }
	[items addObject:item];
}

- (void)clear {
	[items removeAllObjects];
}

@end

NS_ASSUME_NONNULL_END
