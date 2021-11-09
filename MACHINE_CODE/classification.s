.syntax unified
   .cpu cortex-m3
   .thumb
   .align 2
   .global  classification
   .thumb_func

@ CG2028 Assignment, Sem 2, AY 2021/21
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@ student 1: Name: Nigel Ng, Matriculation No.: A0217408H
@ student 2: Name: Mayank Panjiyara, Matriculation No.: A0221571N

@Register map
@R0 - N, returns class
@R1 - pointer to points
@R2 - pointer to label
@R3 - pointer to sample
@R4 - stores point
@R5 - stores sample
@R6 - calculates (difference in x)^2, get value of label[i]
@R7 - calculates (difference in y)^2, stores value of CURRENT_DISTANCE
@R8 - stores CURRENT_DISTANCE_LABEL
@R9 - stores MIN_DISTANCE
@R10 -stores MIN_DISTANCE_LABEL

@@@@ FOR CONVERSIONS @@@@

@PW = 0b00 -> postindex, 0b11 -> preindex, 0b10 -> offset 
@CMD = 0b1101 -> MOV, 0b1010 -> CMP, ADD -> 0b0100, SUB -> 0b0010    (ALL DP)

classification:
    PUSH {R1-R10,R14}
	MOV R9, #0x0FFFFFFF		@initialise minimum distance to max signed int
  	LDR R10, [R2], #4 @store label[0] and increment                    0b0000 0100 1001 0010 1100 0000 0000 0100   0x0492C004


 LOOP:
	BL EUCLIDEAN_DISTANCE	@get euclidean distance, update CURRENT_DISTANCE  
	LDR R8, [R2], #4		@store label[i] and increment              0b0000 0100 1001 0010 1000 0000 0000 0100   0x04928004
	CMP R9, R7				@CURRENT_DISTANCE - MIN_DISTANCE           0b0000 0001 0101 1001 0000 0000 0000 0111   0x01590007
	ITT PL					@if CURRENT_DISTANCE <= MIN_DISTANCE
	MOVPL R9, R7				@MOVE CURRENT_DISTANCE INTO MIN_DISTANCE           
	MOVPL R10, R8				@MOVE CURRENT_LABEL TO CLASS
	SUBS R0, #1				@N = N - 1                                 0b0000 0010 0101 0000 0000 0000 0000 0001   0x02500001
	BNE LOOP				@If N != 0, go to LOOP                     0b0001 1000 0000 0000 0000 0000 0010 0000   0x18000020

@prepares return value
    MOV R0, R10 @moves identified class into R0                        0b0000 0001 1010 0000 0000 0000 0000 1010   0x01A0000A
    POP {R1-R10,R14}

@return to main.c
	BX LR

@let iterator in point array be i, starts from 0
EUCLIDEAN_DISTANCE:
	LDR R4, [R1], #4		@store point[i] value into R4 and increment R1 to prepare for y value   0b0000 0100 1001 0001 0100 0000 0000 0100      0x04914004
	LDR R5, [R3]			@store sample[0] value into R5                                NOT SURE  0b0000 0101 1001 0011 0101 0000 0000 0000      0x05935000
	SUB R6, R4, R5			@store (point[i] - sample[0]) into R6                                   0b0000 0000 0100 0100 0110 0000 0000 0101      0x00446005
	MUL R6, R6				@calculate (point[0] - sample[0])^2 and store into R6                   0b0000 0000 0000 0000 0110 0110 0001 0110      0x00006616
	LDR R4, [R1], #4		@store point[i + 1] value into R4 and increment R1 to prepare for next x value      0b0000 0100 1001 0001 0100 0000 0000 0100  0x04914004
	LDR R5, [R3, #4]		@store sample[1] value into R5                                                      0b0000 0101 1001 0011 0101 0000 0000 0100  0x05935004
  	SUB R7, R4, R5			@store (point[i + 1] - sample[1]) into R7                                           0b0000 0000 0100 0100 0111 0000 0000 0101  0x00447005
	MLA R7, R7, R7, R6		@store (point[1] - sample[1])^2 + (point[0] - sample[0])^2 in R7 (CURRENT_DISTANCE) 0b0000 0000 0010 0110 0111 0111 0001 0111  0x00247717
  	BX LR
