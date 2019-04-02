#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int fclose(FILE *fp) {
    if (fp == NULL){
        fprintf(stderr, "Error: Input NULL pointer into fclose()\n");
        exit(EXIT_FAILURE);
    }
    
    // execute orinal fclose().
    static int (*real_fclose)(FILE *) = NULL;
    if (real_fclose == NULL){
        real_fclose = dlsym(RTLD_NEXT, "fclose");
    }
    return real_fclose(fp);
}
