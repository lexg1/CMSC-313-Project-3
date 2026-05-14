        .file   "Project3.c"
        .text
        .section        .rodata.str1.1,"aMS",@progbits,1
.LC0:
        .string "%08lx"
.LC1:
        .string "%02x "
.LC2:
        .string "  "
.LC3:
        .string " |"
.LC4:
        .string "|"
        .text
        .p2align 4
        .globl  hexDump
        .type   hexDump, @function
hexDump:
.LFB13:
        .cfi_startproc
        pushq   %r15
        .cfi_def_cfa_offset 16
        .cfi_offset 15, -16
        pushq   %r14
        .cfi_def_cfa_offset 24
        .cfi_offset 14, -24
        pushq   %r13
        .cfi_def_cfa_offset 32
        .cfi_offset 13, -32
        movq    %rdi, %r13
        pushq   %r12
        .cfi_def_cfa_offset 40
        .cfi_offset 12, -40
        xorl    %r12d, %r12d
        pushq   %rbp
        .cfi_def_cfa_offset 48
        .cfi_offset 6, -48
        pushq   %rbx
        .cfi_def_cfa_offset 56
        .cfi_offset 3, -56
        subq    $24, %rsp
        .cfi_def_cfa_offset 80
        .p2align 4,,10
        .p2align 3
.L2:
        movq    %r13, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rsp, %rdi
        call    fread
        movq    %rax, %rbp
        movl    %eax, %r14d
        testl   %eax, %eax
        je      .L14
        movq    %r12, %rsi
        movl    $.LC0, %edi
        xorl    %eax, %eax
        xorl    %ebx, %ebx
        call    printf
        movl    $32, %edi
        call    putchar
        jmp     .L5
        .p2align 4,,10
        .p2align 3
.L16:
        movzbl  (%rsp,%rbx), %esi
        movl    $.LC1, %edi
        xorl    %eax, %eax
        addq    $1, %rbx
        call    printf
        cmpq    $16, %rbx
        je      .L15
.L5:
        cmpl    %ebx, %r14d
        ja      .L16
        movl    $.LC2, %edi
        xorl    %eax, %eax
        addq    $1, %rbx
        call    printf
        cmpq    $16, %rbx
        jne     .L5
.L15:
        movl    $.LC3, %edi
        xorl    %eax, %eax
        leal    -1(%rbp), %r14d
        movq    %rsp, %rbx
        call    printf
        call    __ctype_b_loc
        movq    %rax, %r15
        leaq    1(%rsp), %rax
        addq    %rax, %r14
        jmp     .L8
        .p2align 4,,10
        .p2align 3
.L18:
        movl    $46, %edi
        addq    $1, %rbx
        call    putchar
        cmpq    %rbx, %r14
        je      .L17
.L8:
        movzbl  (%rbx), %edx
        movq    (%r15), %rax
        movq    %rdx, %rdi
        testb   $64, 1(%rax,%rdx,2)
        je      .L18
        call    putchar
        addq    $1, %rbx
        cmpq    %rbx, %r14
        jne     .L8
.L17:
        movl    $.LC4, %edi
        movl    %ebp, %ebp
        call    puts
        addq    %rbp, %r12
        jmp     .L2
.L14:
        addq    $24, %rsp
        .cfi_def_cfa_offset 56
        popq    %rbx
        .cfi_def_cfa_offset 48
        popq    %rbp
        .cfi_def_cfa_offset 40
        popq    %r12
        .cfi_def_cfa_offset 32
        popq    %r13
        .cfi_def_cfa_offset 24
        popq    %r14
        .cfi_def_cfa_offset 16
        popq    %r15
        .cfi_def_cfa_offset 8
        ret
        .cfi_endproc
.LFE13:
        .size   hexDump, .-hexDump
        .section        .rodata.str1.1
.LC5:
        .string "rb"
.LC6:
        .string "binary.out"
.LC7:
        .string "Error in opening the file"
        .section        .text.startup,"ax",@progbits
        .p2align 4
        .globl  main
        .type   main, @function
main:
.LFB14:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movl    $.LC5, %esi
        movl    $.LC6, %edi
        call    fopen
        testq   %rax, %rax
        je      .L23
        movq    %rax, %rbp
        movq    %rax, %rdi
        call    hexDump
        movq    %rbp, %rdi
        call    fclose
        xorl    %eax, %eax
        popq    %rbp
        .cfi_remember_state
        .cfi_def_cfa_offset 8
        ret
.L23:
        .cfi_restore_state
        movl    $.LC7, %edi
        call    puts
        movl    $1, %eax
        popq    %rbp
        .cfi_def_cfa_offset 8
        ret
        .cfi_endproc
.LFE14:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits