//
//  NSString+Extensions.m
//  CodingExamples
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import "NSString+Extensions.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSString (Extensions)

- (NSSet<NSString *> *) powerSet {

	NSMutableSet<NSString *> *set = [NSMutableSet setWithArray:@[@""]];

	for (int i = 0; i < self.length; i++) {
		NSString *next = [self substringWithRange:NSMakeRange(i, 1)];
		NSMutableSet<NSString *> *update = [NSMutableSet setWithArray:@[@""]];

		for (NSString *pre in set) {
			[update addObject: [pre stringByAppendingString:next]];
		}

		[set unionSet:update];
	}

	return set;
}

@end

NS_ASSUME_NONNULL_END
