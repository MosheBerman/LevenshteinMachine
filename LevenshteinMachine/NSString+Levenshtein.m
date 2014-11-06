//
//  NSString+Levenshtein.m
//  LevenshteinMachine
//
//  Created by Moshe on 11/6/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

#import "NSString+Levenshtein.h"

@implementation NSString (Levenshtein)

/**
 *  @return the last character in the string.
 */

- (NSString *)lastCharacter
{
    return [self substringFromIndex:self.length-1];
}

/**
 *  @return A substring, with the last character deleted.
 */

- (NSString *)substringMinusLastCharacter
{
    return [self substringToIndex:self.length-1];
}

@end
