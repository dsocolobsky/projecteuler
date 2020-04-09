#!/usr/bin/env python3
# Find the largest palindrome made from the product of two 3-digit numbers.
import itertools

def is_palindrome(n):
    strn = str(n)
    j = len(strn)//2
    i = j - 1

    while i >= 0 and j < len(strn):
        if strn[i] != strn[j]:
            return False
        i -= 1
        j += 1

    return True

maxn = 0
for (a, b) in itertools.product(*[range(100, 999), range(100, 999)]):
    c = a*b
    if c > maxn and is_palindrome(c):
        maxn = c

print(maxn)
