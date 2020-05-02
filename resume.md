# calling order
rdi
rsi
rdx
rcx
r8, r9

# return
rax

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