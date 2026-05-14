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
        pushq   %r12
        .cfi_def_cfa_offset 40
        .cfi_offset 12, -40
        pushq   %rbp
        .cfi_def_cfa_offset 48
        .cfi_offset 6, -48
        pushq   %rbx
        .cfi_def_cfa_offset 56
        .cfi_offset 3, -56
        subq    $24, %rsp
        .cfi_def_cfa_offset 80
        movq    %rdi, %r14
        movl    $0, %r13d
        jmp     .L2
.L3:
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
.L4:
        addq    $1, %rbx
        cmpq    $16, %rbx
        je      .L13
.L5:
        cmpl    %ebx, %ebp
        jbe     .L3
        movzbl  (%rsp,%rbx), %esi
        movl    $.LC1, %edi
        movl    $0, %eax
        call    printf
        jmp     .L4
.L13:
        movl    $.LC3, %edi
        movl    $0, %eax
        call    printf
        call    __ctype_b_loc
        movq    %rax, %rbp
        movq    %rsp, %rbx
        leal    -1(%r12), %eax
        leaq    1(%rsp,%rax), %r15
        jmp     .L8
.L6:
        movzbl  %dil, %edi
        call    putchar
.L7:
        addq    $1, %rbx
        cmpq    %r15, %rbx
        je      .L14
.L8:
        movzbl  (%rbx), %edi
        movzbl  %dil, %edx
        movq    0(%rbp), %rax
        testb   $64, 1(%rax,%rdx,2)
        jne     .L6
        movl    $46, %edi
        call    putchar
        jmp     .L7
.L14:
        movl    $.LC4, %edi
        call    puts
        movl    %r12d, %r12d
        addq    %r12, %r13
.L2:
        movq    %r14, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rsp, %rdi
        call    fread
        movq    %rax, %r12
        movl    %eax, %ebp
        testl   %eax, %eax
        je      .L15
        movq    %r13, %rsi
        movl    $.LC0, %edi
        movl    $0, %eax
        call    printf
        movl    $32, %edi
        call    putchar
        movl    $0, %ebx
        jmp     .L5
.L15:
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
        .text
        .globl  main
        .type   main, @function
main:
.LFB14:
        .cfi_startproc
        pushq   %rbx
        .cfi_def_cfa_offset 16
        .cfi_offset 3, -16
        movl    $.LC5, %esi
        movl    $.LC6, %edi
        call    fopen
        testq   %rax, %rax
        je      .L20
        movq    %rax, %rbx
        movq    %rax, %rdi
        call    hexDump
        movq    %rbx, %rdi
        call    fclose
        movl    $0, %eax
.L16:
        popq    %rbx
        .cfi_remember_state
        .cfi_def_cfa_offset 8
        ret
.L20:
        .cfi_restore_state
        movl    $.LC7, %edi
        call    puts
        movl    $1, %eax
        jmp     .L16
        .cfi_endproc
.LFE14:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits