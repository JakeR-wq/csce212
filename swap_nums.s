    .data
# int_array address in $a0
# k (index) value in $a1
    
    .text
main:
    sll $t1, $a1, 2   # $t1 = $a1 << 2, $t1 = k * 4
    add $t1, $a0, $t1   # $t1 = $a0 + $t1, $t1 = &int_array[k]
    # $t1 now holds the address of int_array[k]
    lw $t0, 0($t1)    # $t0 = *($t1), $t0 = int_array[k]
    lw $t2, 4($t1)    # $t2 = *($t1 + 4), $t2 = int_array[k + 1]

    sw $t2, 0($t1)    # *($t1) = $t2, int_array[k] = int_array[k + 1]
    sw $t0, 4($t1)    # *($t1 + 4) = $t0, int_array[k + 1] = int_array[k]


    li $v0, 10      # exit
    syscall         # do that(exit)