%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Результат: ',0
rem1: DB 'Введите х: ',0
rem2: DB '3*(x+10)-20',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:

mov eax, rem2
call sprintLF
mov eax, rem1
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi

mov eax,x
call atoi
add eax,10
xor edx,edx
mov ebx,3
mul ebx
xor edx,edx
mov ebx,20
neg ebx
add eax, ebx
mov edi,eax
; —— Вывод результата на экран
mov eax,div ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения
