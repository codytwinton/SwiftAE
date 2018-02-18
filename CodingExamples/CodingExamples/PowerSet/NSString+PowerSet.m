//
//  NSString+Extensions.m
//  CodingExamples
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import "NSString+PowerSet.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSString (PowerSet)

// MARK: - Power Set

- (NSSet<NSString *> *) powerSet {

	NSMutableSet<NSString *> *set = [NSMutableSet setWithArray:@[@""]];

	for (int i = 0; i < self.length; i++) {
		NSString *next = [self substringWithRange:NSMakeRange(i, 1)];
		NSMutableSet<NSString *> *update = NSMutableSet.new;

		for (NSString *pre in set) {
			[update addObject: [pre stringByAppendingString:next]];
		}

		[set unionSet:update];
	}

	return set;
}

- (NSSet<NSString *> *) powerSetRecursion {
	return [NSString powerSetRecursionForString:self];
}

+ (NSSet<NSString *> *) powerSetRecursionForString:(NSString *)str {
	NSMutableSet<NSString *> *set = [NSMutableSet setWithArray:@[@"", str]];
	if (str.length <= 1) { return set; }

	for (int i = 0; i < str.length; i++) {
		NSString *first = [str substringWithRange:NSMakeRange(0, i)];
		NSString *second = [str substringWithRange:NSMakeRange(i + 1, str.length - i - 1)];

		NSSet<NSString *> *sub = [self powerSetRecursionForString:[first stringByAppendingString:second]];
		[set unionSet:sub];
	}

	return set;
}

@end

NS_ASSUME_NONNULL_END
