#include <stdio.h>
unsigned char switch_byte(unsigned char x) {
    return (x << 4) | (x >> 4);
}
unsigned char rotate_left(unsigned char x, int n) {
    return (unsigned char)((x << n) | (x >> (8 - n)));
}

int main(void) {
    /*A*/
    unsigned char val_a = 0xAB;
    unsigned char res_a = switch_byte(val_a);
    
    printf("=== Teste Item A (switch_byte) ===\n");
    printf("Entrada:  0x%02X\n", val_a);
    printf("Saida:    0x%02X (Esperado: 0xBA)\n\n", res_a);

    /*B */
    unsigned char val_b = 0x61; // 0110 0001
    
    printf("=== Teste Item B (rotate_left com 0x61) ===\n");
    printf("Rotate 1 bit:  0x%02X (Esperado: 0xC2)\n", rotate_left(val_b, 1));
    printf("Rotate 2 bits: 0x%02X (Esperado: 0x85)\n", rotate_left(val_b, 2));
    printf("Rotate 7 bits: 0x%02X (Esperado: 0xB0)\n", rotate_left(val_b, 7));

    return 0;
}