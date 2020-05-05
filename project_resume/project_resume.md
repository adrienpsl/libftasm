https://cs.lmu.edu/~ray/notes/nasmtutorial/


# Intro
* Nasm est du format : intruction \n, intruction \n ...
* les __instructions__ sont rang/ees dans des sections
* les directives permettent de communiquer avec l'exterieur du program
![nasmstructure.png](documents/nasmstructure.png)


# Premiere instructions
mov, and, or, xor, add, sub, inc, dec, syscall, db.
* mov x, y == x <- y
* inc x    == x <- x + 1
* syscall  == do syscall
* db       == ask for memory in specific section


# Les sections
Il y a dans un binaire 3 sections que j'utilise:
- la section __text__: ou il y a le code, (lecture seul).
- la section __data__: ou variables static que je ne peu 
                       pas modifier et deja init (lecture seules).
- la section __bss__ : variable static que je peux modifier. 

# Register operand
Il y en 16 registres [R0 -> R15].

#### Decoupage des registres
| size    | prefix    |
| -----   | -----     |
| 64 bits | R / R(n)  |
| 32 bits | E / R(n)D |
| 16 bits | A / R(n)W |
| 8 bits  | L / R(n)B |

#### Par registre
![processor_register.png](documents/processor_register.png)

#### Naming convention par chaque registre
| name    | R0  | R1  | R2  | R3  | R4  | R5  | R6  | R7  |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- |
| 64bits  | RAX | RCX | RDX | RBX | RSP | RBP | RSI | RDI |
| 32bits  | EAX | ECX | EDX | EBX | ESP | EBP | ESI | EDI |
| 16bits  | AX  | CX  | DX  | BX  | SP  | BP  | SI  | DI  |
| 8bits   | AL  | CL  | DL  | BL  | SPL | BPL | SIL | DIL |

#### Registre de 128bits pour les nombre flotant?
128bits XMM0 ...XMM15



