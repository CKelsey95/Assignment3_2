.data

prompt:   .asciiz "What is the result of 5+5? Type your answer here: "
useranswer: .word 0
correct: .word 10
errormessage:     .asciiz "Wrong Answer!" 
goodmessage: .asciiz "Correct!"

.text
lw $t0, useranswer           # initializes user's answer into a register
lw $t1, correct          # initializes the correct answer into a register

la $a0, prompt       
li $v0, 4                # prints prompt
syscall

li $v0, 5
syscall
move $t0, $v0           # reads input from user and stores in $t0


beq $t0, $t1, good            # branches if useranswer = correct
j error                       # else: jump to error message

error:                        # prints error message and jumpt to terminate line
la $a0, errormessage
li $v0, 4
syscall
j exit 

good:
la $a0, goodmessage           #prints correct answer message
li $v0, 4
syscall

exit: li $v0, 10               # Exit the program
syscall
