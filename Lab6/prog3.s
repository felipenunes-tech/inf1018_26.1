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
  subq    $32, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl  $0, %ebx      /* i = 0  */
  movq  $nums, %r12   /* p = nums  */
  movl  $0, %eax      /* sum = 0 */
  movq %r13, -24(%rbp) /*guarda um espaço pra r13 que usei de rascunho*/

  L1:
    cmpl $4,%ebx /* i=4? */
    je L2 /* se i!=4 vai pra L2*/

    /* IF */
    movl (%r12), %r13d /* r13d = *p */
    andl $1, %r13d /* confere se r13d é impar */
    jnz DpsIf /* Pula pra depois do if */

    /* Printf */
    movq  $Sf, %rdi      /* 1º argumento: o formato "%d\n" */
    movl  (%r12), %esi   /* 2º argumento: o valor atual do array (*p) */
    movl  $0, %eax       /* Caso especial para funções variádicas */
    call  printf         /* Executa a impressão */

  DpsIf:
    addq $4, %r12
    addl $1, %ebx
    jmp L1
  
  L2:
    movq    $0, %rax       /* 5. Define o valor de retorno da main (return 0) */

  /***************************************************************/
  /* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
    movq  $0, %rax  /* rax = 0  (valor de retorno) */
    movq  -8(%rbp), %rbx /* Devolve o valor original ao %rbx */
    movq  -16(%rbp), %r12 /* Devolve o valor original ao %r12 */
    movq  -24(%rbp), %r13 /* Devolve o valor original ao %r13 */
    leave
    ret      
  /*****************************************************./prog1**********/