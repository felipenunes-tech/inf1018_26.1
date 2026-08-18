#include <stdio.h>

void dump (void *p, int n);

int main (void) {
  char p[] = "750953";
  dump(p, sizeof(p));
  return 0;
}