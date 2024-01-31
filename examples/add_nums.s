    .data
# init variable here
newline: .asciiz "\n"

    .text
# program code goes here
main:
    li $s0, 456789           # load integer 5 into register $s1
    li $s1, 345678           # load integer 7 into register $s2
    addu $s2, $s0, $s1  # add unsigned $s1 and $s2 and store in $s3
    move $a0, $s2        # copy from $s2 to $a0 (argument register), mips can only access a registers

    li $v0, 1           # system call for print integer is 1 (the sum will be printed)
    syscall             # do that (print the sum)

    la $a0, newline     # load the ASCII value of the newline string into $a0
    li $v0, 4           # system call for print string is 4 (printing newline)
    syscall             # do that (print the newline)

    li $v0, 10          # exit
    syscall             # do that (exit)
