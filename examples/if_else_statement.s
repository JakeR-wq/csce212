    .data

    .text
main:

    li $s0, 2        # f
    li $s1, 4        # g
    li $s2, 6        # h
    li $s3, 8        # i
    li $s4, 10       # j

    # if (i == j)
    bne $s3, $s4, else # if not equal, jump to else

    # to get here, i and j must be equal
    add $s0, $s1, $s2   # f = g + h
    
    j done      # jump to done

else:
    sub $s0, $s0, $s3   # f = f - i

done:
    li $v0, 10
    syscall