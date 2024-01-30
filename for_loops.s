    .data


    .text
main:
    #start value = 1
    li $t0, 1
    #end value = 20
    li $t1, 20

loop:
    bgt $t0, $t1, end #if t0 > t1, jump to end

    li $v0, 10
    syscall
