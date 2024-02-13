# a string is 4 bytes long in MIPS
    .data
# less efficient than setting at init
days:   .space 20       #allocate 20 bytes of space (alis as "days)
# create objects to hold each value in the array
mon:     .asciiz "Mon\n"
tue:     .asciiz "Tue\n"
wed:     .asciiz "Wed\n"
thu:     .asciiz "Thu\n"
fri:     .asciiz "Fri\n"
# setting at init, would not need to load and store
# days:    .word mon, tue, wed, thu, fri
# starting at 0 -> 4
iterator:  .word 0
size:     .word 4
    .text
main:
    la $t0, days       #load address of days into $t0
    la $t1, mon        #load address of mon into $t1
    sw $t1, 0($t0)     #store address of mon at days[0]
    la $t1, tue        #load address of tue into $t1
    sw $t1, 4($t0)     #store address of tue at days[1]
    la $t1, wed        #load address of wed into $t1
    sw $t1, 8($t0)     #store address of wed at days[2]
    la $t1, thu        #load address of thu into $t1
    sw $t1, 12($t0)    #store address of thu at days[3]
    la $t1, fri        #load address of fri into $t1
    sw $t1, 16($t0)    #store address of fri at days[4]

    lw $t1, iterator   #load value of iterator into $t1
    lw $t2, size       #load value of size into $t2

begin_loop:
    bgt $t1, $t2, end_loop  #if iterator > size, goto end_loop
    sll $t3, $t1, 2         #multiply iterator by 4: 0, 4, 8, 12, 16
    addu $t3, $t3, $t0      #add iterator*4 to get address of days[iterator]
    lw $a0, 0($t3)          #load value at address of days[iterator] into $a0
    li $v0, 4               #system call code for print_str
    syscall
    addi $t1, $t1, 1        #increment iterator by 1, iterator++
    j begin_loop

end_loop:
    li $v0, 10              #system call code for exit
    syscall                 #exit program