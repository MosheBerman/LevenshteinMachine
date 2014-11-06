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

@end
