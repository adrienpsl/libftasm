
SECTION .text
    global _ft_isalpha

_ft_isalpha:
    push rbp
    mov  rbp,   rsp

    mov  rax,   1    ; not problem algorithm

is_upper:
    cmp rdi,     'A' ; < 'A'
    jb  is_lower
    cmp rdi,     'Z' ; > 'z'
    ja  is_lower
    jmp out

is_lower:
    cmp rdi,    'a' ; < 'A'
    jb  set_not
    cmp rdi,    'z' ; > 'z'
    ja  set_not
    jmp out

set_not:
    mov rax, 0

out:
    leave
    ret
