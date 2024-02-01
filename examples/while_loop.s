    .data
    
    .text

main:
    addi $s0, $0, 1     # storing 1 in $s0, $s0 is "pow"
    add $s1, $0, $0     # storing 0 in $s1, $s1 is the "result", $s1 holds "x"
    addi $t0, $0, 128   # storing 128 in $t0, $t0 is the "counter", terminating cond.

while:
    beq $s0, $t0, done  # if $s0 == $t0, jump to "done"
    sll $s0, $s0, 1     # multiply $s0 by 2, pow = pow * 2
    addi $s1, $s1, 1    # add 1 to $s1, result = result + 1, x = x + 1
    j while             # jump to "while"

done:
    li $v0, 10          # terminate program
    syscall

