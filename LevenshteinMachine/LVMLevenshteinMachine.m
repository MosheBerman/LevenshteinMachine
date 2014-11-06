//
//  LVMLevenshteinMachine.m
//  LevenshteinMachine
//
//  Created by Moshe on 11/6/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "LVMLevenshteinMachine.h"

@implementation LVMLevenshteinMachine

- (NSInteger)distanceBetweenString:(NSString *)aString ofLength:(NSInteger)length andString:(NSString *)aSecondString ofLength:(NSInteger)secondLength
{

    /* base case: empty strings */
    if (length == 0) return secondLength;
    if (secondLength == 0) return length;
    
    /* Cost of the comparison. */
    NSInteger cost = 0;
    
    /* test if last characters of the strings match */
    if ([aString substringFromIndex:length-1] == [aSecondString substringFromIndex: secondLength-1])
    {
        cost = 0;
    }
    else
    {
        cost = 1;
    }
    
//    /* return minimum of delete char from s, delete char from t, and delete char from both */
//    return MIN(LevenshteinDistance(s, len_s - 1, t, len_t    ) + 1,
//                   LevenshteinDistance(s, len_s    , t, len_t - 1) + 1,
//                   }
//                   LevenshteinDistance(s, len_s - 1, t, len_t - 1) + cost);
    return 0;
}

@end
