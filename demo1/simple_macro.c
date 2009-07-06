#include <stdio.h>

#define SWAP(a, b, type) { type __tmp_c; __tmp_c = b; b = a; a = __tmp_c; }

int main()
{
    int a = 3;

    int b = 5;

    printf("a is %d and b is %d\n", a, b);

    SWAP(a, b, int);

    printf("a is now %d and b is now %d\n", a, b);

    return 0;
}


