//
//  LevenshteinMachineTests.m
//  LevenshteinMachineTests
//
//  Created by Moshe on 11/6/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+Levenshtein.h"

@interface LevenshteinMachineTests : XCTestCase

@end

@implementation LevenshteinMachineTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLastCharacter
{
    NSString *sampleString = @"Hello World!";
    NSString *lastCharacter = [sampleString lastCharacter];
    
    XCTAssertEqualObjects(lastCharacter, @"!");
}

- (void)testShorterString
{
    NSString *sampleString = @"Watson, come here";
    NSString *shorterString = [sampleString substringMinusLastCharacter];
    
    XCTAssertEqualObjects(shorterString, @"Watson, come her");
}

@end
