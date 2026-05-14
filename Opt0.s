        .file   "Project3.c"
        .text
        .section        .rodata
.LC0:
        .string "%08lx"
.LC1:
        .string "%02x "
.LC2:
        .string "  "
.LC3:
        .string " |"
.LC4:
        .string "."
.LC5:
        .string "%c"
.LC6:
        .string "|"
        .text
        .globl  hexDump
        .type   hexDump, @function
hexDump:
.LFB0:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        subq    $64, %rsp
        movq    %rdi, -56(%rbp)
        movl    $0, -20(%rbp)
        movq    $0, -8(%rbp)
        jmp     .L2
.L11:
        movq    -8(%rbp), %rax
        movq    %rax, %rsi
        movl    $.LC0, %edi
        movl    $0, %eax
        call    printf
        movl    $32, %edi
        call    putchar
        movl    $0, -12(%rbp)
        jmp     .L3
.L6:
        movl    -12(%rbp), %eax
        cmpl    %eax, -20(%rbp)
        jbe     .L4
        movl    -12(%rbp), %eax
        cltq
        movzbl  -48(%rbp,%rax), %eax
        movzbl  %al, %eax
        movl    %eax, %esi
        movl    $.LC1, %edi
        movl    $0, %eax
        call    printf
        jmp     .L5
.L4:
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
.L5:
        addl    $1, -12(%rbp)
.L3:
        cmpl    $15, -12(%rbp)
        jle     .L6
        movl    $.LC3, %edi
        movl    $0, %eax
        call    printf
        movl    $0, -16(%rbp)
        jmp     .L7
.L10:
        call    __ctype_b_loc
        movq    (%rax), %rdx
        movl    -16(%rbp), %eax
        movzbl  -48(%rbp,%rax), %eax
        movzbl  %al, %eax
        addq    %rax, %rax
        addq    %rdx, %rax
        movzwl  (%rax), %eax
        movzwl  %ax, %eax
        andl    $16384, %eax
        testl   %eax, %eax
        jne     .L8
        movl    $.LC4, %edi
        movl    $0, %eax
        call    printf
        jmp     .L9
.L8:
        movl    -16(%rbp), %eax
        movzbl  -48(%rbp,%rax), %eax
        movzbl  %al, %eax
        movl    %eax, %esi
        movl    $.LC5, %edi
        movl    $0, %eax
        call    printf
.L9:
        addl    $1, -16(%rbp)
.L7:
        movl    -16(%rbp), %eax
        cmpl    -20(%rbp), %eax
        jb      .L10
        movl    $.LC6, %edi
        call    puts
        movl    -20(%rbp), %eax
        addq    %rax, -8(%rbp)
.L2:
        movq    -56(%rbp), %rdx
        leaq    -48(%rbp), %rax
        movq    %rdx, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rax, %rdi
        call    fread
        movl    %eax, -20(%rbp)
        cmpl    $0, -20(%rbp)
        jne     .L11
        nop
        nop
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE0:
        .size   hexDump, .-hexDump
        .section        .rodata
.LC7:
        .string "rb"
.LC8:
        .string "binary.out"
.LC9:
        .string "Error in opening the file"
        .text
        .globl  main
        .type   main, @function
main:
.LFB1:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        subq    $16, %rsp
        movl    $.LC7, %esi
        movl    $.LC8, %edi
        call    fopen
        movq    %rax, -8(%rbp)
        cmpq    $0, -8(%rbp)
        jne     .L13
        movl    $.LC9, %edi
        call    puts
        movl    $1, %eax
        jmp     .L14
.L13:
        movq    -8(%rbp), %rax
        movq    %rax, %rdi
        call    hexDump
        movq    -8(%rbp), %rax
        movq    %rax, %rdi
        call    fclose
        movl    $0, %eax
.L14:
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE1:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits