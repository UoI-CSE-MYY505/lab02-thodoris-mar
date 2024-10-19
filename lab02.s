
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
   beq a1, zero, done  # If array size is 0, exit

loop:
    lw t0, 0(a0)         # Load the current element from memory
    beq t0, a2, match    # If it matches the search value, store the address
    addi a0, a0, 4       # Move to the next element's address
    addi a1, a1, -1      # Decrease the remaining element count
    bnez a1, loop        # If more elements remain, continue the loop
    j done           

match:
    mv s0, a0           # Store the address of the matching element in s0
    addi a0, a0, 4      # Move to the next element's address
    addi a1, a1, -1     # Decrease the remaining element coun
    bnez a1, loop       # If more elements remain, continue the loop
done:
    addi a7, zero, 10 
    ecall
