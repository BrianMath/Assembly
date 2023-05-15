; Assembly x86 (https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit)

; 1) Compilar de assembly para linguagem de máquina:
;	nasm -f elf64 001.asm
; 2) Criar executável juntado código com bibliotecas do SO:
;	ld -s -o 001 001.o

; section .data: Ponteiros para valores || "constantes"
section .data
	mensagem: db "Olá, mundo!", 0xA ; 0xA == '\n'
	tamanho: equ $- mensagem ; Calcula o tamanho de 'mensagem'

section .text

global _start

; Começo do programa
_start:
	mov EAX, 0x4	  ; syscall write
	mov EBX, 0x1	  ; 1 == Saída padrão
	mov ECX, mensagem ; Texto que será impresso
	mov EDX, tamanho  ; Tamanho do texto impresso
	int 0x80	 	  ; SO, executa o código acima!

saida:
	mov EAX, 0x1 ; syscall exit
	mov EBX, 0x0 ; código de erro
	int 0x80	 ; SO, executa o código acima!
