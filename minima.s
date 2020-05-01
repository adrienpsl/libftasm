; c'est quoi la section text deja ?
section .text
    ; global defini les symbol
    ; tout programme commence par start
    ; qui fait des trucs et appelle main
    global start ; entre program
    global _main ; debut du program

; ceci est un label
start:
    call _main
    ret

_main:
    ret