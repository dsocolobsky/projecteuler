#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool is_pythagorean(int a, int b, int c) {
    return pow(a, 2) + pow(b, 2) == pow(c, 2);
}

int main(void) {
    int c = 500;
    int b = c - 1;
    int a = b - 1;
    int res = -1;

    while (c > 0) {
        while (b > 0) {
            while (a > 0) {
                if (is_pythagorean(a, b, c) && a+b+c == 1000) {
                    res = a*b*c;
                    goto exit;
                }   
                a--;
            }
            b--;
            a = b - 1;
        }
        c--;
        b = c - 1;
    }

exit:
    printf("%d + %d + %d = %d\n", a, b, c, res);
    return 0;
}
