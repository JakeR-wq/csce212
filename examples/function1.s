    .data
message:    .asciiz "Well, hello there!\n"
newLine:    .asciiz "\n"

    .text
main:
    # call the displayMessage routine (function)
    jal		displayMessage		# jump to displayMessage and save position to $ra
    
    addi    $s0, $0, 5      # put 5 into $s0
    add     $a0, $0, $s0    # 0+5, save that to $a0 (for SPIM)
    li      $v0, 1          # get ready to print an int
    syscall
    la      $a0, newLine    # put "\n" where SPIM can see it
    li      $v0, 4          # get ready to print a string
    syscall                 # execute the print

    jal     displayMessage      # jump to displayMessage again

    li $v0, 10      # get read to exit
    syscall         # execute the exit


# displayMessage function
displayMessage:
    la  $a0, message    # put string where SPIM can read it
    li  $v0, 4          # get ready to print a string
    syscall             # execute the print
    # return to the code that called this function
    jr  $ra             # jump back to main