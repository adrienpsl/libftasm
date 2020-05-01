### Syntax
operation, [ARG1, [ARG2]]
operation, destination, source.

### Taille des parametres
r -> 64bits

### Address effective
c'est une variable en memoire, cad:
l'address de la case memoire ou est stocker la variable
base : registre 32bits
index:  32bits register
scale: facteur 1,2,4,8 mulitpliant index
disp : deplacement ajoute ou deduit a la fin du calcul
segreg: segment memoire ou se trouve la donne.

segred : [base + index * scale + disp]

mov rax, [ rbx + rcx*2 + 0x80848c48 ]
le double de rcx
est ajouter au contenu de rbx,
est ajouter a l'offset disp
tout ca mis dans rax

### Instruction Commune
```asm
sub rax, 42
add rax, 42
AND 0x5, 0x3
XOR rax, eax
mov rax, 0x00000042
```

assigne l'address d'une variable a une variable.
l'address est entre crochet, car on garde la ref,
c'est elle que l'on met dans la variable.
comme avec un ptr
```asm
lea  
```

### Manipulation de la pile
push ebp
la valeur contenu dans ebp est mise sur la pile.
pop retire l'element au sommet de la pile, 
et l'assigne a la valeur passee en argument.
ou
l'element reste ou il est mais rsp est mis a jour 
et pointe vers le prev element.

### Test
CMP 
    compare les deux valeurs passsees en arguments
    une soustraction signee est effectuer first - second
    permet de savoir si un nb est positif ou negatif
TEST
    effectue un and, plus rapid que cmp
JMP
    saute a l'intruction
JE - JNE
    equal - non equal
JZ - JNZ
    null
JA/JB - JNA/JNB (no signe)
    stritement superieur / strictement inferieur, - inferieur ou egal / superieur ou egal
JAE/JBE - JNAE/JNBE
    stritement superieur / strictement inferieur, - inferieur ou egal / superieur ou egal
JG / JL (signe)
    > / <

### Function
CALL
    appelle du code a un espace memoire different
    l'address donne permet de trouver ce code
    fait en realite ces deux instructions :
        PUSH RIP
        JMP address
LEAVE
    prepare la sortie d'une fonction
        MOV RSP, RBP
        POP EBP
RET
    finalise le leave, et recupere l'address de l'instruction enregistree
    sur la pile lors de l'instruction call.
        POP EIP
    
### Misc
nop : ne rien faire

## Mise en pratique

#### main
```asm
   0x080483f2 <+0>:     push   ebp                     ; save up in the func the next one
   0x080483f3 <+1>:     mov    ebp,esp                 ; set both at the same addr
   0x080483f5 <+3>:     sub    esp,0x18                ; add 0x18 memory space
   0x080483f8 <+6>:     mov    DWORD PTR [esp+0x4],0x2 ; save at + 4, 2
   0x08048400 <+14>:    mov    DWORD PTR [esp],0x28    ; save at esp, 
   0x08048407 <+21>:    call   0x80483dc <add>
   0x0804840c <+26>:    mov    DWORD PTR [ebp-0x4],eax
   0x0804840f <+29>:    mov    eax,DWORD PTR [ebp-0x4]
   0x08048412 <+32>:    leave  
   0x08048413 <+33>:    ret  
``` 

DWORD est un double word, -> 32bit -> 4 octets.
+6 put 0x2 at the second position

#### add
```shell script
(gdb) disass add
Dump of assembler code for function add:
   0x080483dc <+0>:     push   ebp
   0x080483dd <+1>:     mov    ebp,esp
   0x080483df <+3>:     sub    esp,0x10
   0x080483e2 <+6>:     mov    eax,DWORD PTR [ebp+0xc]
   0x080483e5 <+9>:     mov    edx,DWORD PTR [ebp+0x8]
   0x080483e8 <+12>:    add    eax,edx
   0x080483ea <+14>:    mov    DWORD PTR [ebp-0x4],eax # eax because I return from eax
   0x080483ed <+17>:    mov    eax,DWORD PTR [ebp-0x4]
   0x080483f0 <+20>:    leave  
   0x080483f1 <+21>:    ret    
End of assembler dump.
```










































