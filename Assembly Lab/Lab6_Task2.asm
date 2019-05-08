    .data        
startMessage: .asciiz "Input number between 0 and 9\n"          
endMessage: .asciiz "End of program\n"            
newLine: .asciiz "\n"
finalResult: .asciiz "Sum: "
sum: .word 50
userInput: .word 0
    .text
    .globl mainz

main:
    li $v0, 4                             # referring to the 'print_str' system call
    la $a0, startMessage                           # load the memory address for the label 'msg' that contains the string
    syscall                               # executing print_str

    li $v0, 5                                 # load "read_int" system call
    syscall  
    move $t0, $v0                             # executing "read_int" system call
   
    la $t1, sum
    lw $t4, 0($t1)

loop: 
    slt $t1, $zero, $t0
    beq $t1, $zero, DONE  
    add $t4, $t4, $t0           # load the address of userInput
    sub $t0, $t0, 1
    j loop
    
DONE:
    li $v0, 4
    la $a0, endMessage
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10                            # referring to the exit system call for graceful termination of the code
    syscall                               # executing 'exit'