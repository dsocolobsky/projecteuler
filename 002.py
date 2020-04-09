#!/usr/bin/env python3

# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

# Returns nth term of Fib secuence
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    
    return fib(n-1) + fib(n-2)

i = 0
t = fib(i)
result = 0
while t < 4000000:
    t = fib(i)
    result = result if t%2==1 else result + t
    i += 1

print(result)
