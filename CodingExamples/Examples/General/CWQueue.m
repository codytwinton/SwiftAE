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

@property (strong) NSMutableArray *theItems;

@end

@implementation CWQueue

-(id)init {
	if (self = [super init]) {
		_theItems = NSMutableArray.new;
	}

	return  self;
}

- (NSUInteger) count {
	return _theItems.count;
}

- (NSArray *) items {
	return _theItems;
}

- (BOOL) isEmpty {
	return _theItems.count == 0;
}

- (nullable id) peek {
	return [_theItems firstObject];
}

- (nullable id) dequeue {
	id item = [self peek];
	if (item == nil) { return nil; }
	[_theItems removeObjectAtIndex:0];
	return item;
}

- (void)enqueue:(nullable id)item {
	if (item == nil) { return; }
	[_theItems addObject:item];
}

- (void)clear {
	[_theItems removeAllObjects];
}

@end

NS_ASSUME_NONNULL_END
