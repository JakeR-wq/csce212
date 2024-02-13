    .data
newLine:    .asciiz "\n489t8394"

    .text
main:
    # $ra is set to line 7
    jal     incrementRegister   # go run the incrementRegister function

    li  $v0, 10
    syscall         #exit

incrementRegister:
    # print 10 \n
    addi    $s0, $0, 10     # 10+0 save that to s0

    # store $ra on the stack, but scooted over
    sw		$ra, 4($sp)		# take the contents of $ra
                            # copy them to "the stack", in the next position
    
    # this is where the printS0 code used to be
    # $ra is set to line 22
    jal     printS0

    la      $a0, newLine    # put newLine into a0
    li      $v0, 4
    syscall                 # print the string

    # restore $ra from the location we saved on the stack
    lw      $ra, 4($sp)     # restoring $ra back to what saved on line 17

    jr      $ra             # jump back to wherever (main)

printS0:
    li      $v0, 1          # print an int
    move 	$a0, $s0		# $a0 = $s0
    syscall
    jr      $ra             # jump back to wherever (incrementRegister)