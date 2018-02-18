//
//  NSString+Extensions.h
//  CodingExamples
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extensions)

@property (nonatomic, readonly, strong) NSSet<NSString *> *powerSet;

@end

NS_ASSUME_NONNULL_END
