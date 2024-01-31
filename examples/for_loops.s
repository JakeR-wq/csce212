    .data
newline: .asciiz "\n"

    .text
main:
    #start value = 1
    li $t0, 1
    #end value = 20
    li $t1, 20

loop:
    bgt $t0, $t1, end #if t0 > t1, jump to end

    move $a0, $t0 #move t0 to a0 (first param for print)
    li $v0, 1 #system call 1 is for print
    syscall #print

    # print the newline
    la $a0, newline #load address of newline
    li $v0, 4 #system call 4 is for print newline
    syscall #print


    # still inside the loop
    # i++
    addi $t0, $t0, 1    # $t0 = $t0 + 1
    j loop #jump back to top of loop
    
end:

    li $v0, 10
    syscall
