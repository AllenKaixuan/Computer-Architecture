//
// Created by kraylas on 7/30/22.
//

#ifndef SIMP_MD5_SIMP_MD5_H
#define SIMP_MD5_SIMP_MD5_H
#include <stdint.h>
#define SALT_A 0x67452301
#define SALT_B 0xefcdab89
#define SALT_C 0x98badcfe
#define SALT_D 0x10325476

typedef struct {
    uint64_t msg[8], output[2];
    uint32_t A, B, C, D;
    uint32_t AA, BB, CC, DD;
}simp_md5_ctx;

void simp_md5_init(simp_md5_ctx*, int64_t*);
void simp_md5_exec(simp_md5_ctx*);

#endif //SIMP_MD5_SIMP_MD5_H
