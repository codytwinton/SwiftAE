//
//  NSString+NSString_PowerSet.m
//  CodingExamplesObjC
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import "NSString_PowerSet.h"

@implementation NSString (NSString_PowerSet)

@dynamic powerSet;

- (NSSet *)powerSet {

	NSMutableSet *set = [NSMutableSet setWithArray:@[@""]];

	for (int i = 0; i < self.length; i++) {
		NSString *next = [self substringWithRange:NSMakeRange(i, 1)];
		NSMutableSet *update = [NSMutableSet setWithArray:@[@""]];

		for (NSString *pre in set) {
			[update addObject: [pre stringByAppendingString:next]];
		}

		[set unionSet:update];
	}

	return set;
}

@end
