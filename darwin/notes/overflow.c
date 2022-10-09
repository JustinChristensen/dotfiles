#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

// modulo addition
//    11001000 (200)
// +  01100100 (100)
// = 100101100 (300)
// - 100000000 (256)
// =  00101100 (44)
// range without overflow: [0, 510] 
// 0 <= x + y <= 2^(w+1) - 2
bool safe_uadd(uint8_t *o, uint8_t x, uint8_t y) {
    *o = x + y;
    return x <= *o; 
}

bool safe_add(int8_t *o, int8_t x, int8_t y) {
    *o = x + y;

    if (x < 0 && y < 0 && x < INT8_MIN - y) return false;
    if (x > 0 && y > 0 && x > INT8_MAX - y) return false;

    return true;
}

#define unsigned_loop(i, j) \
    uint8_t i, j; \
    for (int _i = 0; i = _i, _i < UINT8_MAX + 1; _i++) \
        for (int _j = 0; j = _j, _j < UINT8_MAX + 1; _j++) 

#define signed_loop(i, j) \
    int8_t i, j; \
    for (int _i = INT8_MIN; i = _i, _i < INT8_MAX + 1; _i++) \
        for (int _j = INT8_MIN; j = _j, _j < INT8_MAX + 1; _j++) 

int main(int argc, char *argv[]) {
    int n = 0, detected = 0;
            
    unsigned_loop(i, j) {
        n++;
        uint8_t o;
        bool success = safe_uadd(&o, i, j);

        int r = i + j;
            
        if (success && r > UINT8_MAX) {
            fprintf(stderr, "overflow not detected for x = %hhu and y = %hhu, result: %hhu\n", i, j, o);
        } else if (!success) detected++;
    }

    printf("n: %d, overflow detected: %d\n", n, detected);

    n = 0;
    detected = 0;

    signed_loop(s, t) {
        n++;
        int8_t o;
        bool success = safe_add(&o, s, t);

        int r = s + t;
            
        // if (!success) fprintf(stderr, "overflow x = %hhd and y = %hhd, result: %hhd\n", s, t, o);

        if (success && (r < INT8_MIN || r > INT8_MAX)) {
            fprintf(stderr, "overflow not detected for x = %hhd and y = %hhd, result: %hhd\n", s, t, o);
        } else if (!success) detected++;
    }

    printf("n: %d, overflow detected: %d\n", n, detected);

    return 0;
}

