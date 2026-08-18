#include <stdio.h>

void dump (void *p, int n);
int main (void) {
  int i = 10000;
  printf("Int\n");
  dump(&i, sizeof(i));
  short s = 10000;
  printf("Short\n");
  dump(&s, sizeof(s));
  long l = 10000;
  printf("Long\n");
  dump(&l, sizeof(l));
  return 0;
}