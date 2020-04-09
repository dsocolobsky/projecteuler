#!/usr/bin/env python3
# Find the difference between the sum of the squares of
# the first one hundred natural numbers and the square of the sum.

number = 100

def square_of_sum(n):
    return ((n*(n+1))//2)**2

def sum_of_squares(n):
    s = 0
    for i in range(1, n+1):
        s += i**2
    return s

ssquares = sum_of_squares(number)
sqsum = square_of_sum(number)

print(ssquares)
print(sqsum)

res =  abs(ssquares - sqsum)
print(res)
