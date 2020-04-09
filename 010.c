// Find the sum of all the primes below two million
#include <stdio.h>
#include <stdbool.h>
#include <math.h>

typedef unsigned long ulong;

bool is_prime(ulong n) {
    if (n == 2) return true;

    int bound = (int)sqrt(n) + 1;
    
    for (int i = 2; i <= bound; i++) {
        if (n%i == 0) {
            return false;
        }
    }

    return true;
}

ulong prime_sum(ulong	n) {
    ulong i = 2;
    ulong sum = 0;
    for (i = 2; i < n; i++) {
        if (is_prime(i)) {
            sum += i;
        }
    }

    return sum;
}

int main(void) {
    printf("%lu\n", prime_sum(2000000));
    return 0;
}
