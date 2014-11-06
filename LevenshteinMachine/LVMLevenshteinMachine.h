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
 *  Finds the closest match for a test string in a given array.
 *
 *  @param string The needle.
 *  @param array The haystack
 *
 *  @return The string with the closest match. If there are no strings in array, returns nil.
 */

- (NSString *)closestMatchForString:(NSString *)string inArray:(NSArray *)array;

@end
