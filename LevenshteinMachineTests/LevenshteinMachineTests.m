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
#import "LVMLevenshteinMachine.h"

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

- (void)testRecursiveLevenshteinCalculationForSimilarStrings
{
    NSString *kitten = @"kitten";
    NSString *mitten = @"mitten";
    
    LVMLevenshteinMachine *levenshtein  = [[LVMLevenshteinMachine alloc] init];
    
    NSInteger distance = [levenshtein levenshteinDistanceRecursiveBetweenString:kitten andString:mitten];
    
    XCTAssertEqual(distance, 1);
}

- (void)testRecursiveLevenshteinCalculationForOneEmptyString
{
    NSString *kitten = @"kitten";
    NSString *nilString = nil;
    
    LVMLevenshteinMachine *levenshtein  = [[LVMLevenshteinMachine alloc] init];
    
    NSInteger distance = [levenshtein levenshteinDistanceRecursiveBetweenString:kitten andString:nilString];
    
    XCTAssertEqual(distance, 6);
}

- (void)testRecursiveLevenshteinCalculationForDistantStrings
{
    NSString *moshe = @"Moshe";
    NSString *moish = @"Moish";
    
    LVMLevenshteinMachine *levenshtein  = [[LVMLevenshteinMachine alloc] init];
    
    NSInteger distance = [levenshtein levenshteinDistanceRecursiveBetweenString:moshe andString:moish];
    
    NSLog(@"Distance: %li", distance);
}

- (void)testClosestWordInSet
{
    
    NSString *needle = @"Ing";
    NSArray *haystack = @[@"Boylan", @"Ingersoll", @"New Ingersoll", @"Library", @"Roosevelt", @"James", @"Whitehead", @"Gershwin", @"Whitman"];
    
    LVMLevenshteinMachine *levenshtein  = [[LVMLevenshteinMachine alloc] init];
    
    NSArray *closestMatch = [levenshtein bestMatchesForString:needle inArray:haystack];
    
    NSLog(@"Closest: %@", closestMatch);
    
}

@end
