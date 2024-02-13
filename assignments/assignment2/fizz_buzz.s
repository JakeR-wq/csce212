# fizz buzz in mips
.data
    result: .space 20
    fizz: .asciiz "Fizz"
    buzz: .asciiz "Buzz"
    fizzbuzz: .asciiz "FizzBuzz"
    newline: .asciiz "\n"

    .text
main:
    li $t0, 1   # i = 1
    li $t2, 100  # limit = 100

loop:
    bgt $t0, $t2, end  # if (i > limit) goto end

    li $t1, 15   # check if i is multiple of 3 and 5
    div $t0, $t1
    mfhi $t6
    bnez $t6, check_div_by_3  # if (i % 15 != 0) goto check_div_by_3

    la $a0, fizzbuzz  # load address
    li $v0, 4     # print_string
    syscall

    li $v0, 4     # print_string
    la $a0, newline   # load address
    syscall
    
    j loop_increment

check_div_by_3:
    li $t1, 3   # check if i is multiple of 3
    div $t0, $t1
    mfhi $t6
    bnez $t6, check_div_by_5  # if (i % 3 != 0) goto check_div_by_5

    li $v0, 4     # print_string
    la $a0, fizz   # load address
    syscall

    li $v0, 4     # print_string
    la $a0, newline   # load address
    syscall

    j loop_increment

check_div_by_5:
    li $t1, 5   # check if i is multiple of 5
    div $t0, $t1
    mfhi $t6
    bnez $t6, print_i  # if (i % 5 != 0) goto loop_increment

    li $v0, 4     # print_string
    la $a0, buzz   # load address
    syscall

    li $v0, 4     # print_string
    la $a0, newline   # load address
    syscall

    j loop_increment
    
print_i:
    move $a0, $t0
    li $v0, 1     # print_int
    syscall

    li $v0, 4     # print_string
    la $a0, newline   # load address
    syscall

    j loop_increment

loop_increment:
    addi $t0, $t0, 1  # i = i + 1
    j loop

end:
    li $v0, 10    # exit program
    syscall