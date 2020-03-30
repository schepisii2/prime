.text
.globl main

main:
# Display prompt1
li $v0, 4 
la $a0, prompt1 
syscall

li $v0, 5 
syscall

move $s0, $v0 #hi

blt $s0, 2, done

# Load values
addi $s1, $0, 2 # loop counter (i=2)

# Loop from 2-n
loop:
beq $s1, $s0, done # if  i==n, done
addi $s2, $0, 2 # j=2
j check
next:
addi $s1, $s1, 1
j loop

check: 
beq $s1, $s2, prime # if j==i, prime
div $s1, $s2 #hi = i%j
mfhi $t0
beq $t0, $0, next
addi $s2, $s2, 1
j check

prime:
li $v0, 1
move $a0, $s1
syscall
li $v0, 4
la $a0, space
j next


done:

#exit
end: li $v0, 10 
syscall 
 
.data
prompt1:
 .asciiz "Enter a positive number "
space:
 .asciiz " "
