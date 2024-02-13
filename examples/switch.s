    .data
    # winter=1, spring=2, summer=3, fall=4
season:     .word   3 # summer
covering:   .word   20 # base level of covering

    
    .text
main:
    # load the assets from the data section
    lw $s0, season      # loading season word in s0
    lw $s1, covering    # loading covering word in s1
    addi    $t0, $0, 1

case1:
    # if t0 == s0, then case 1 is active
    bne $s0, $t0, case2 # if $t0 != $s0, go to case2
    addi	$s1, $s1, 5 # covering += 5 ( heavy coat )
    j done

case2:
    # if t0 == s0, then case 2 is active
    addi $t0, $t0, 1    # i++
    bne $t0, $s0, case3 # if i != season, go to case3
    addi $s1, $s1, 1  # covering += 1 ( umbrella )
    j done
    
case3:
    # if t0 == s0, then case 3 is active
    addi $t0, $t0, 1    # i++
    bne $t0, $s0, case4 # if i != season, go to case3
    addi $s1, $s1, -5  # covering -= 1 ( short and tshirt )
    j done

case4: # default case
    addi $s1, $s1, 2  # covering += 2 ( light jacket )

done:
    # print the covering value
    la $a0, 0($s1)
    li $v0, 1           # system call for print_int
    syscall
    # exit the program
    li $v0, 10
    syscall