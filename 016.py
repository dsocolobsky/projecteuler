#!/usr/bin/env python3
# What is the sum of the digits of the number 2^1000 ?

num = 2**1000
digits = str(num)

s = 0
for d in digits:
    s += int(d)

print(s)