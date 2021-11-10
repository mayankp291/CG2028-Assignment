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
@R10 -stores MIN_DISTANCE_LABEL, class

classification:
    PUSH {R1-R10,R14}

  	BL EUCLIDEAN_DISTANCE
  	LDR R10, [R2], #4       @store label[0] and increment
  	MOV R9, R7				@move CURRENT_DISTANCE to R9, initialise R9
	SUBS R0, #1				@N - 1

 LOOP:
	BL EUCLIDEAN_DISTANCE 	@get euclidean distance, update CURRENT_DISTANCE
	LDR R8, [R2], #4	    @store label[i] and increment
	CMP R9, R7 				@CURRENT_DISTANCE - MIN_DISTANCE
	ITT PL 					@if CURRENT_DISTANCE <= MIN_DISTANCE
	MOVPL R9, R7		    @MOVE CURRENT_DISTANCE INTO MIN_DISTANCE
	MOVPL R10, R8 			@MOVE CURRENT_LABEL TO CLASS
	SUBS R0, #1 			@N = N - 1
	BNE LOOP				@IF N!= 0, go to LOOP

@ prepares return value
    MOV R0, R10 			@moves identified class into R0
    POP {R1-R10,R14}

@ return to C program
    BX LR


EUCLIDEAN_DISTANCE:
	LDR R4, [R1], #4		@store point[i] value into R4 and increment R1 to prepare for y value
	LDR R5, [R3]			@store sample[0] value into R5
	SUB R6, R4, R5			@store (point[i] - sample[0]) into R6
	MUL R6, R6				@calculate (point[0] - sample[0])^2 and store into R6
	LDR R4, [R1], #4		@store point[i + 1] value into R4 and increment R1 to prepare for next x value
	LDR R5, [R3, #4]		@store sample[1] value into R5
  	SUB R7, R4, R5			@store (point[i + 1] - sample[1]) into R7
	MLA R7, R7, R7, R6		@store (point[1] - sample[1])^2 + (point[0] - sample[0])^2 in R7 (CURRENT_DISTANCE)
  	BX LR
