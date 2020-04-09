#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool is_prime(int n) {
    if (n == 2) return true;

    int bound = (int)sqrt(n) + 1;
    
    for (int i = 2; i <= bound; i++) {
        if (n%i == 0) {
            return false;
        }
    }

    return true;
}

int nth_prime(int n) {
    int i = 2;
    int current_n = 0;
    for (current_n = 0; current_n < n; i++) {
        if (is_prime(i)) {
            current_n++;
        }
    }

    return i-1;
}

int main(void) {
    printf("%d\n", nth_prime(10001));
}
