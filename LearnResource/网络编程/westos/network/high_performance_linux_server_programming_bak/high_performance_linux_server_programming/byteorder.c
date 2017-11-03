/**
 * 判断主机字节序 - 也就是字节在内存中的顺序
 * 
 * 字节序分为
 * 大端字节序(big endian)
 * 小端字节序(little endian)
 *
 * < 现代PC大多采用小端字节序，因为小端字节序又被称为主机字节序 >
 * 
 * 大端字节序: 高字节位于内存低地址，低字节位于内存高地址
 * 大端字节序举例：
 * 0x0029f458   0x12
 * 0x0029f459   0x34
 * 
 * 小端字节序: 高字节位于内存高地址，低字节位于内存低地址
 * 小端字节序举例：
 * 0x0029f458   0x34
 * 0x0029f459   0x12
 */
 
#include <stdio.h>
void byteorder(){
    union{
        short value;
        char union_bytes[sizeof(short)];
    } test;
    
    test.value = 0x1234;    /* 通过将0x1234保存到内存中来判断大端和小端字节序很聪明 */
    
    /* 如果低地址也就是test.union_bytes[0]保存的是高字节位，则是大端字节序 */
    if(test.union_bytes[0] == 0x12 && test.union_bytes[1] == 0x34){
        printf("big endian\n");
    /* 如果低地址保存的是低字节位，则是小端字节序 */  
    }else if(test.union_bytes[0] == 0x34 && test.union_bytes[1] == 0x12){
        printf("little endian\n");
    }else{
        printf("unknown...\n");
    }
}

int main(){
    byteorder();
    printf("%ld\n",sizeof(int));
    printf("%ld\n",sizeof(short));
    return 1;
}