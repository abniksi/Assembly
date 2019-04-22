      .data                                                                                   # define variable that will be stored in the static memory
msg:  .asciiz "Start of program. Input two integers to be stored in Augend array.\n"           # declaring a string type variable with a label msg
msg2: .asciiz "\nEnd of program\n"                                                            # declaring a string type variable with a label msg2
msg3: .asciiz "\nInput two integers to be stored in Addend array.\n"                          # declaring a string type variable with a label msg3
msg4: .asciiz "Sum: "                       # declaring a string type variable with a label msg4
msg5: .asciiz "\nTotal Sum: "               # declaring a string type variable with a label msg5

Augend: .word 0, 0                          # declaring an array called Augend and initally storing it with 0, 0
Addend: .word 0, 0                          # declaring an array called Addend and initally storing it with 0, 0
Sum:    .word 0, 0                          # declaring an array called Sum and initally storing it with 0, 0

      .text                                 # body of the code
      .globl main

main:                                       # beginning of the program
      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg                           # load the memory address for the label 'msg' that contains the string
      syscall                               # executing print_str

      li $v0, 5                             # load "read_int" system call
      syscall                               # executing "read_int" system call
      la $t0, Augend                        # load the address of Augend
      sw $v0, 0($t0)                        # save the user input to the first index of Augend
      lw $t1, 0($t0)                        # load the value into Augend

      li $v0, 5                             # load "read_int" system call
      syscall                               # executing "read_int" system call
      la $t0, Augend                        # load the address of Augend
      sw $v0, 4($t0)                        # save the user input to the second index of Augend
      lw $t2, 4($t0)                        # load the value into Augend

      add $t3, $t1, $t2                     # adding the values stored in the Augend array to $t3

      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg4                          # load the memory address for the label 'msg4' that contains the string
      syscall                               # executing 'print_str' system call

      li $v0, 1                             # referring to the 'print_int' system call
      move $a0, $t3                         # move value of $t3 into $a0
      syscall                               # execute 'print_int' system call

      la $t0, Sum                           # load the address of Sum
      sw $a0, 0($t0)                        # save the value of $a0 into the first index of Sum array
      lw $t5, 0($t0)                        # load input into $t5 register

      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg3                          # load the memory address for the label 'msg3' that contains the string
      syscall                               # executing print_str

      li $v0, 5                             # load "read_int" system call
      syscall                               # executing "read_int" system call
      la $t0, Addend                        # load the address of Addend
      sw $v0, 0($t0)                        # save the user input to the first index of Addend
      lw $t1, 0($t0)                        # load the value into Addend

      li $v0, 5                             # load "read_int" system call
      syscall                               # executing "read_int" system call
      la $t0, Addend                        # load the address of Addend
      sw $v0, 4($t0)                        # save the user input to the second index of Addend
      lw $t2, 4($t0)                        # load the value into Addend

      add $t3, $t1, $t2                     # adding the values stored in the Addend array to $t3

      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg4                          # load the memory address for the label 'msg4' that contains the string
      syscall                               # executing print_str

      li $v0, 1                             # referring to 'print_int' system call
      move $a0, $t3                         # moving $t3 into $a0 to be called
      syscall                               # execute 'print_int' system call

      la $t0, Sum                           # load the address of Sum
      sw $a0, 4($t0)                        # store the value of $a0 in the second index
      lw $t6, 4($t0)                        # load value into $t6 register

      add $t7, $t6, $t5                     # add $t5 (sum of augend) and $t6 (sum of addend) into $t7 register

      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg5                          # load the memory address for the label 'msg5' that contains the string
      syscall                               # executing print_str

      li $v0, 1                             # print_int system call
      move $a0, $t7                         # move $t7 into $a0
      syscall                               # execute print_int system call

      li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg2                          # load the memory address for the label 'msg2' that contains the string
      syscall                               # executing print_str

      li $v0, 10                            # referring to the exit system call for graceful termination of the code
      syscall                               # executing 'exit'
