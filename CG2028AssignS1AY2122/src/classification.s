 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	classification
 	.thumb_func

@ CG2028 Assignment, Sem 2, AY 2021/21
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@ student 1: Name: Nigel Ng, Matriculation No.: A0217408H
@ student 2: Name: , Matriculation No.:
@ eg: student 1: Name: John Doe , Matriculation No.: A021234N

@Register map
@R0 - N, returns class
@R1 - points
@R2 - label
@R3 - sample
@R4 - register for calculation
@R5 - register for calculation
@R6 - general purpose register for writing/ reading
@R7 - general purpose register for writing/ reading
@R8 - intermediate register for storing count
@R9 - pointer to read points

classification:
@ PUSH / save (only those) registers which are modified by your function
		PUSH {R1-R9,R14}
@ parameter registers need not be saved.

@ write asm function body here

@ initialise current class to 0
LDR R6,=curr_class	@extract value of x
MOV R7, #0
STR R7, [R6]

@ extract N into register 8 for comparison later.
MOV R8, R0 @extract N into R8

@ extract sample_x
LDR R7, [R3]	@extract value of x
LDR R6, =sample_x
STR R7, [R6]

@ extract sample_y
LDR R7, [R3,#4]	@extract value of y
LDR R6, =sample_y
STR R7, [R6]

@ main chunk to calculate min_distance
LOOP:
	BL GET_EUCLIDEAN
	SUBS R8, #1
	BNE LOOP

@ prepare value to return (class) to C program in R0
BL RETURN_VALUE

@ POP / restore original register values. DO NOT save or restore R0. Why?
POP {R1-R9,R14}

@ return to C program
BX	LR

@gets the euclidean distance of current point of reference and sample.
GET_EUCLIDEAN:

@ extract point_x
	LDR R9, [R1], #4 @ gets x point, prepares to store y
	LDR R6, =point_x
	STR R9, [R6]

@ extract point_y
	LDR R9, [R1], #4 @ gets y point, prepares to store next value
	LDR R6, =point_y
	STR R9, [R6]

@ calculate euclidean distance

@ compare with min_distance. If lower, set label and min_distance

		BX LR

@sets R0 to the class
RETURN_VALUE:
		LDR R7,=point_y	@gets current class reading (most updated)
		LDR R0, [R7]
		BX LR


@label: .word value


@.lcomm label num_bytes - these values are important and thus are stored as static variables
.lcomm sample_x 4	@x coordinate of a particular sample (not modified in calculations)
.lcomm sample_y 4	@y coordinate of a particular sample (not modified in calculations)

.lcomm point_x 4	@x coordinate of a reference point (to be modifed (N - 1) times)
.lcomm point_y 4	@y coordinate of a reference point (to be modified (N - 1) times)
.lcomm curr_label 1 @current label of the point of refernece

.lcomm curr_distance 4
.lcomm min_distance 4
.lcomm curr_class 1
