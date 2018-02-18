//
//  CodingExamplesObjCTests.m
//  CodingExamplesObjCTests
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString_PowerSet.h"

@interface CodingExamplesObjCTests : XCTestCase

@end

@implementation CodingExamplesObjCTests

- (void)setUp {
    [super setUp];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

	// Arrange

	NSString *test = @"abc";
	NSSet *expected = [NSSet setWithArray:@[@"", @"a", @"ab", @"ac", @"abc", @"b", @"bc", @"c"]];

	// Act

	NSSet *actual = test.powerSet;

	// Assert
	XCTAssertTrue([actual isEqualToSet:expected]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
