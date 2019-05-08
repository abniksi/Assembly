      .data                                 # define variable that will be stored in the static memory
msg: .asciiz "Input either 0 or 1\n"  
msg2: .asciiz "Result: "         # declaring a string type variable with a label msg
values: .word 10, 20, 30
result: .word 0
      .text                                 # body of the code
      .globl main
main: 
	li $v0, 4                             # referring to the 'print_str' system call
      la $a0, msg                           # load the memory address for the label 'msg' that contains the string
      syscall                               # executing print_str

      li $v0, 5                             # load "read_int" system call
      syscall                               # executing "read_int" system call. 
      move $t0, $v0

      la $t1, values
      lw $t2, 0($t1)

      la $t1, values
      lw $t3, 4($t1)

      la $t1, values
      lw $t4, 8($t1)

CONDITION: 
      bne $t0, 0, DONE
      add $t5, $t2, $t3
      j EXIT
DONE:
      sub $t5, $t4, $t3

EXIT:
      li $v0, 4                                 # referring to the 'print_str' system call
      la $a0, msg2                           # load the memory address for the label 'msg' that contains the string
      syscall  

      li $v0, 1
      move $a0, $t5
      syscall

      li $v0, 10
      syscall