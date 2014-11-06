//
//  LVMLevenshteinMachine.h
//  LevenshteinMachine
//
//  Created by Moshe on 11/6/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVMLevenshteinMachine : NSObject

/**
 *  Compares two strings using the Levenshtein Distance algorithm.
 *
 *  @param s The first string, used to compare to t.
 *  @param t The second string, used to compare to s.
 *
 *  @return An integer value representing the distance between the strings.
 */

- (NSInteger)levenshteinDistanceRecursiveBetweenString:(NSString *)s andString:(NSString *)t;

/**
 *  Finds the possible matches for a test string in a given array.
 *
 *  @param string The needle.
 *  @param array The haystack
 *
 *  @return An array with the closest matches. If there are no strings in the input, returns nil.
 */

- (NSArray *)candidateMatchesForString:(NSString *)string inArray:(NSArray *)array;


/**
 *  Finds the closest possible matches for a test string in a given array.
 *  Finds candidates and then verifies word count in the input compared to 
 *  candidate string.
 *
 *  @param string The needle.
 *  @param array The haystack
 *
 *  @return An array of the closest string match. If there are no strings in the input, returns nil.
 */

- (NSArray *)bestMatchesForString:(NSString *)string inArray:(NSArray *)array;

@end
