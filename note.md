gcc prend les fichier .c
les optimise et les transform en .s
transform en objet
les links 

je viens de refaire le taf de gcc!


Un registre:
    une case dans le cpu qui permet de stocker ce que je veux
    address, parametre... all
    
    
* osx assembler reference
* calling convention stack overflow
* system V application binary interface
* syscall apple

1=> create a function
2-> call that function


* register are the fastest stuff on computing
* each core has his own register, memory l1, l2 and share l3
* each core can make is own operation on one cycle

The register:
1 >> Accumulator -> RAX
2 >> Counter     -> RCX
3 >> Data        -> RDX
4 >> base        -> RBX


# The Calling Convention
* Je met dans cet ordre dans les register :
  - Integers and ptr : rdi, rsi, rdx, rcx, r8, r9.
  - Floating-point: xmm0, xmm1... xmm7
* Les parametre sont ajouter, sur la stack,
  de droite a gauche,
  et sont remove apres le call de la function
* J'appelle la function une fois que tout les parameters
  sont push, l'address des paramaters est rsp+8,
  car rsp est la return address.
* Stack ptr rsp doit etre aligne en 16byte avant de faire
  un call, comme le retour est de 8bytes, rsp n'est pas aligne
  je dois donc soustraire 8bits, pour aligner les parametres.
* Ma function ne peux pas changer ces register:
    - rbp, rbx, r12, r13, r14, r15.
    - elle peut changer tous les autres.
* les int sont return dans rax, rdx:rax







# asmtutor.com
* Avec l'asm, la seul interface que j'ai c'est le kernel,
* Sur mac, je les call avec 0x02000000
* Quand je fais un syscall: 
  - le kernel stop mon program,
  - Contact les drivers pour executer la tash
  - Rend la main a mon program
* 




useful website: 
- use with clion https://stackoverflow.com/questions/49131996/compile-asm-and-c-with-asm-for-debugging
- 









