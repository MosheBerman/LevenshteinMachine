//
//  LVMLevenshteinMachine.m
//  LevenshteinMachine
//
//  Created by Moshe on 11/6/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "LVMLevenshteinMachine.h"
#import "NSString+Levenshtein.h"

@implementation LVMLevenshteinMachine

/**
 *  Compares two strings using the Levenshtein Distance algorithm.
 *
 *  @param s The first string, used to compare to t.
 *  @param t The second string, used to compare to s.
 *
 *  @return An integer value representing the distance between the strings.
 */

- (NSInteger)levenshteinDistanceRecursiveBetweenString:(NSString *)s andString:(NSString *)t
{

    /**
     *  base case: empty strings 
     */
    
    if (s.length == 0) return t.length;
    if (t.length == 0) return s.length;
    
    /**
     *  Cost of the comparison. 
     */
    
    NSInteger cost = 0;
    
    /**
     *  test if last characters of the strings match 
     */
    
    if ([[s lastCharacter] isEqualToString:[t lastCharacter]])
    {
        cost = 0;
    }
    else
    {
        cost = 1;
    }
    
    /**
     *  Get shorter versions of the string.
     */
    
    NSString *shorterS = [s substringMinusLastCharacter];
    NSString *shorterT = [t substringMinusLastCharacter];
    
    /**
     *  Get the costs for each variation.
     */
    
    //  ShorterS and original T
    NSInteger costForShorterS = [self levenshteinDistanceRecursiveBetweenString:shorterS andString:t] + 1;
    NSInteger costForShorterT = [self levenshteinDistanceRecursiveBetweenString:s andString:shorterT] + 1;
    NSInteger costShorterBoth = [self levenshteinDistanceRecursiveBetweenString:shorterT andString:shorterS] + cost;

    /**
     *  Return the shortest of the three variations.
     */
    
    return MIN(MIN(costForShorterS, costForShorterT), costShorterBoth);
}

/**
 *  Finds the closest possible match for a test string in a given array.
 *
 *  @param string The needle.
 *  @param array The haystack
 *
 *  @return An array with the closest matches. If there are no strings in the input, returns nil.
 */

- (NSArray *)candidateMatchesForString:(NSString *)string inArray:(NSArray *)array
{
    /**
     *  A container for closest results.
     */
    
    NSMutableArray *closest = [[NSMutableArray alloc] init];
    
    /**
     *  The maximum distance is at most the longest string.
     */
    
    NSInteger maxDistance = 0;
    
    
    for (NSString *testString in array)
    {
        if (testString.length > maxDistance)
        {
            maxDistance = MAX(testString.length, string.length);
        }
    }
    
    NSLog(@"Initial maximum is %li", maxDistance);
    
    for (NSString *testString in array)
    {
        NSInteger distance = [self levenshteinDistanceRecursiveBetweenString:string andString:testString];
        
        NSLog(@"Distance between '%@' and '%@' is %li", string, testString, distance);
        
        if (distance < maxDistance) {
            closest = [[NSMutableArray alloc] init];
            maxDistance = distance;
        }
        
        if (distance == maxDistance)
        {
            [closest addObject:testString];
        }
        
    }
    
    return closest;
    
}

/**
 *  Finds the closest possible match for a test string in a given array.
 *
 *  @param string The needle.
 *  @param array The haystack
 *
 *  @return The closest string match. If there are no strings in the input, returns nil.
 */

- (NSArray *)bestMatchesForString:(NSString *)string inArray:(NSArray *)array
{
    
    /**
     *  Grab the candidate matches.
     */
    
    NSArray *candidates = [self candidateMatchesForString:string inArray:array];
    
    /**
     *  Count the number of words in the input.
     */
    
    NSInteger inputWordCount = [string componentsSeparatedByString:@" "].count;
    
    /**
     *  Find the matches that contain the same number of words.
     */
    
    NSMutableArray *output = [[NSMutableArray alloc] init];
    
    for (NSString *candidate in candidates)
    {
        NSInteger candidateWordCount = [candidate componentsSeparatedByString:@" "].count;

        if (candidateWordCount == inputWordCount)
        {
            [output addObject:candidate];
        }
    }
    
    return output;
}

@end
