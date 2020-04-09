#!/usr/bin/env python3
#What is the largest prime factor of the number 600851475143 ?
import math

number = 600851475143

def first_divisor(n):
    i = 2
    while n%i != 0 and i < n:
        i += 1
    return i

lnumber = number
div = 2
while True:
    div = first_divisor(lnumber)
    if lnumber/div < 2:
        break
    else:
        lnumber /= div

print(math.floor(lnumber))
