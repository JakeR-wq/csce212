    .data
num_list: .word 1 2 3 4 5 6 7 8 9 10
iterator: .word 0
size:     .word 10
msg:      .asciiz "The sum is: "

    .text
main:
    la $t0, num_list    # load address of list
    lw $t1, iterator    # load iterator
    lw $t2, size        # load size

begin_loop:
    bgt $t1, $t2, end_loop  # if (iterator > size) goto end_loop
    sll $t3, $t1, 2         # t3 = iterator * 4 (each element is 4 bits
    addu $t3, $t3, t    # where in memory does the next item live?
    lw $t6, 0($t3)          # get the contents of the array at next location
    # computing the sum (as we go)
    addu $t7, $t7, $t6      # t7 has the running sum
    addi $t1, $t1, 1        # increment the iterator
    j begin_loop            # loop around




end_loop:
    # print the user-friendly string
    la $a0, msg             # put msg where spim can read it
    li $v0, 4               # syscall 4 is for printing strings
    syscall                 # print the string
    # print the sum
    la $a0, 0($t7)          # pass the sum as the first argument to print
    li $v0, 1               # syscall 1 is for printing integers
    syscall                 # print
    li $v0, 4
    syscall