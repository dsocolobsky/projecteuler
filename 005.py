#!/usr/bin/env python3
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
# This is an EXTREMELY inneficient and naive algorithm but I solved it this way the first time
import math

def meets_criteria(n):
    for i in range(20, 2, -1):
        if n%i != 0:
            return False
    return True

lower_bound = math.prod([2, 3, 5, 7, 11, 13, 17, 19])
n = lower_bound
while not meets_criteria(n):
    n += 1

print(n)
