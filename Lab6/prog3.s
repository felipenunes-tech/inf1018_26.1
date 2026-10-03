/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    if ((*p % 2) == 0)
      printf("%d\n", *p);
  return 0;
}
*/

.data
nums:  .int  10, -21, -30, 45
Sf:    .string "%d\n"    # string de formato para printf

.text
.globl  main
main:
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl  $0, %ebx      /* i = 0  */
  movq  $nums, %r12   /* p = nums  */
  movl  $0, %eax      /* sum = 0 */

  L1:
    




