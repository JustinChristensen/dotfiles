#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

char *itoa(char *buf, size_t n, int i) {
    if (!buf || n < 12) return NULL;

    unsigned r = i < 0 ? -i : i;
    char *p = &buf[n - 1];
    *p-- = '\0';
    do *p-- = '0' + r % 10;        
    while (r /= 10);
    if (i < 0) *p-- = '-';

    return ++p;
}

int main() {
    int ns[] = { INT_MIN, -11, -1, 0, 1, 333, INT_MAX };

    for (int i = 0; i < (int) (sizeof ns / sizeof ns[0]); i++) {
        char buf[16] = "";
        printf("%s\n", itoa(buf, sizeof buf, ns[i]));
    }

    return 0;
}
