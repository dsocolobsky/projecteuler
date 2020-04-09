#!/usr/bin/env python3

multiples = [x if (x%3==0 or x%5==0) else 0 for x in range(1000)]
result = sum(multiples)
print(result)
