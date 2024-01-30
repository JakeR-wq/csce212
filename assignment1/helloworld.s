    .data
# init variable here
hello:  .asciiz "Hello, World!"
newline: .asciiz "\n"

    .text
# program code goes here
main:
    la $a0, hello      # load ASCII value of "hello" into $a0

    li $v0, 4          # system call code for print_str = 4
    syscall            # do that (print_str)

    la $a0, newline    # load newline address into $a0
    li $v0, 4          # system call code for print_str = 4
    syscall             # do that (print_str)

    li $v0, 10          # exit
    syscall             # do that (exit)

