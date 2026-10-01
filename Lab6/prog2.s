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
  cmpl $4, %ebx /* i == 4? */
  je L2  /* Pula para o Fim */
  addl (%r12), %eax /* sum += *p (corrigido: addl e parênteses) */
  addl $1, %ebx /* i++ */
  addq $4, %r12 /* Incrementa o ponteiro em 4 bytes */
  jmp L1

L2:
  movq $Sf, %rdi
  movl %eax, %esi
  movl $0, %eax    /* Zera %eax para chamadas variádicas como printf */
  call printf

  movq    $0, %rax    /* %rax guarda o retorno das funções. 0 = sucesso */

  movq -8(%rbp), %rbx   /* Devolve ao %rbx o valor que ele tinha antes */
  movq -16(%rbp), %r12  /* Devolve ao %r12 o valor que ele tinha antes */

  leave /* Desfaz o registo de ativação da pilha */
  ret /* Retorna a execução */