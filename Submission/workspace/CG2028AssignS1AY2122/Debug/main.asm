   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC2:
  21 0000 61736D3A 		.ascii	"asm: class = %d \012\000"
  21      20636C61 
  21      7373203D 
  21      20256420 
  21      0A00
  22 0012 0000     		.align	2
  23              	.LC3:
  24 0014 4320203A 		.ascii	"C  : class = %d \012\000"
  24      20636C61 
  24      7373203D 
  24      20256420 
  24      0A00
  25 0026 0000     		.align	2
  26              	.LC0:
  27 0028 6FF0FFFF 		.word	-3985
  28 002c F6DEFFFF 		.word	-8458
  29 0030 A0DBFFFF 		.word	-9312
  30 0034 70E6FFFF 		.word	-6544
  31 0038 E0240000 		.word	9440
  32 003c FAEBFFFF 		.word	-5126
  33 0040 B9030000 		.word	953
  34 0044 ECD9FFFF 		.word	-9748
  35 0048 D01A0000 		.word	6864
  36 004c 2AECFFFF 		.word	-5078
  37 0050 9F030000 		.word	927
  38 0054 D11E0000 		.word	7889
  39 0058 891C0000 		.word	7305
  40 005c 23E5FFFF 		.word	-6877
  41 0060 12F4FFFF 		.word	-3054
  42 0064 E9120000 		.word	4841
  43 0068 E0040000 		.word	1248
  44 006c DC0A0000 		.word	2780
  45 0070 7A0A0000 		.word	2682
  46 0074 41100000 		.word	4161
  47 0078 B1150000 		.word	5553
  48 007c AEE6FFFF 		.word	-6482
  49 0080 99E6FFFF 		.word	-6503
  50 0084 861C0000 		.word	7302
  51 0088 05F0FFFF 		.word	-4091
  52 008c 4C0E0000 		.word	3660
  53 0090 0E1A0000 		.word	6670
  54 0094 BC050000 		.word	1468
  55 0098 E2FCFFFF 		.word	-798
  56 009c 66130000 		.word	4966
  57 00a0 21020000 		.word	545
  58 00a4 FD070000 		.word	2045
  59              		.align	2
  60              	.LC1:
  61 00a8 19000000 		.word	25
  62 00ac 01000000 		.word	1
  63              		.section	.text.main,"ax",%progbits
  64              		.align	2
  65              		.global	main
  66              		.thumb
  67              		.thumb_func
  69              	main:
  70              	.LFB0:
  71              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define k 1
   3:../src/main.c **** 
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment, Sem 1, AY 2021/22
   6:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   7:../src/main.c **** 
   8:../src/main.c **** extern int classification(int N, int* points, int* label, int* sample); // asm implementation
   9:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample); // reference C implementation
  10:../src/main.c **** 
  11:../src/main.c **** int main(void)
  12:../src/main.c **** {
  72              		.loc 1 12 0
  73              		.cfi_startproc
  74              		@ args = 0, pretend = 0, frame = 208
  75              		@ frame_needed = 1, uses_anonymous_args = 0
  76 0000 90B5     		push	{r4, r7, lr}
  77              	.LCFI0:
  78              		.cfi_def_cfa_offset 12
  79              		.cfi_offset 14, -4
  80              		.cfi_offset 7, -8
  81              		.cfi_offset 4, -12
  82 0002 B5B0     		sub	sp, sp, #212
  83              	.LCFI1:
  84              		.cfi_def_cfa_offset 224
  85 0004 00AF     		add	r7, sp, #0
  86              	.LCFI2:
  87              		.cfi_def_cfa_register 7
  13:../src/main.c **** 	//variables
  14:../src/main.c **** 	int N = 16;
  88              		.loc 1 14 0
  89 0006 4FF01003 		mov	r3, #16
  90 000a C7F8CC30 		str	r3, [r7, #204]
  15:../src/main.c **** 	// think of the values below as numbers of the form x.y
  16:../src/main.c **** 	// (decimal fixed point with 1 fractional decimal digits precision)
  17:../src/main.c **** 	// which are scaled up to allow them to be used integers
  18:../src/main.c **** 
  19:../src/main.c **** 	//35, 0 -> 15,20
  20:../src/main.c **** 	int points[32] = {-3985 ,-8458 ,-9312 ,-6544 ,9440 ,-5126 ,953 ,-9748 ,6864 ,-5078 ,927 ,7889 ,730
  91              		.loc 1 20 0
  92 000e 40F20003 		movw	r3, #:lower16:.LC0
  93 0012 C0F20003 		movt	r3, #:upper16:.LC0
  94 0016 07F14C01 		add	r1, r7, #76
  95 001a 1A46     		mov	r2, r3
  96 001c 4FF08003 		mov	r3, #128
  97 0020 0846     		mov	r0, r1
  98 0022 1146     		mov	r1, r2
  99 0024 1A46     		mov	r2, r3
 100 0026 FFF7FEFF 		bl	memcpy
  21:../src/main.c **** 	int label[16] = {1 ,1 ,0 ,1 ,1 ,0 ,1 ,1 ,0 ,1 ,1 ,1 ,1 ,1 ,0};
 101              		.loc 1 21 0
 102 002a 07F10C02 		add	r2, r7, #12
 103 002e 4FF04003 		mov	r3, #64
 104 0032 1046     		mov	r0, r2
 105 0034 4FF00001 		mov	r1, #0
 106 0038 1A46     		mov	r2, r3
 107 003a FFF7FEFF 		bl	memset
 108 003e 4FF00103 		mov	r3, #1
 109 0042 FB60     		str	r3, [r7, #12]
 110 0044 4FF00103 		mov	r3, #1
 111 0048 3B61     		str	r3, [r7, #16]
 112 004a 4FF00103 		mov	r3, #1
 113 004e BB61     		str	r3, [r7, #24]
 114 0050 4FF00103 		mov	r3, #1
 115 0054 FB61     		str	r3, [r7, #28]
 116 0056 4FF00103 		mov	r3, #1
 117 005a 7B62     		str	r3, [r7, #36]
 118 005c 4FF00103 		mov	r3, #1
 119 0060 BB62     		str	r3, [r7, #40]
 120 0062 4FF00103 		mov	r3, #1
 121 0066 3B63     		str	r3, [r7, #48]
 122 0068 4FF00103 		mov	r3, #1
 123 006c 7B63     		str	r3, [r7, #52]
 124 006e 4FF00103 		mov	r3, #1
 125 0072 BB63     		str	r3, [r7, #56]
 126 0074 4FF00103 		mov	r3, #1
 127 0078 FB63     		str	r3, [r7, #60]
 128 007a 4FF00103 		mov	r3, #1
 129 007e 3B64     		str	r3, [r7, #64]
  22:../src/main.c **** 	int sample[2] = {25, 1};
 130              		.loc 1 22 0
 131 0080 40F20003 		movw	r3, #:lower16:.LC1
 132 0084 C0F20003 		movt	r3, #:upper16:.LC1
 133 0088 07F10402 		add	r2, r7, #4
 134 008c 93E80300 		ldmia	r3, {r0, r1}
 135 0090 82E80300 		stmia	r2, {r0, r1}
  23:../src/main.c **** 
  24:../src/main.c **** 	// Call assembly language function to perform classification
  25:../src/main.c **** 	printf( "asm: class = %d \n", classification(N, points, label, sample) ) ;
 136              		.loc 1 25 0
 137 0094 40F20004 		movw	r4, #:lower16:.LC2
 138 0098 C0F20004 		movt	r4, #:upper16:.LC2
 139 009c 07F14C01 		add	r1, r7, #76
 140 00a0 07F10C02 		add	r2, r7, #12
 141 00a4 07F10403 		add	r3, r7, #4
 142 00a8 D7F8CC00 		ldr	r0, [r7, #204]
 143 00ac FFF7FEFF 		bl	classification
 144 00b0 0346     		mov	r3, r0
 145 00b2 2046     		mov	r0, r4
 146 00b4 1946     		mov	r1, r3
 147 00b6 FFF7FEFF 		bl	printf
  26:../src/main.c **** 	printf( "C  : class = %d \n", classification_c(N, points, label, sample) ) ;
 148              		.loc 1 26 0
 149 00ba 40F20004 		movw	r4, #:lower16:.LC3
 150 00be C0F20004 		movt	r4, #:upper16:.LC3
 151 00c2 07F14C01 		add	r1, r7, #76
 152 00c6 07F10C02 		add	r2, r7, #12
 153 00ca 07F10403 		add	r3, r7, #4
 154 00ce D7F8CC00 		ldr	r0, [r7, #204]
 155 00d2 FFF7FEFF 		bl	classification_c
 156 00d6 0346     		mov	r3, r0
 157 00d8 2046     		mov	r0, r4
 158 00da 1946     		mov	r1, r3
 159 00dc FFF7FEFF 		bl	printf
 160              	.L2:
  27:../src/main.c **** 
  28:../src/main.c **** 	while (1); //halt
 161              		.loc 1 28 0 discriminator 1
 162 00e0 FEE7     		b	.L2
 163              		.cfi_endproc
 164              	.LFE0:
 166 00e2 00BF     		.section	.rodata
 167              		.align	2
 168              	.LC4:
 169 00b0 64256420 		.ascii	"d%d = %d, class = %d \012\000"
 169      3D202564 
 169      2C20636C 
 169      61737320 
 169      3D202564 
 170 00c7 00       		.section	.text.classification_c,"ax",%progbits
 171              		.align	2
 172              		.global	classification_c
 173              		.thumb
 174              		.thumb_func
 176              	classification_c:
 177              	.LFB1:
  29:../src/main.c **** }
  30:../src/main.c **** 
  31:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample)
  32:../src/main.c **** { 	// The implementation below is meant only for verifying your results.
 178              		.loc 1 32 0
 179              		.cfi_startproc
 180              		@ args = 0, pretend = 0, frame = 40
 181              		@ frame_needed = 1, uses_anonymous_args = 0
 182 0000 2DE9F043 		push	{r4, r5, r6, r7, r8, r9, lr}
 183              	.LCFI3:
 184              		.cfi_def_cfa_offset 28
 185              		.cfi_offset 14, -4
 186              		.cfi_offset 9, -8
 187              		.cfi_offset 8, -12
 188              		.cfi_offset 7, -16
 189              		.cfi_offset 6, -20
 190              		.cfi_offset 5, -24
 191              		.cfi_offset 4, -28
 192 0004 8BB0     		sub	sp, sp, #44
 193              	.LCFI4:
 194              		.cfi_def_cfa_offset 72
 195 0006 00AF     		add	r7, sp, #0
 196              	.LCFI5:
 197              		.cfi_def_cfa_register 7
 198 0008 F860     		str	r0, [r7, #12]
 199 000a B960     		str	r1, [r7, #8]
 200 000c 7A60     		str	r2, [r7, #4]
 201 000e 3B60     		str	r3, [r7, #0]
 202              		.loc 1 32 0
 203 0010 6B46     		mov	r3, sp
 204 0012 1E46     		mov	r6, r3
  33:../src/main.c **** 	
  34:../src/main.c **** 	int i,j,n;
  35:../src/main.c **** 	int class;// returned labels of k=1 nearest neighbors
  36:../src/main.c **** 	int d[N]; // squared Euclidean distance
 205              		.loc 1 36 0
 206 0014 F868     		ldr	r0, [r7, #12]
 207 0016 00F1FF33 		add	r3, r0, #-1
 208 001a 7B61     		str	r3, [r7, #20]
 209 001c 0146     		mov	r1, r0
 210 001e 0A46     		mov	r2, r1
 211 0020 4FF00003 		mov	r3, #0
 212 0024 4FEAD261 		lsr	r1, r2, #27
 213 0028 4FEA4319 		lsl	r9, r3, #5
 214 002c 41EA0909 		orr	r9, r1, r9
 215 0030 4FEA4218 		lsl	r8, r2, #5
 216 0034 0146     		mov	r1, r0
 217 0036 0A46     		mov	r2, r1
 218 0038 4FF00003 		mov	r3, #0
 219 003c 4FEAD261 		lsr	r1, r2, #27
 220 0040 4FEA4315 		lsl	r5, r3, #5
 221 0044 0D43     		orrs	r5, r5, r1
 222 0046 4FEA4214 		lsl	r4, r2, #5
 223 004a 0346     		mov	r3, r0
 224 004c 4FEA8303 		lsl	r3, r3, #2
 225 0050 03F10703 		add	r3, r3, #7
 226 0054 03F10703 		add	r3, r3, #7
 227 0058 4FEAD303 		lsr	r3, r3, #3
 228 005c 4FEAC303 		lsl	r3, r3, #3
 229 0060 ADEB030D 		sub	sp, sp, r3
 230 0064 6B46     		mov	r3, sp
 231 0066 03F10703 		add	r3, r3, #7
 232 006a 4FEAD303 		lsr	r3, r3, #3
 233 006e 4FEAC303 		lsl	r3, r3, #3
 234 0072 3B61     		str	r3, [r7, #16]
  37:../src/main.c **** 	int d1;
  38:../src/main.c **** 
  39:../src/main.c **** 	
  40:../src/main.c **** 	// calculate the squared distance between test sample and each training data points
  41:../src/main.c **** 	for (i=0; i<N; i++){
 235              		.loc 1 41 0
 236 0074 4FF00003 		mov	r3, #0
 237 0078 7B62     		str	r3, [r7, #36]
 238 007a 38E0     		b	.L4
 239              	.L5:
  42:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 240              		.loc 1 42 0 discriminator 2
 241 007c 7B6A     		ldr	r3, [r7, #36]
 242 007e 4FEAC303 		lsl	r3, r3, #3
 243 0082 BA68     		ldr	r2, [r7, #8]
 244 0084 D318     		adds	r3, r2, r3
 245 0086 1A68     		ldr	r2, [r3, #0]
 246 0088 3B68     		ldr	r3, [r7, #0]
 247 008a 1B68     		ldr	r3, [r3, #0]
 248 008c D31A     		subs	r3, r2, r3
 249 008e 7A6A     		ldr	r2, [r7, #36]
 250 0090 4FEAC202 		lsl	r2, r2, #3
 251 0094 B968     		ldr	r1, [r7, #8]
 252 0096 8A18     		adds	r2, r1, r2
 253 0098 1168     		ldr	r1, [r2, #0]
 254 009a 3A68     		ldr	r2, [r7, #0]
 255 009c 1268     		ldr	r2, [r2, #0]
 256 009e 8A1A     		subs	r2, r1, r2
 257 00a0 02FB03F2 		mul	r2, r2, r3
  43:../src/main.c **** 		+ (points[2*i+1]-sample[1])*(points[2*i+1]-sample[1]);
 258              		.loc 1 43 0 discriminator 2
 259 00a4 7B6A     		ldr	r3, [r7, #36]
 260 00a6 4FEAC303 		lsl	r3, r3, #3
 261 00aa 03F10403 		add	r3, r3, #4
 262 00ae B968     		ldr	r1, [r7, #8]
 263 00b0 CB18     		adds	r3, r1, r3
 264 00b2 1968     		ldr	r1, [r3, #0]
 265 00b4 3B68     		ldr	r3, [r7, #0]
 266 00b6 03F10403 		add	r3, r3, #4
 267 00ba 1B68     		ldr	r3, [r3, #0]
 268 00bc CB1A     		subs	r3, r1, r3
 269 00be 796A     		ldr	r1, [r7, #36]
 270 00c0 4FEAC101 		lsl	r1, r1, #3
 271 00c4 01F10401 		add	r1, r1, #4
 272 00c8 B868     		ldr	r0, [r7, #8]
 273 00ca 4118     		adds	r1, r0, r1
 274 00cc 0868     		ldr	r0, [r1, #0]
 275 00ce 3968     		ldr	r1, [r7, #0]
 276 00d0 01F10401 		add	r1, r1, #4
 277 00d4 0968     		ldr	r1, [r1, #0]
 278 00d6 411A     		subs	r1, r0, r1
 279 00d8 01FB03F3 		mul	r3, r1, r3
 280 00dc D118     		adds	r1, r2, r3
  42:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 281              		.loc 1 42 0 discriminator 2
 282 00de 3B69     		ldr	r3, [r7, #16]
 283 00e0 7A6A     		ldr	r2, [r7, #36]
 284 00e2 43F82210 		str	r1, [r3, r2, lsl #2]
  41:../src/main.c **** 	for (i=0; i<N; i++){
 285              		.loc 1 41 0 discriminator 2
 286 00e6 7B6A     		ldr	r3, [r7, #36]
 287 00e8 03F10103 		add	r3, r3, #1
 288 00ec 7B62     		str	r3, [r7, #36]
 289              	.L4:
  41:../src/main.c **** 	for (i=0; i<N; i++){
 290              		.loc 1 41 0 is_stmt 0 discriminator 1
 291 00ee 7A6A     		ldr	r2, [r7, #36]
 292 00f0 FB68     		ldr	r3, [r7, #12]
 293 00f2 9A42     		cmp	r2, r3
 294 00f4 C2DB     		blt	.L5
  44:../src/main.c **** 	}
  45:../src/main.c **** 
  46:../src/main.c **** 	// print all distances
  47:../src/main.c **** 	for (i=0; i<N; i++){
 295              		.loc 1 47 0 is_stmt 1
 296 00f6 4FF00003 		mov	r3, #0
 297 00fa 7B62     		str	r3, [r7, #36]
 298 00fc 18E0     		b	.L6
 299              	.L7:
  48:../src/main.c **** 		printf( "d%d = %d, class = %d \n",i+1, d[i],label[i]) ;
 300              		.loc 1 48 0 discriminator 2
 301 00fe 40F20003 		movw	r3, #:lower16:.LC4
 302 0102 C0F20003 		movt	r3, #:upper16:.LC4
 303 0106 7A6A     		ldr	r2, [r7, #36]
 304 0108 02F10101 		add	r1, r2, #1
 305 010c 3A69     		ldr	r2, [r7, #16]
 306 010e 786A     		ldr	r0, [r7, #36]
 307 0110 52F82020 		ldr	r2, [r2, r0, lsl #2]
 308 0114 786A     		ldr	r0, [r7, #36]
 309 0116 4FEA8000 		lsl	r0, r0, #2
 310 011a 7C68     		ldr	r4, [r7, #4]
 311 011c 2018     		adds	r0, r4, r0
 312 011e 0468     		ldr	r4, [r0, #0]
 313 0120 1846     		mov	r0, r3
 314 0122 2346     		mov	r3, r4
 315 0124 FFF7FEFF 		bl	printf
  47:../src/main.c **** 	for (i=0; i<N; i++){
 316              		.loc 1 47 0 discriminator 2
 317 0128 7B6A     		ldr	r3, [r7, #36]
 318 012a 03F10103 		add	r3, r3, #1
 319 012e 7B62     		str	r3, [r7, #36]
 320              	.L6:
  47:../src/main.c **** 	for (i=0; i<N; i++){
 321              		.loc 1 47 0 is_stmt 0 discriminator 1
 322 0130 7A6A     		ldr	r2, [r7, #36]
 323 0132 FB68     		ldr	r3, [r7, #12]
 324 0134 9A42     		cmp	r2, r3
 325 0136 E2DB     		blt	.L7
  49:../src/main.c **** 	}
  50:../src/main.c **** 
  51:../src/main.c **** 	// find the k=1 nearest neighbors
  52:../src/main.c **** 
  53:../src/main.c **** 	d1 = d[0];
 326              		.loc 1 53 0 is_stmt 1
 327 0138 3B69     		ldr	r3, [r7, #16]
 328 013a 1B68     		ldr	r3, [r3, #0]
 329 013c BB61     		str	r3, [r7, #24]
  54:../src/main.c **** 	class = label[0];
 330              		.loc 1 54 0
 331 013e 7B68     		ldr	r3, [r7, #4]
 332 0140 1B68     		ldr	r3, [r3, #0]
 333 0142 FB61     		str	r3, [r7, #28]
  55:../src/main.c **** 	for (j=0; j<N; j++){
 334              		.loc 1 55 0
 335 0144 4FF00003 		mov	r3, #0
 336 0148 3B62     		str	r3, [r7, #32]
 337 014a 16E0     		b	.L8
 338              	.L10:
  56:../src/main.c **** 		if (d[j]<d1){
 339              		.loc 1 56 0
 340 014c 3B69     		ldr	r3, [r7, #16]
 341 014e 3A6A     		ldr	r2, [r7, #32]
 342 0150 53F82220 		ldr	r2, [r3, r2, lsl #2]
 343 0154 BB69     		ldr	r3, [r7, #24]
 344 0156 9A42     		cmp	r2, r3
 345 0158 0BDA     		bge	.L9
  57:../src/main.c **** 			class = label[j];
 346              		.loc 1 57 0
 347 015a 3B6A     		ldr	r3, [r7, #32]
 348 015c 4FEA8303 		lsl	r3, r3, #2
 349 0160 7A68     		ldr	r2, [r7, #4]
 350 0162 D318     		adds	r3, r2, r3
 351 0164 1B68     		ldr	r3, [r3, #0]
 352 0166 FB61     		str	r3, [r7, #28]
  58:../src/main.c **** 			d1 = d[j];
 353              		.loc 1 58 0
 354 0168 3B69     		ldr	r3, [r7, #16]
 355 016a 3A6A     		ldr	r2, [r7, #32]
 356 016c 53F82230 		ldr	r3, [r3, r2, lsl #2]
 357 0170 BB61     		str	r3, [r7, #24]
 358              	.L9:
  55:../src/main.c **** 	for (j=0; j<N; j++){
 359              		.loc 1 55 0
 360 0172 3B6A     		ldr	r3, [r7, #32]
 361 0174 03F10103 		add	r3, r3, #1
 362 0178 3B62     		str	r3, [r7, #32]
 363              	.L8:
  55:../src/main.c **** 	for (j=0; j<N; j++){
 364              		.loc 1 55 0 is_stmt 0 discriminator 1
 365 017a 3A6A     		ldr	r2, [r7, #32]
 366 017c FB68     		ldr	r3, [r7, #12]
 367 017e 9A42     		cmp	r2, r3
 368 0180 E4DB     		blt	.L10
  59:../src/main.c **** 		}
  60:../src/main.c **** 	}
  61:../src/main.c **** 	
  62:../src/main.c **** 	return class;
 369              		.loc 1 62 0 is_stmt 1
 370 0182 FB69     		ldr	r3, [r7, #28]
 371 0184 B546     		mov	sp, r6
  63:../src/main.c **** }
 372              		.loc 1 63 0
 373 0186 1846     		mov	r0, r3
 374 0188 07F12C07 		add	r7, r7, #44
 375 018c BD46     		mov	sp, r7
 376 018e BDE8F083 		pop	{r4, r5, r6, r7, r8, r9, pc}
 377              		.cfi_endproc
 378              	.LFE1:
 380 0192 00BF     		.text
 381              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:19     .rodata:00000000 $d
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:20     .rodata:00000000 .LC2
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:23     .rodata:00000014 .LC3
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:26     .rodata:00000028 .LC0
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:60     .rodata:000000a8 .LC1
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:64     .text.main:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:69     .text.main:00000000 main
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:176    .text.classification_c:00000000 classification_c
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:168    .rodata:000000b0 .LC4
C:\Users\ngnig\AppData\Local\Temp\cccDqJkt.s:171    .text.classification_c:00000000 $t
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
memcpy
memset
classification
printf
