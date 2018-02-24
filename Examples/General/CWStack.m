//
//  CWStack.m
//  Examples
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import "CWStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface CWStack()

@property (strong) NSMutableArray *items;

@end

@implementation CWStack

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
	return [items lastObject];
}

- (nullable id) pop {
	id item = [self peek];
	if (item == nil) { return nil; }
	[items removeLastObject];
	return item;
}

- (void)push:(nullable id)item {
	if (item == nil) { return; }
	[items addObject:item];
}

- (void)clear {
	[items removeAllObjects];
}

@end

NS_ASSUME_NONNULL_END

