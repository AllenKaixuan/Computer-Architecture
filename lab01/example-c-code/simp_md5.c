//
// Created by kraylas on 7/30/22.
//
#include "simp_md5.h"
#include <memory.h>
//#include <stdio.h>
static const uint32_t S[] = {7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
                5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20,
                4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
                6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21};
static const uint32_t K[] = {0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
                0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
                0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
                0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
                0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
                0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
                0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
                0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
                0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
                0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
                0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
                0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
                0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
                0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
                0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391};
void simp_md5_init(simp_md5_ctx* ctx, int64_t* input) {
    memset(ctx, 0, sizeof(simp_md5_ctx));
    for(int i = 0; i < 4; ++i)
        memcpy(((void*)ctx->msg) + i * 2 * sizeof(int64_t), input, 2 * sizeof(int64_t));
    ctx->A = SALT_A;
    ctx->B = SALT_B;
    ctx->C = SALT_C;
    ctx->D = SALT_D;
}

uint32_t r(
        uint32_t a,
        uint32_t b,
        uint32_t c,
        uint32_t d,
        uint32_t m,
        uint32_t s,
        uint32_t t,
        uint32_t r) {
#define F(x, y, z) ((x & y) | ((~x) & z))
#define G(x, y, z) ((x & z) | (y & (~z)))
#define H(x, y, z) (x ^ y ^ z)
#define I(x, y, z) (y ^ (x | (~z)))
    uint32_t res = 0;
    switch (r) {
        case 0:
            res = a + F(b, c, d) + m + t;
            break;
        case 1:
            res = a + G(b, c, d) + m + t;
            break;
        case 2:
            res = a + H(b, c, d) + m + t;
            break;
        case 3:
            res = a + I(b, c, d) + m + t;
            break;
        default:
            printf("error! r should 0 <= r < 4, now r:%d\n", r);
            break;
    }
#undef F
#undef G
#undef H
#undef I
    return b + ((res << s) | (res >> (32 - s)));
}

void simp_md5_exec(simp_md5_ctx* ctx) {
    ctx->AA = ctx->A;
    ctx->BB = ctx->B;
    ctx->CC = ctx->C;
    ctx->DD = ctx->D;
    // round 0
    for(int i = 0; i < 16; ++i) {
        uint32_t cya, cyb, cyc, cyd;
        uint32_t *p_upd = NULL;
        switch(i & 3) {
            case 0:
                cya = ctx->A;
                cyb = ctx->B;
                cyc = ctx->C;
                cyd = ctx->D;
                p_upd = &ctx->A;
                break;
            case 1:
                cya = ctx->D;
                cyb = ctx->A;
                cyc = ctx->B;
                cyd = ctx->C;
                p_upd = &ctx->D;
                break;
            case 2:
                cya = ctx->C;
                cyb = ctx->D;
                cyc = ctx->A;
                cyd = ctx->B;
                p_upd = &ctx->C;
                break;
            case 3:
                cya = ctx->B;
                cyb = ctx->C;
                cyc = ctx->D;
                cyd = ctx->A;
                p_upd = &ctx->B;
                break;
        }
        *p_upd = r(cya, cyb, cyc, cyd, ((uint32_t*)ctx->msg)[i], S[i], K[i], 0);
    }

    // round 1
    for(int i = 0; i < 16; ++i) {
        uint32_t cya, cyb, cyc, cyd;
        uint32_t *p_upd = NULL;
        switch(i & 3) {
            case 0:
                cya = ctx->A;
                cyb = ctx->B;
                cyc = ctx->C;
                cyd = ctx->D;
                p_upd = &ctx->A;
                break;
            case 1:
                cya = ctx->D;
                cyb = ctx->A;
                cyc = ctx->B;
                cyd = ctx->C;
                p_upd = &ctx->D;
                break;
            case 2:
                cya = ctx->C;
                cyb = ctx->D;
                cyc = ctx->A;
                cyd = ctx->B;
                p_upd = &ctx->C;
                break;
            case 3:
                cya = ctx->B;
                cyb = ctx->C;
                cyc = ctx->D;
                cyd = ctx->A;
                p_upd = &ctx->B;
                break;
        }
        int j = (i >> 1) | ((i << 3) & 0xf);
        *p_upd = r(cya, cyb, cyc, cyd, ((uint32_t*)ctx->msg)[j], S[16 + i], K[16 + i], 1);
    }

    // round 2
    for(int i = 0; i < 16; ++i) {
        uint32_t cya, cyb, cyc, cyd;
        uint32_t *p_upd = NULL;
        switch(i & 3) {
            case 0:
                cya = ctx->A;
                cyb = ctx->B;
                cyc = ctx->C;
                cyd = ctx->D;
                p_upd = &ctx->A;
                break;
            case 1:
                cya = ctx->D;
                cyb = ctx->A;
                cyc = ctx->B;
                cyd = ctx->C;
                p_upd = &ctx->D;
                break;
            case 2:
                cya = ctx->C;
                cyb = ctx->D;
                cyc = ctx->A;
                cyd = ctx->B;
                p_upd = &ctx->C;
                break;
            case 3:
                cya = ctx->B;
                cyb = ctx->C;
                cyc = ctx->D;
                cyd = ctx->A;
                p_upd = &ctx->B;
                break;
        }
        int j = (i >> 2) | ((i << 2) & 0xf);
        *p_upd = r(cya, cyb, cyc, cyd, ((uint32_t*)ctx->msg)[j], S[32 + i], K[32 + i], 2);
    }

    // round 3
    for(int i = 0; i < 16; ++i) {
        uint32_t cya, cyb, cyc, cyd;
        uint32_t *p_upd = NULL;
        switch(i & 3) {
            case 0:
                cya = ctx->A;
                cyb = ctx->B;
                cyc = ctx->C;
                cyd = ctx->D;
                p_upd = &ctx->A;
                break;
            case 1:
                cya = ctx->D;
                cyb = ctx->A;
                cyc = ctx->B;
                cyd = ctx->C;
                p_upd = &ctx->D;
                break;
            case 2:
                cya = ctx->C;
                cyb = ctx->D;
                cyc = ctx->A;
                cyd = ctx->B;
                p_upd = &ctx->C;
                break;
            case 3:
                cya = ctx->B;
                cyb = ctx->C;
                cyc = ctx->D;
                cyd = ctx->A;
                p_upd = &ctx->B;
                break;
        }
        int j = (i >> 3) | ((i << 1) & 0xf);
        *p_upd = r(cya, cyb, cyc, cyd, ((uint32_t*)ctx->msg)[j], S[48 + i], K[48 + i], 3);
    }

    uint32_t *p_out = (uint32_t*) ctx->output;
    p_out[0] = ctx->D + ctx->DD;
    p_out[1] = ctx->C + ctx->CC;
    p_out[2] = ctx->B + ctx->BB;
    p_out[3] = ctx->A + ctx->AA;
}