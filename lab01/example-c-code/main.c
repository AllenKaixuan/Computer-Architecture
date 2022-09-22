#include <stdio.h>
#include <stdlib.h>
#include "simp_md5.h"



int main() {
    uint64_t buf[] = {0x3, 0x0};
    simp_md5_ctx * ctx = malloc(sizeof(simp_md5_ctx));
    simp_md5_init(ctx, buf);
    simp_md5_exec(ctx);
    printf("0x%016lx%016lx\n", ctx->output[1], ctx->output[0]);
    free(ctx);
    return 0;
}
