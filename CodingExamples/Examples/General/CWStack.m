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

@property (strong) NSMutableArray *theItems;

@end

@implementation CWStack

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
	return [_theItems lastObject];
}

- (nullable id) pop {
	id item = [self peek];
	if (item == nil) { return nil; }
	[_theItems removeLastObject];
	return item;
}

- (void)push:(nullable id)item {
	if (item == nil) { return; }
	[_theItems addObject:item];
}

- (void)clear {
	[_theItems removeAllObjects];
}

@end

NS_ASSUME_NONNULL_END

