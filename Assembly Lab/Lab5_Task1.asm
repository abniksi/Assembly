      .data                                 # define variable that will be stored in the static memory
g: .word 100                                # define g as a integer and setting it with a value of 100
h: .word 25                                 # define h as a integer and setting it with a value of 25
i: .word 2                                  # define i as a integer and setting it with a value of 2
k: .word 13                                 # define i as a integer and setting it with a value of 13
      .text                                 # body of the code
      .globl main

main:                                       # beginning of the program
      la $t0, g                             # load the memory address of the label 'g' that contains the integer value
      lw $t1, 0($t0)                        # loading the int value stored in $t0 to $t1

      la $t2, h                             # load the memory address of the label 'h' that contains the integer value
      lw $t3, 0($t2)                        # loading the int value stored in $t2 to $t3

      add $t4, $t1, $t3                     # adding $t1 = 100 and $t3 = 25 to $t4 which equals 125 now

      la $t0, i                             # load the memory address of the label 'i' that contains the integer value
      lw $t1, 0($t0)                        # loading the int value stored in $t0 to $t1

      la $t2, k                             # load the memory address of the label 'k' that contains the integer value
      lw $t3, 0($t2)                        # loading 'k' value into $t3
      add $t0, $t1, $t3                     # adding $t1 = 2 and $t3 = 13 to $t0 which equals 15 now

      sub $a0, $t4, $t0                     # sub $t0 = 15 from $t4 = 100 and store it in $a0 = 110
      li $v0, 1                             # referring to the 'print_int' system call
      syscall                               # execute 'print_int'

      li $v0, 10                            # referring to the exit system call for graceful termination of the code
      syscall                               # executing 'exit'
