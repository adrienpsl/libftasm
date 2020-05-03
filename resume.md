# calling order
rdi
rsi
rdx
rcx
r8, r9

1
int open(fileName, rigth)

int write(int fd, void *ptr, size_t size);
          rdi,    rsi        rdx

# return
rax

# size
1 byte (8 bit): byte, DB, RESB
2 bytes (16 bit): word, DW, RESW
4 bytes (32 bit): dword, DD, RESD
8 bytes (64 bit): qword, DQ, RESQ
10 bytes (80 bit): tword, DT, REST
16 bytes (128 bit): oword, DO, RESO, DDQ, RESDQ
32 bytes (256 bit): yword, DY, RESY
64 bytes (512 bit): zword, DZ, RESZ


# String operation
 rep -> movs / b(it) / w(ord) / d(double word) 
        lods
        stos
 
 repe,
 repe, repz,
 repne, repnz ->    cmps / b w d
                    scas 
                    
rep:            repeat until ECX equals 0.

repe, repz:     repeat until ecx equal 0 
                __or__ as log zero flag is set
             
repne, repnz:   repeat until ecx,
                __or__ no zero flag
                
MOV : move data from esi to edi
CMP : cmp edi esi

LOD: load [esi] into eax
STO: store eax into [edi]
SCA: scan [edi] cmp eax