; BEGIN STG2
	global	progr
	global	R0,R1,R2,R3,R4,R5,R6,R7,R8,R9
	global	RA,RB,RC,RD,RE,RF,RG,RH,RI,RJ,RK,RL,RM
	global	RN,RO,RP,RQ,RR,RS,RT,RU,RV,RR,RX,RY,RZ,list
	extern	LBR,LBW,LINE,MB
	extern	exit,iwrch,iread,iwrite,icntl,iprnt,ioop
	section	.data
R0:	dw	0
	dw	0,0
R1:	dw	1
	dw	1,1
R2:	dw	2
	dw	2,2
R3:	dw	3
	dw	3,3
R4:	dw	0
	dw	4,0
R5:	dw	10
	dw	5,0
R6:	dw	0
	dw	6,0
R7:	dw	4
	dw	7,0
R8:	dw	0
	dw	8,0
R9:	dw	listend-list
	dw	9,0
RA:	dw	0,0,0
RB:	dw	0,0,0
RC:	dw	0,0,0
RD:	dw	0,0,0
RE:	dw	0,0,0
RF:	dw	0,0,0
RG:	dw	0,0,0
RH:	dw	0,0,0
RI:	dw	0,0,0
RJ:	dw	0,0,0
RK:	dw	0,0,0
RL:	dw	0,0,0
RM:	dw	0,0,0
RN:	dw	0,0,0
RO:	dw	0,0,0
RP:	dw	0,0,0
RQ:	dw	0,0,0
RR:	dw	0,0,0
RS:	dw	0,0,0
RT:	dw	0,0,0
RU:	dw	0,0,0
RV:	dw	0,0,0
RW:	dw	0,0,0
RX:	dw	0,0,0
RY:	dw	0,0,0
RZ:	dw	0,0,0
	section	.bss
list:	resw	16380
listend:
	section	.text
progr:
	push	EBP
	mov	EBP,ESP
; FLG I = 0
	xor	AX,AX
	mov	[RI+4],AX
; VAL I = 1 + 0
	mov	AX,1
	mov	[RI+2],AX
; PTR I = 0 + 0
	xor	AX,AX
	mov	[RI],AX
; READ NEXT I
	mov	AX,[RI+2]
	cwde
	mov	[ESP],EAX
	call	iread
	mov	[RI+4],AX
; TO 98 IF FLG I NE 0
	or	AX,AX
	jnz	L98
; VAL A = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RA+2],AX
; PTR A = 8 + 0
	mov	AX,[R8]
	mov	[RA],AX
; STO A = I
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; FLG B = 2
	mov	AX,2
	mov	[RB+4],AX
; VAL B = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RB+2],AX
; VAL C = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RC+2],AX
; PTR C = 9 + 0
	mov	AX,[R9]
	mov	[RC],AX
; VAL D = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RD+2],AX
; VAL E = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RE+2],AX
; PTR E = VAL E
	mov	[RE],AX
; VAL F = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RF+2],AX
; PTR F = A + 7
	mov	AX,[RA]
	add	AX,4
	mov	[RF],AX
; STO F = 0
	cwde
	add	EAX,list
	mov	EBX,EAX
	xor	EAX,EAX
	mov	[EBX],EAX
; VAL G = 0 + 0
	xor	AX,AX
	mov	[RG+2],AX
; PTR H = 5 * 7
	mov	AX,10
	sal	AX,2
	mov	[RH],AX
; FLG J = 1
	mov	AX,1
	mov	[RJ+4],AX
; PTR J = 0 + 0
	xor	AX,AX
	mov	[RJ],AX
; FLG L = 1
	mov	AX,1
	mov	[RL+4],AX
; VAL L = 0 - 1
	xor	AX,AX
	dec	AX
	mov	[RL+2],AX
; PTR L = 0 + 0
	xor	AX,AX
	mov	[RL],AX
; VAL M = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RM+2],AX
; PTR M = 0 + 0
	xor	AX,AX
	mov	[RM],AX
; FLG N = 0
	xor	AX,AX
	mov	[RN+4],AX
; VAL N = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RN+2],AX
; FLG O = 0
	xor	AX,AX
	mov	[RO+4],AX
; VAL O = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RO+2],AX
; VAL P = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RP+2],AX
; VAL Q = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RQ+2],AX
; VAL R = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RR+2],AX
; PTR R = 0 + 0
	xor	AX,AX
	mov	[RR],AX
; PTR 4 = 7 + 7
	mov	AX,4
	add	AX,4
	mov	[R4],AX
; PTR 8 = F + 7
	mov	AX,[RF]
	add	AX,4
	mov	[R8],AX
; TO 01 BY D
	mov	EAX,G1
	sub	EAX,progr
	mov	[RD],AX
	jmp	L01
G1:

; LOC 01
L01:
; GET I = A
	mov	AX,[RA]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; READ NEXT I
	cwde
	mov	[ESP],EAX
	call	iread
	mov	[RI+4],AX
; TO 98 IF FLG I NE 0
	or	AX,AX
	jnz	L98
; PTR I = C + 0
	mov	AX,[RC]
	mov	[RI],AX
; VAL Y = 0 + 0
	xor	AX,AX
	mov	[RY+2],AX
; PTR Y = C + 0
	mov	AX,[RC]
	mov	[RY],AX
; TO 02 IF PTR M = 0
	mov	AX,[RM]
	or	AX,AX
	jz	L02
; PTR M = M - 1
	dec	word [RM]
; TO 01
	jmp	L01

; LOC 02
L02:
; PTR 9 = I + 0
	mov	AX,[RI]
	mov	[R9],AX
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; PTR I = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RI],AX
; TO 97 IF PTR 8 GE I
	mov	AX,[R8]
	cmp	AX,[RI]
	jge	L97
; STO 9 = I
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 04 IF VAL I = L
	mov	AX,[RI+2]
	cmp	AX,[RL+2]
	jz	L04
; TO 03 IF VAL I = A
	cmp	AX,[RA+2]
	jz	L03
; VAL Y = Y + 1
	inc	word [RY+2]
; TO 02 IF VAL I NE B
	cmp	AX,[RB+2]
	jnz	L02
; PTR B = I + 0
	mov	AX,[RI]
	mov	[RB],AX
; STO 9 = B
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RB+2]
	sal	AX,2
	or	AX,[RB+4]
	sal	EAX,16
	mov	AX,[RB]
	mov	[EBX],EAX
; TO 02
	jmp	L02

; LOC 03
L03:
; PTR 9 = I + 0
	mov	AX,[RI]
	mov	[R9],AX
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; PTR I = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RI],AX
; STO 9 = I
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 97 IF PTR 8 GE I
	mov	AX,[R8]
	cmp	AX,[RI]
	jge	L97
; TO 03 IF VAL I NE L
	mov	AX,[RI+2]
	cmp	AX,[RL+2]
	jnz	L03

; LOC 04
L04:
; PTR U = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; STO U = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR V = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RV],AX
; STO V = 3
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = V - 7
	mov	AX,[RV]
	sub	AX,4
	mov	[RU],AX
; PTR 9 = U + 0
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; GET W = A
	mov	AX,[RA]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; FLG Y = 0
	xor	AX,AX
	mov	[RY+4],AX
; PTR Z = A + 0
	mov	AX,[RA]
	mov	[RZ],AX
; TO 58 BY B
	mov	EAX,G2
	sub	EAX,progr
	mov	[RB],AX
	jmp	L58
G2:
; TO 50 IF FLG B = 2
	mov	AX,[RB+4]
	cmp	AX,2
	jz	L50
; TO 56 IF FLG Y = 0
	mov	AX,[RY+4]
	or	AX,AX
	jz	L56
; STO 9 = 1
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0x50001
	mov	[EBX],EAX
; PTR 9 = 9 - H
	mov	AX,[R9]
	sub	AX,[RH]
	mov	[R9],AX
; STO 9 = J
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RJ+2]
	sal	AX,2
	or	AX,[RJ+4]
	sal	EAX,16
	mov	AX,[RJ]
	mov	[EBX],EAX
; PTR J = 9 + H
	mov	AX,[R9]
	add	AX,[RH]
	mov	[RJ],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = C
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RC+2]
	sal	AX,2
	or	AX,[RC+4]
	sal	EAX,16
	mov	AX,[RC]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = D
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RD+2]
	sal	AX,2
	or	AX,[RD+4]
	sal	EAX,16
	mov	AX,[RD]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RK+2]
	sal	AX,2
	or	AX,[RK+4]
	sal	EAX,16
	mov	AX,[RK]
	mov	[EBX],EAX
; PTR K = U + 0
	mov	AX,[RU]
	mov	[RK],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RR+2]
	sal	AX,2
	or	AX,[RR+4]
	sal	EAX,16
	mov	AX,[RR]
	mov	[EBX],EAX
; PTR R = 0 + 0
	xor	AX,AX
	mov	[RR],AX
; PTR C = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RC],AX
; TO 97 IF PTR 8 GE C
	mov	AX,[R8]
	cmp	AX,[RC]
	jge	L97
; TO 05 BY D
	mov	EAX,G3
	sub	EAX,progr
	mov	[RD],AX
	jmp	L05
G3:

; LOC 05
L05:
; PTR 9 = C + 0
	mov	AX,[RC]
	mov	[R9],AX
; PTR Y = 0 + 0
	xor	AX,AX
	mov	[RY],AX

; LOC 06
L06:
; TO 07 IF PTR M = 0
	mov	AX,[RM]
	or	AX,AX
	jz	L07
; PTR Z = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RZ],AX
; GET K = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RK],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RK+4],DX
	sar	AX,2
	mov	[RK+2],AX
; GET I = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 08 IF VAL I = 1
	cmp	AX,1
	jz	L08
; PTR M = M - 1
	dec	word [RM]
; GET Z = Z
	mov	AX,[RZ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; TO 06 IF FLG Z NE 3
	mov	AX,[RZ+4]
	cmp	AX,3
	jnz	L06
; PTR Y = Y + 1
	inc	word [RY]
; TO 06 IF VAL Z = 7
	mov	AX,[RZ+2]
	cmp	AX,7
	jz	L06
; PTR Y = Y - 1
	dec	word [RY]
; TO 06 IF VAL Z NE 8
	cmp	AX,8
	jnz	L06
; PTR Y = Y - 1
	dec	word [RY]
; TO 06 IF PTR Y GE 0
	mov	AX,[RY]
	or	AX,AX
	jge	L06
; TO 06 IF PTR R = 0
	mov	AX,[RR]
	or	AX,AX
	jz	L06
; PTR U = R - 7
	sub	AX,4
	mov	[RU],AX
; GET Y = U
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 49 IF FLG Y NE 1
	mov	AX,[RY+4]
	cmp	AX,1
	jnz	L49
; PTR C = R + 0
	mov	AX,[RR]
	mov	[RC],AX
; GET R = R
	mov	AX,[RR]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RR],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RR+4],DX
	sar	AX,2
	mov	[RR+2],AX
; TO 05
	jmp	L05

; LOC 07
L07:
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 09 IF FLG I = 2
	mov	AX,[RI+4]
	cmp	AX,2
	jz	L09
; TO 22 IF FLG I = 3
	cmp	AX,3
	jz	L22
; PTR I = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RI],AX
; STO 9 = I
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; PTR 9 = I + 0
	mov	AX,[RI]
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; TO 07 IF FLG I = 0
	mov	AX,[RI+4]
	or	AX,AX
	jz	L07
; PTR Y = C - 9
	mov	AX,[RC]
	sub	AX,[R9]
	mov	[RY],AX
; PTR Y = Y / 7
	sar	AX,2
	mov	[RY],AX
; PTR Y = Y - 1
	dec	word [RY]
; VAL Y = PTR Y
	mov	AX,[RY]
	mov	[RY+2],AX
; PTR Y = C + 0
	mov	AX,[RC]
	mov	[RY],AX
; TO 04 IF VAL I NE 1
	mov	AX,[RI+2]
	cmp	AX,1
	jnz	L04

; LOC 08
L08:
; PTR 9 = J - H
	mov	AX,[RJ]
	sub	AX,[RH]
	mov	[R9],AX
; GET J = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RJ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RJ+4],DX
	sar	AX,2
	mov	[RJ+2],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; GET C = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RC],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RC+4],DX
	sar	AX,2
	mov	[RC+2],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; GET D = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RD],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RD+4],DX
	sar	AX,2
	mov	[RD+2],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; GET K = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RK],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RK+4],DX
	sar	AX,2
	mov	[RK+2],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; GET R = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RR],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RR+4],DX
	sar	AX,2
	mov	[RR+2],AX
; RETURN BY D
	mov	AX,[RD]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 09
L09:
; PTR V = J + I
	mov	AX,[RJ]
	add	AX,[RI]
	mov	[RV],AX
; TO 21 IF VAL I = 6
	mov	AX,[RI+2]
	cmp	AX,6
	jz	L21
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 45 IF VAL I = 7
	mov	AX,[RI+2]
	cmp	AX,7
	jz	L45
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 11 IF VAL I = 0
	mov	AX,[RI+2]
	or	AX,AX
	jz	L11
; TO 10 IF VAL I = 1
	cmp	AX,1
	jz	L10
; TO 12 IF VAL I = 2
	cmp	AX,2
	jz	L12
; TO 15 IF VAL I = 4
	cmp	AX,4
	jz	L15
; PTR X = Y + 0
	mov	AX,[RY]
	mov	[RX],AX
; TO 20 IF VAL I = 3
	mov	AX,[RI+2]
	cmp	AX,3
	jz	L20
; PTR N = VAL Y
	mov	AX,[RY+2]
	mov	[RN],AX
; TO 18 IF VAL I = 5
	mov	AX,[RI+2]
	cmp	AX,5
	jz	L18
; TO 23 IF VAL Y NE 1
	mov	AX,[RY+2]
	cmp	AX,1
	jnz	L23
; PTR N = VAL X
	mov	AX,[RX+2]
	mov	[RN],AX
; TO 18 IF VAL I = 8
	mov	AX,[RI+2]
	cmp	AX,8
	jz	L18
; MESSAGE CONV TO 4
	mov	EBX,MB
	mov	dword [EBX+10],"CONV"
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iprnt
	mov	[R4+4],AX
; TO 94 BY B
	mov	EAX,G4
	sub	EAX,progr
	mov	[RB],AX
	jmp	L94
G4:
; TO 07
	jmp	L07

; LOC 10
L10:
; PTR V = 9 + 7
	mov	AX,[R9]
	add	AX,4
	mov	[RV],AX
; GET W = F
	mov	AX,[RF]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; PTR Z = F + 0
	mov	AX,[RF]
	mov	[RZ],AX
; TO 58 BY B
	mov	EAX,G5
	sub	EAX,progr
	mov	[RB],AX
	jmp	L58
G5:
; TO 07 IF FLG Y NE 1
	mov	AX,[RY+4]
	cmp	AX,1
	jnz	L07
; FLG I = 0
	xor	AX,AX
	mov	[RI+4],AX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX

; LOC 11
L11:
; TO 07 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L07
; GET I = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; PTR X = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RX],AX
; STO 9 = X
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR 9 = X + 0
	mov	AX,[RX]
	mov	[R9],AX
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 07 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L07
; GET X = I
	mov	AX,[RI]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR I = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RI],AX
; STO 9 = I
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; PTR 9 = I + 0
	mov	AX,[RI]
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 11
	jmp	L11

; LOC 12
L12:
; FLG B = 2
	mov	AX,2
	mov	[RB+4],AX
; GET W = F
	mov	AX,[RF]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; PTR Z = F + 0
	mov	AX,[RF]
	mov	[RZ],AX
; TO 58 BY B
	mov	EAX,G6
	sub	EAX,progr
	mov	[RB],AX
	jmp	L58
G6:
; FLG B = 0
	xor	AX,AX
	mov	[RB+4],AX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 11 IF FLG Y = 1
	mov	AX,[RY+4]
	cmp	AX,1
	jz	L11
; PTR Y = 8 + 0
	mov	AX,[R8]
	mov	[RY],AX
; FLG Y = 1
	mov	AX,1
	mov	[RY+4],AX
; PTR L = L + 1
	inc	word [RL]
; PTR X = L + 0
	mov	AX,[RL]
	mov	[RX],AX
; PTR W = 9 + 7
	mov	AX,[R9]
	add	AX,4
	mov	[RW],AX
; VAL Y = 0 + 0
	xor	AX,AX
	mov	[RY+2],AX

; LOC 13
L13:
; PTR V = X / 5
	mov	AX,[RX]
	cwd
	idiv	word [R5]
	mov	[RV],AX
; PTR Z = V * 5
	imul	word [R5]
	mov	[RZ],AX
; PTR X = X - Z
	mov	AX,[RX]
	sub	AX,[RZ]
	mov	[RX],AX
; VAL X = PTR X
	mov	[RX+2],AX
; PTR X = V + 0
	mov	AX,[RV]
	mov	[RX],AX
; PTR W = W - 7
	mov	AX,[RW]
	sub	AX,4
	mov	[RW],AX
; STO W = X
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; VAL Y = Y + 1
	inc	word [RY+2]
; TO 97 IF PTR 8 GE W
	mov	AX,[R8]
	cmp	AX,[RW]
	jge	L97
; TO 13 IF PTR X NE 0
	mov	AX,[RX]
	or	AX,AX
	jnz	L13

; LOC 14
L14:
; GET X = W
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR W = W + 7
	mov	AX,[RW]
	add	AX,4
	mov	[RW],AX
; VAL X = X + E
	mov	AX,[RX+2]
	add	AX,[RE+2]
	mov	[RX+2],AX
; PTR X = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[RX],AX
; STO 8 = X
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR 8 = X + 0
	mov	AX,[RX]
	mov	[R8],AX
; TO 14 IF PTR 9 GE W
	mov	AX,[R9]
	cmp	AX,[RW]
	jge	L14
; STO 8 = 0
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	xor	EAX,EAX
	mov	[EBX],EAX
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; STO U = Y
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; FLG I = 0
	xor	AX,AX
	mov	[RI+4],AX
; TO 11
	jmp	L11

; LOC 15
L15:
; TO 74 BY P
	mov	EAX,G7
	sub	EAX,progr
	mov	[RP],AX
	jmp	L74
G7:
; TO 18 IF PTR N GE 0
	mov	AX,[RN]
	or	AX,AX
	jge	L18
; PTR O = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RO],AX
; TO 97 IF PTR 8 GE O
	mov	AX,[R8]
	cmp	AX,[RO]
	jge	L97
; STO 9 = O
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RO+2]
	sal	AX,2
	or	AX,[RO+4]
	sal	EAX,16
	mov	AX,[RO]
	mov	[EBX],EAX
; PTR 9 = O + 0
	mov	AX,[RO]
	mov	[R9],AX
; PTR N = 0 - N
	xor	AX,AX
	sub	AX,[RN]
	mov	[RN],AX
; TO 18
	jmp	L18

; LOC 16
L16:
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 17 IF FLG Y = 1
	mov	AX,[RY+4]
	cmp	AX,1
	jz	L17
; PTR V = V - 7
	mov	AX,[RV]
	sub	AX,4
	mov	[RV],AX
; TO 16 IF VAL Y NE I
	mov	AX,[RY+2]
	cmp	AX,[RI+2]
	jnz	L16
; PTR N = Y + 0
	mov	AX,[RY]
	mov	[RN],AX
; TO 18
	jmp	L18

; LOC 17
L17:
; PTR Y = V + H
	mov	AX,[RV]
	add	AX,[RH]
	mov	[RY],AX
; TO 23 IF PTR Y = J
	cmp	AX,[RJ]
	jz	L23
; PTR L = L + 1
	inc	word [RL]
; PTR I = L + 0
	mov	AX,[RL]
	mov	[RI],AX
; STO V = I
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; PTR V = V - 7
	mov	AX,[RV]
	sub	AX,4
	mov	[RV],AX
; GET Y = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; FLG Y = 1
	mov	AX,1
	mov	[RY+4],AX
; STO V = Y
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR N = L + 0
	mov	AX,[RL]
	mov	[RN],AX

; LOC 18
L18:
; PTR Y = N / 5
	mov	AX,[RN]
	cwd
	idiv	word [R5]
	mov	[RY],AX
; PTR Z = Y * 5
	imul	word [R5]
	mov	[RZ],AX
; PTR X = N - Z
	mov	AX,[RN]
	sub	AX,[RZ]
	mov	[RX],AX
; FLG X = 0
	xor	AX,AX
	mov	[RX+4],AX
; VAL X = PTR X
	mov	AX,[RX]
	mov	[RX+2],AX
; PTR N = Y + 0
	mov	AX,[RY]
	mov	[RN],AX
; VAL G = G + 1
	inc	word [RG+2]
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; STO 8 = X
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; TO 18 IF PTR N NE 0
	mov	AX,[RN]
	or	AX,AX
	jnz	L18

; LOC 19
L19:
; GET X = 8
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR 8 = 8 - 7
	mov	AX,[R8]
	sub	AX,4
	mov	[R8],AX
; VAL G = G - 1
	dec	word [RG+2]
; VAL X = X + E
	mov	AX,[RX+2]
	add	AX,[RE+2]
	mov	[RX+2],AX
; PTR X = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RX],AX
; STO 9 = X
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR 9 = X + 0
	mov	AX,[RX]
	mov	[R9],AX
; TO 19 IF VAL G NE 0
	mov	AX,[RG+2]
	or	AX,AX
	jnz	L19
; TO 07
	jmp	L07

; LOC 20
L20:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 20 IF VAL Y NE L
	mov	AX,[RY+2]
	cmp	AX,[RL+2]
	jnz	L20
; TO 07 IF FLG X = 1
	mov	AX,[RX+4]
	cmp	AX,1
	jz	L07
; PTR X = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RX],AX
; TO 97 IF PTR 8 GE X
	mov	AX,[R8]
	cmp	AX,[RX]
	jge	L97
; STO 9 = X
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR 9 = X + 0
	mov	AX,[RX]
	mov	[R9],AX
; TO 07
	jmp	L07

; LOC 21
L21:
; STO 9 = L
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RL+2]
	sal	AX,2
	or	AX,[RL+4]
	sal	EAX,16
	mov	AX,[RL]
	mov	[EBX],EAX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; PTR Y = C - 9
	mov	AX,[RC]
	sub	AX,[R9]
	mov	[RY],AX
; PTR Y = Y / 7
	sar	AX,2
	mov	[RY],AX
; FLG Y = 0
	xor	AX,AX
	mov	[RY+4],AX
; VAL Y = PTR Y
	mov	AX,[RY]
	mov	[RY+2],AX
; PTR Y = C + 0
	mov	AX,[RC]
	mov	[RY],AX
; STO V = Y
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR C = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RC],AX
; TO 05
	jmp	L05

; LOC 22
L22:
; PTR V = J + 0
	mov	AX,[RJ]
	mov	[RV],AX
; TO 16 IF PTR I = 0
	mov	AX,[RI]
	or	AX,AX
	jz	L16
; TO 08 IF VAL I = 9
	mov	AX,[RI+2]
	cmp	AX,9
	jz	L08
; PTR V = V + 7
	mov	AX,[RV]
	add	AX,4
	mov	[RV],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; TO 32 IF VAL I = 1
	mov	AX,[RI+2]
	cmp	AX,1
	jz	L32
; TO 32 IF VAL I = 2
	cmp	AX,2
	jz	L32
; TO 33 IF VAL I = 3
	cmp	AX,3
	jz	L33
; TO 42 IF VAL I = 4
	cmp	AX,4
	jz	L42
; TO 36 IF VAL I = 5
	cmp	AX,5
	jz	L36
; TO 39 IF VAL I = 6
	cmp	AX,6
	jz	L39
; TO 43 IF VAL I = 7
	cmp	AX,7
	jz	L43
; TO 47 IF VAL I = 8
	cmp	AX,8
	jz	L47
; TO 23 IF VAL I NE 0
	or	AX,AX
	jnz	L23
; STOP
	xor	EAX,EAX
	mov	[ESP],EAX
	call	exit
	xor	EAX,EAX
;	leave
	ret

; LOC 23
L23:
; MESSAGE CONV TO 4
	mov	EBX,MB
	mov	dword [EBX+10],"CONV"
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iprnt
	mov	[R4+4],AX
; TO 94 BY B
	mov	EAX,G8
	sub	EAX,progr
	mov	[RB],AX
	jmp	L94
G8:
; TO 07
	jmp	L07

; LOC 32
L32:
; GET X = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; VAL W = 3 + 0
	mov	AX,3
	mov	[RW+2],AX
; TO 24 IF FLG X = 1
	mov	AX,[RX+4]
	cmp	AX,1
	jz	L24
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; VAL W = X - E
	mov	AX,[RX+2]
	sub	AX,[RE+2]
	mov	[RW+2],AX
; GET X = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 24 IF FLG X = 1
	mov	AX,[RX+4]
	cmp	AX,1
	jz	L24
; REWIND W
	mov	AX,[RW+2]
	cwde
	mov	[ESP],EAX
	call	icntl
	mov	[RW+4],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX

; LOC 24
L24:
; TO 31 IF VAL I = 2
	mov	AX,[RI+2]
	cmp	AX,2
	jz	L31
; STO 9 = L
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RL+2]
	sal	AX,2
	or	AX,[RL+4]
	sal	EAX,16
	mov	AX,[RL]
	mov	[EBX],EAX
; PTR X = C + 0
	mov	AX,[RC]
	mov	[RX],AX
; TO 57 IF PTR C NE 9
	mov	AX,[RC]
	cmp	AX,[R9]
	jnz	L57
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 25 IF FLG I NE 1
	mov	AX,[RI+4]
	cmp	AX,1
	jnz	L25
; PTR K = K - 7
	mov	AX,[RK]
	sub	AX,4
	mov	[RK],AX
; TO 23
	jmp	L23

; LOC 25
L25:
; PTR Z = VAL I
	mov	AX,[RI+2]
	mov	[RZ],AX
; PTR Z = Z - E
	sub	AX,[RE]
	mov	[RZ],AX
; TO 28 IF PTR Z GE 5
	cmp	AX,10
	jge	L28
; TO 28 IF PTR 0 GE Z
	xor	AX,AX
	cmp	AX,[RZ]
	jge	L28
; VAL X = I + 0
	mov	AX,[RI+2]
	mov	[RX+2],AX
; PTR Z = Z * 7
	mov	AX,[RZ]
	sal	AX,2
	mov	[RZ],AX
; PTR Y = J + Z
	mov	AX,[RJ]
	add	AX,[RZ]
	mov	[RY],AX
; GET Y = Y
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 27 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L27
; GET Z = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX

; LOC 26
L26:
; TO 27 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L27
; CHAR = VAL Z
	mov	AX,[RZ+2]
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RZ+4],AX
; GET Z = Z
	mov	AX,[RZ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; VAL Y = Y - 1
	dec	word [RY+2]
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 26 IF VAL I = X
	cmp	AX,[RX+2]
	jz	L26
; TO 25
	jmp	L25

; LOC 27
L27:
; CHAR = VAL F
	mov	AX,[RF+2]
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RF+4],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 27 IF VAL I = X
	cmp	AX,[RX+2]
	jz	L27
; TO 25
	jmp	L25

; LOC 28
L28:
; TO 57 IF FLG I = 1
	mov	AX,[RI+4]
	cmp	AX,1
	jz	L57
; CHAR = VAL I
	mov	AX,[RI+2]
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RI+4],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 25
	jmp	L25

; LOC 31
L31:
; GET I = A
	mov	AX,[RA]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; TO 29 IF PTR C = 9
	mov	AX,[RC]
	cmp	AX,[R9]
	jz	L29
; GET X = C
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; VAL I = X - E
	sub	AX,[RE+2]
	mov	[RI+2],AX
; STO A = I
	mov	AX,[RA]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 29 IF PTR X = 9
	mov	AX,[RX]
	cmp	AX,[R9]
	jz	L29
; REWIND I
	mov	AX,[RI+2]
	cwde
	mov	[ESP],EAX
	call	icntl
	mov	[RI+4],AX
; TO 98 IF FLG I NE 0
	or	AX,AX
	jnz	L98

; LOC 29
L29:
; GET X = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 05 IF VAL X = 0
	or	AX,AX
	jz	L05
; TO 05 IF FLG X = 3
	mov	AX,[RX+4]
	cmp	AX,3
	jz	L05
; PTR Y = X + 0
	mov	AX,[RX]
	mov	[RY],AX
; READ NEXT I
	mov	AX,[RI+2]
	cwde
	mov	[ESP],EAX
	call	iread
	mov	[RI+4],AX
; TO 98 IF FLG I NE 0
	or	AX,AX
	jnz	L98

; LOC 30
L30:
; TO 05 IF VAL X = 0
	mov	AX,[RX+2]
	or	AX,AX
	jz	L05
; VAL X = X - 1
	dec	word [RX+2]
; GET Y = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; VAL Z = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RZ+2],AX
; TO 30 IF VAL Y = Z
	mov	AX,[RY+2]
	cmp	AX,[RZ+2]
	jz	L30
; WRITE NEXT W
	mov	AX,[RW+2]
	cwde
	mov	[ESP],EAX
	call	iwrite
	mov	[RW+4],AX
; TO 29 IF FLG W = 0
	or	AX,AX
	jz	L29
; STOP
	xor	EAX,EAX
	mov	[ESP],EAX
	call	exit
	xor	EAX,EAX
;	leave
	ret

; LOC 33
L33:
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; TO 05 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L05
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; FLG B = 2
	mov	AX,2
	mov	[RB+4],AX
; GET W = F
	mov	AX,[RF]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; PTR Z = F + 0
	mov	AX,[RF]
	mov	[RZ],AX
; TO 58 BY B
	mov	EAX,G9
	sub	EAX,progr
	mov	[RB],AX
	jmp	L58
G9:
; FLG B = 0
	xor	AX,AX
	mov	[RB+4],AX
; FLG W = Y
	mov	AX,[RY+4]
	mov	[RW+4],AX
; PTR W = U + 0
	mov	AX,[RU]
	mov	[RW],AX
; PTR Z = Y + 0
	mov	AX,[RY]
	mov	[RZ],AX
; PTR V = V + 7
	mov	AX,[RV]
	add	AX,4
	mov	[RV],AX
; GET Y = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; PTR X = Y + 0
	mov	AX,[RY]
	mov	[RX],AX
; FLG Z = 1
	mov	AX,1
	mov	[RZ+4],AX
; VAL Z = Y + 0
	mov	AX,[RY+2]
	mov	[RZ+2],AX
; TO 35 IF FLG W NE 1
	mov	AX,[RW+4]
	cmp	AX,1
	jnz	L35
; STO W = Z
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; TO 05 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L05

; LOC 34
L34:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR W = Z + 0
	mov	AX,[RZ]
	mov	[RW],AX
; GET Z = W
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; VAL Z = X + 0
	mov	AX,[RX+2]
	mov	[RZ+2],AX
; STO W = Z
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 35 IF PTR Z = 0
	mov	AX,[RZ]
	or	AX,AX
	jz	L35
; TO 34 IF VAL Y NE 0
	mov	AX,[RY+2]
	or	AX,AX
	jnz	L34
; TO 05
	jmp	L05

; LOC 35
L35:
; PTR Z = 8 + 0
	mov	AX,[R8]
	mov	[RZ],AX
; STO W = Z
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; PTR W = Z + 0
	mov	AX,[RZ]
	mov	[RW],AX
; GET Z = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; PTR X = Z + 0
	mov	AX,[RZ]
	mov	[RX],AX
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 35 IF VAL Y NE L
	mov	AX,[RY+2]
	cmp	AX,[RL+2]
	jnz	L35
; STO W = 0
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	xor	EAX,EAX
	mov	[EBX],EAX
; TO 05
	jmp	L05

; LOC 36
L36:
; GET I = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; PTR V = V + 7
	mov	AX,[RV]
	add	AX,4
	mov	[RV],AX
; GET Z = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; TO 23 IF FLG Z = 3
	mov	AX,[RZ+4]
	cmp	AX,3
	jz	L23
; PTR V = V + 7
	mov	AX,[RV]
	add	AX,4
	mov	[RV],AX
; TO 41 IF VAL Y NE Z
	mov	AX,[RY+2]
	cmp	AX,[RZ+2]
	jnz	L41
; TO 38 IF VAL Y = 0
	or	AX,AX
	jz	L38
; PTR X = Z + 0
	mov	AX,[RZ]
	mov	[RX],AX

; LOC 37
L37:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; GET Y = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 41 IF VAL X NE Y
	mov	AX,[RX+2]
	cmp	AX,[RY+2]
	jnz	L41
; VAL Z = Z - 1
	dec	word [RZ+2]
; TO 37 IF VAL Z NE 0
	mov	AX,[RZ+2]
	or	AX,AX
	jnz	L37

; LOC 38
L38:
; TO 05 IF VAL I NE E
	mov	AX,[RI+2]
	cmp	AX,[RE+2]
	jnz	L05
; TO 42
	jmp	L42

; LOC 39
L39:
; GET I = K
	mov	AX,[RK]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; TO 74 BY P
	mov	EAX,G10
	sub	EAX,progr
	mov	[RP],AX
	jmp	L74
G10:
; PTR I = N + 0
	mov	AX,[RN]
	mov	[RI],AX
; PTR V = J + 4
	mov	AX,[RJ]
	add	AX,[R4]
	mov	[RV],AX
; GET Y = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; TO 74 BY P
	mov	EAX,G11
	sub	EAX,progr
	mov	[RP],AX
	jmp	L74
G11:
; PTR V = J + 4
	mov	AX,[RJ]
	add	AX,[R4]
	mov	[RV],AX
; PTR V = V + 7
	add	AX,4
	mov	[RV],AX
; PTR N = N - I
	mov	AX,[RN]
	sub	AX,[RI]
	mov	[RN],AX
; TO 38 IF PTR N = 0
	or	AX,AX
	jz	L38
; TO 40 IF PTR N GE 0
	or	AX,AX
	jge	L40
; TO 05 IF VAL I = O
	mov	AX,[RI+2]
	cmp	AX,[RO+2]
	jz	L05
; TO 41
	jmp	L41

; LOC 40
L40:
; TO 05 IF VAL I = N
	mov	AX,[RI+2]
	cmp	AX,[RN+2]
	jz	L05

; LOC 41
L41:
; TO 05 IF VAL I = E
	mov	AX,[RI+2]
	cmp	AX,[RE+2]
	jz	L05

; LOC 42
L42:
; GET Y = V
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 23 IF FLG Y = 3
	mov	AX,[RY+4]
	cmp	AX,3
	jz	L23
; TO 05 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L05
; TO 74 BY P
	mov	EAX,G12
	sub	EAX,progr
	mov	[RP],AX
	jmp	L74
G12:
; PTR M = N + 0
	mov	AX,[RN]
	mov	[RM],AX
; TO 05
	jmp	L05

; LOC 43
L43:
; PTR Y = C - 9
	mov	AX,[RC]
	sub	AX,[R9]
	mov	[RY],AX
; PTR Y = Y / 7
	sar	AX,2
	mov	[RY],AX
; VAL Y = PTR Y
	mov	[RY+2],AX
; TO 07 IF VAL Y = 0
	or	AX,AX
	jz	L07
; PTR Y = C + 0
	mov	AX,[RC]
	mov	[RY],AX
; TO 74 BY P
	mov	EAX,G13
	sub	EAX,progr
	mov	[RP],AX
	jmp	L74
G13:
; FLG Y = 1
	mov	AX,1
	mov	[RY+4],AX
; VAL Y = 0 + 0
	xor	AX,AX
	mov	[RY+2],AX
; PTR Y = N + 1
	mov	AX,[RN]
	inc	AX
	mov	[RY],AX
; STO C = R
	mov	AX,[RC]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RR+2]
	sal	AX,2
	or	AX,[RR+4]
	sal	EAX,16
	mov	AX,[RR]
	mov	[EBX],EAX
; PTR Z = R + 0
	mov	AX,[RR]
	mov	[RZ],AX
; PTR R = C + 0
	mov	AX,[RC]
	mov	[RR],AX
; PTR C = C - 4
	mov	AX,[RC]
	sub	AX,[R4]
	mov	[RC],AX
; STO C = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RK+2]
	sal	AX,2
	or	AX,[RK+4]
	sal	EAX,16
	mov	AX,[RK]
	mov	[EBX],EAX

; LOC 44
L44:
; PTR C = R + 0
	mov	AX,[RR]
	mov	[RC],AX
; PTR R = Z + 0
	mov	AX,[RZ]
	mov	[RR],AX
; PTR Y = Y - 1
	dec	word [RY]
; TO 05 IF PTR 0 GE Y
	xor	AX,AX
	cmp	AX,[RY]
	jge	L05
; PTR R = C + 0
	mov	AX,[RC]
	mov	[RR],AX
; PTR C = C - 7
	mov	AX,[RC]
	sub	AX,4
	mov	[RC],AX
; STO C = Y
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR C = C - 7
	mov	AX,[RC]
	sub	AX,4
	mov	[RC],AX
; GET K = C
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RK],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RK+4],DX
	sar	AX,2
	mov	[RK+2],AX
; PTR C = C - 7
	mov	AX,[RC]
	sub	AX,4
	mov	[RC],AX
; TO 05
	jmp	L05

; LOC 45
L45:
; STO 9 = L
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RL+2]
	sal	AX,2
	or	AX,[RL+4]
	sal	EAX,16
	mov	AX,[RL]
	mov	[EBX],EAX
; PTR W = C - 9
	mov	AX,[RC]
	sub	AX,[R9]
	mov	[RW],AX
; PTR W = W / 7
	sar	AX,2
	mov	[RW],AX
; FLG W = 0
	xor	AX,AX
	mov	[RW+4],AX
; VAL W = PTR W
	mov	AX,[RW]
	mov	[RW+2],AX
; PTR W = C + 0
	mov	AX,[RC]
	mov	[RW],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; FLG B = 2
	mov	AX,2
	mov	[RB+4],AX
; PTR B = 0 + 0
	xor	AX,AX
	mov	[RB],AX
; FLG U = 0
	xor	AX,AX
	mov	[RU+4],AX
; VAL U = R + 0
	mov	AX,[RR+2]
	mov	[RU+2],AX
; PTR U = 7 + 0
	mov	AX,4
	mov	[RU],AX
; FLG Z = 1
	mov	AX,1
	mov	[RZ+4],AX
; VAL Z = 0 + 0
	xor	AX,AX
	mov	[RZ+2],AX
; PTR Z = 0 + 0
	xor	AX,AX
	mov	[RZ],AX
; PTR X = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RX],AX

; LOC 46
L46:
; VAL Z = Z + 1
	inc	word [RZ+2]
; STO 9 = Z
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = U
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RU+2]
	sal	AX,2
	or	AX,[RU+4]
	sal	EAX,16
	mov	AX,[RU]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = B
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RB+2]
	sal	AX,2
	or	AX,[RB+4]
	sal	EAX,16
	mov	AX,[RB]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; PTR K = K + 7
	mov	AX,[RK]
	add	AX,4
	mov	[RK],AX
; GET I = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; PTR I = X - 9
	mov	AX,[RX]
	sub	AX,[R9]
	mov	[RI],AX
; STO 9 = I
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; PTR X = 9 + 0
	mov	AX,[R9]
	mov	[RX],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; TO 46 IF FLG I NE 1
	mov	AX,[RI+4]
	cmp	AX,1
	jnz	L46
; STO 9 = B
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RB+2]
	sal	AX,2
	or	AX,[RB+4]
	sal	EAX,16
	mov	AX,[RB]
	mov	[EBX],EAX
; FLG B = 0
	xor	AX,AX
	mov	[RB+4],AX
; PTR Z = 9 + 0
	mov	AX,[R9]
	mov	[RZ],AX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; VAL U = M + 0
	mov	AX,[RM+2]
	mov	[RU+2],AX
; STO 9 = U
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RU+2]
	sal	AX,2
	or	AX,[RU+4]
	sal	EAX,16
	mov	AX,[RU]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RR+2]
	sal	AX,2
	or	AX,[RR+4]
	sal	EAX,16
	mov	AX,[RR]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = C
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RC+2]
	sal	AX,2
	or	AX,[RC+4]
	sal	EAX,16
	mov	AX,[RC]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RV+2]
	sal	AX,2
	or	AX,[RV+4]
	sal	EAX,16
	mov	AX,[RV]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; STO 9 = Y
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR R = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[RR],AX
; STO R = Z
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; PTR 9 = R - 7
	mov	AX,[RR]
	sub	AX,4
	mov	[R9],AX
; STO 9 = W
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RW+2]
	sal	AX,2
	or	AX,[RW+4]
	sal	EAX,16
	mov	AX,[RW]
	mov	[EBX],EAX
; PTR 9 = 9 - 4
	mov	AX,[R9]
	sub	AX,[R4]
	mov	[R9],AX
; STO 9 = K
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RK+2]
	sal	AX,2
	or	AX,[RK+4]
	sal	EAX,16
	mov	AX,[RK]
	mov	[EBX],EAX
; PTR Z = Z - 7
	mov	AX,[RZ]
	sub	AX,4
	mov	[RZ],AX
; TO 48
	jmp	L48

; LOC 47
L47:
; TO 05 IF PTR R = 0
	mov	AX,[RR]
	or	AX,AX
	jz	L05
; GET Z = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX

; LOC 48
L48:
; PTR U = R - 7
	mov	AX,[RR]
	sub	AX,4
	mov	[RU],AX
; GET Y = U
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; TO 44 IF FLG Y = 1
	mov	AX,[RY+4]
	cmp	AX,1
	jz	L44
; TO 49 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L49
; STO U = 0
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	xor	EAX,EAX
	mov	[EBX],EAX
; PTR U = U - 4
	mov	AX,[RU]
	sub	AX,[R4]
	mov	[RU],AX
; GET K = U
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RK],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RK+4],DX
	sar	AX,2
	mov	[RK+2],AX
; PTR V = U + 0
	mov	AX,[RU]
	mov	[RV],AX
; PTR 9 = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[R9],AX
; PTR C = 9 + 0
	mov	[RC],AX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 99 BY B
	mov	EAX,G14
	sub	EAX,progr
	mov	[RB],AX
	jmp	L99
G14:
; PTR Y = R + 4
	mov	AX,[RR]
	add	AX,[R4]
	mov	[RY],AX
; GET W = Y
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; PTR Y = R - 4
	mov	AX,[RR]
	sub	AX,[R4]
	mov	[RY],AX
; TO 97 IF PTR 8 GE Y
	mov	AX,[R8]
	cmp	AX,[RY]
	jge	L97
; GET Y = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; STO W = Y
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; TO 05
	jmp	L05

; LOC 99
L99:
; TO 60 IF VAL Z NE 1
	mov	AX,[RZ+2]
	cmp	AX,1
	jnz	L60
; FLG X = 0
	xor	AX,AX
	mov	[RX+4],AX
; VAL X = Y - 1
	mov	AX,[RY+2]
	dec	AX
	mov	[RX+2],AX
; VAL Y = 1 + 0
	mov	AX,1
	mov	[RY+2],AX
; PTR U = U + 7
	mov	AX,[RU]
	add	AX,4
	mov	[RU],AX
; STO U = Y
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR U = U + 7
	mov	AX,[RU]
	add	AX,4
	mov	[RU],AX
; STO U = X
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; RETURN BY B
	mov	AX,[RB]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 49
L49:
; TO 44 IF FLG Y = 1
	mov	AX,[RY+4]
	cmp	AX,1
	jz	L44
; PTR R = R + 7
	mov	AX,[RR]
	add	AX,4
	mov	[RR],AX
; GET Y = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; PTR R = R + 7
	mov	AX,[RR]
	add	AX,4
	mov	[RR],AX
; GET W = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; STO W = Y
	mov	AX,[RW]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR R = R + 7
	mov	AX,[RR]
	add	AX,4
	mov	[RR],AX
; GET C = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RC],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RC+4],DX
	sar	AX,2
	mov	[RC+2],AX
; PTR R = R + 7
	mov	AX,[RR]
	add	AX,4
	mov	[RR],AX
; GET R = R
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RR],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RR+4],DX
	sar	AX,2
	mov	[RR+2],AX
; TO 05
	jmp	L05

; LOC 50
L50:
; FLG Y = 1
	mov	AX,1
	mov	[RY+4],AX
; VAL Y = L + 0
	mov	AX,[RL+2]
	mov	[RY+2],AX
; PTR 8 = 8 - 7
	mov	AX,[R8]
	sub	AX,4
	mov	[R8],AX
; TO 54
	jmp	L54

; LOC 51
L51:
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; STO 8 = I
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 52 IF VAL I = C
	mov	AX,[RI+2]
	cmp	AX,[RC+2]
	jz	L52
; TO 52 IF VAL I = D
	cmp	AX,[RD+2]
	jz	L52
; VAL I = I - E
	sub	AX,[RE+2]
	mov	[RI+2],AX
; FLG Z = 3
	mov	AX,3
	mov	[RZ+4],AX
; VAL Z = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RZ+2],AX
; VAL Z = Z - E
	sub	AX,[RE+2]
	mov	[RZ+2],AX
; PTR Z = VAL I
	mov	AX,[RI+2]
	mov	[RZ],AX
; STO 8 = Z
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; TO 52 IF PTR 0 GE Z
	xor	AX,AX
	cmp	AX,[RZ]
	jge	L52
; TO 52 IF PTR Z GE 5
	mov	AX,[RZ]
	cmp	AX,10
	jge	L52
; FLG Z = 2
	mov	AX,2
	mov	[RZ+4],AX
; PTR Z = Z * 7
	mov	AX,[RZ]
	sal	AX,2
	mov	[RZ],AX
; STO 8 = Z
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX

; LOC 52
L52:
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; STO 8 = I
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 51 IF VAL I = D
	mov	AX,[RI+2]
	cmp	AX,[RD+2]
	jz	L51
; TO 53 IF VAL I = L
	cmp	AX,[RL+2]
	jz	L53
; TO 52 IF VAL I NE C
	cmp	AX,[RC+2]
	jnz	L52

; LOC 53
L53:
; PTR Y = 8 + 0
	mov	AX,[R8]
	mov	[RY],AX
; STO U = Y
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR U = 8 + 0
	mov	AX,[R8]
	mov	[RU],AX

; LOC 54
L54:
; GET I = A
	mov	AX,[RA]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RI],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RI+4],DX
	sar	AX,2
	mov	[RI+2],AX
; READ NEXT I
	cwde
	mov	[ESP],EAX
	call	iread
	mov	[RI+4],AX
; TO 98 IF FLG I NE 0
	or	AX,AX
	jnz	L98
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; PTR I = 0 + 0
	xor	AX,AX
	mov	[RI],AX
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; STO 8 = I
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RI+2]
	sal	AX,2
	or	AX,[RI+4]
	sal	EAX,16
	mov	AX,[RI]
	mov	[EBX],EAX
; TO 51 IF VAL I = D
	mov	AX,[RI+2]
	cmp	AX,[RD+2]
	jz	L51
; TO 52 IF VAL I NE C
	cmp	AX,[RC+2]
	jnz	L52
; PTR Y = 8 + 0
	mov	AX,[R8]
	mov	[RY],AX
; STO U = Y
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; STO 8 = 1
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0x50001
	mov	[EBX],EAX
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; VAL I = CHAR
	mov	EBX,[LBR]
	mov	AL,[LINE+EBX]
	cbw
	inc	EBX
	mov	[LBR],EBX
	mov	[RI+2],AX
; TO 55 IF VAL I NE C
	cmp	AX,[RC+2]
	jnz	L55
; FLG B = 0
	xor	AX,AX
	mov	[RB+4],AX

; LOC 55
L55:
; RETURN BY D
	mov	AX,[RD]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 56
L56:
; VAL W = 3 + 0
	mov	AX,3
	mov	[RW+2],AX
; PTR X = C + 0
	mov	AX,[RC]
	mov	[RX],AX

; LOC 57
L57:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; CHAR = VAL X
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RX+4],AX
; TO 57 IF FLG X NE 1
	cmp	AX,1
	jnz	L57
; WRITE NEXT W
	mov	AX,[RW+2]
	cwde
	mov	[ESP],EAX
	call	iwrite
	mov	[RW+4],AX
; TO 98 IF FLG W NE 0
	or	AX,AX
	jnz	L98
; TO 55 IF VAL X = L
	mov	AX,[RX+2]
	cmp	AX,[RL+2]
	jz	L55
; CHAR = VAL X
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RX+4],AX
; TO 57
	jmp	L57

; LOC 58
L58:
; PTR Z = W + Z
	mov	AX,[RW]
	add	AX,[RZ]
	mov	[RZ],AX
; TO 60 IF PTR W NE 0
	mov	AX,[RW]
	or	AX,AX
	jnz	L60
; TO 71 IF FLG B = 2
	mov	AX,[RB+4]
	cmp	AX,2
	jz	L71

; LOC 59
L59:
; TO 70 IF PTR V GE 9
	mov	AX,[RV]
	cmp	AX,[R9]
	jge	L70
; GET Z = V
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RZ],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RZ+4],DX
	sar	AX,2
	mov	[RZ+2],AX
; GET Y = Q
	mov	AX,[RQ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 63 IF FLG Z = 2
	mov	AX,[RZ+4]
	cmp	AX,2
	jz	L63
; TO 64 IF FLG Z = 3
	cmp	AX,3
	jz	L64
; PTR V = Q + 7
	mov	AX,[RQ]
	add	AX,4
	mov	[RV],AX
; PTR Q = V + 7
	add	AX,4
	mov	[RQ],AX

; LOC 60
L60:
; GET W = Z
	mov	AX,[RZ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; TO 69 IF FLG W = 1
	mov	AX,[RW+4]
	cmp	AX,1
	jz	L69
; TO 62 IF FLG W = 2
	cmp	AX,2
	jz	L62
; TO 58 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L58
; TO 58 IF VAL X NE W
	mov	AX,[RX+2]
	cmp	AX,[RW+2]
	jnz	L58
; TO 61 IF PTR W = 0
	mov	AX,[RW]
	or	AX,AX
	jz	L61
; TO 61 IF FLG X = 3
	mov	AX,[RX+4]
	cmp	AX,3
	jz	L61
; TO 61 IF FLG B = 2
	mov	AX,[RB+4]
	cmp	AX,2
	jz	L61
; PTR Q = V - 7
	mov	AX,[RV]
	sub	AX,4
	mov	[RQ],AX
; PTR V = Q - 7
	sub	AX,4
	mov	[RV],AX
; TO 97 IF PTR 8 GE V
	mov	AX,[R8]
	cmp	AX,[RV]
	jge	L97
; STO Q = Y
	mov	AX,[RQ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR W = W + Z
	mov	AX,[RW]
	add	AX,[RZ]
	mov	[RW],AX
; STO V = W
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RW+2]
	sal	AX,2
	or	AX,[RW+4]
	sal	EAX,16
	mov	AX,[RW]
	mov	[EBX],EAX

; LOC 61
L61:
; VAL Y = Y - 1
	dec	word [RY+2]
; PTR Y = X + 0
	mov	AX,[RX]
	mov	[RY],AX
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR Z = Z + 7
	mov	AX,[RZ]
	add	AX,4
	mov	[RZ],AX
; TO 60
	jmp	L60

; LOC 62
L62:
; TO 61 IF FLG X = 2
	mov	AX,[RX+4]
	cmp	AX,2
	jz	L61
; TO 58 IF FLG B = 2
	mov	AX,[RB+4]
	cmp	AX,2
	jz	L58
; PTR Q = V - 7
	mov	AX,[RV]
	sub	AX,4
	mov	[RQ],AX
; PTR V = Q - 7
	sub	AX,4
	mov	[RV],AX
; TO 97 IF PTR 8 GE V
	mov	AX,[R8]
	cmp	AX,[RV]
	jge	L97
; STO Q = Y
	mov	AX,[RQ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; FLG Z = 2
	mov	AX,2
	mov	[RZ+4],AX
; STO V = Z
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; FLG Z = 3
	mov	AX,3
	mov	[RZ+4],AX
; TO 58
	jmp	L58

; LOC 63
L63:
; FLG Z = 3
	mov	AX,3
	mov	[RZ+4],AX
; PTR Z = Z + 7
	mov	AX,[RZ]
	add	AX,4
	mov	[RZ],AX
; STO V = Z
	mov	AX,[RV]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RZ+2]
	sal	AX,2
	or	AX,[RZ+4]
	sal	EAX,16
	mov	AX,[RZ]
	mov	[EBX],EAX
; PTR U = U + 7
	mov	AX,[RU]
	add	AX,4
	mov	[RU],AX
; FLG W = 0
	xor	AX,AX
	mov	[RW+4],AX
; VAL W = 0 + 0
	xor	AX,AX
	mov	[RW+2],AX
; PTR W = Y + 0
	mov	AX,[RY]
	mov	[RW],AX
; STO U = W
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RW+2]
	sal	AX,2
	or	AX,[RW+4]
	sal	EAX,16
	mov	AX,[RW]
	mov	[EBX],EAX
; TO 60
	jmp	L60

; LOC 64
L64:
; TO 68 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L68
; TO 68 IF VAL X = R
	mov	AX,[RX+2]
	cmp	AX,[RR+2]
	jz	L68
; GET W = U
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; VAL W = W + 1
	inc	word [RW+2]
; VAL Y = Y - 1
	dec	word [RY+2]
; PTR Y = X + 0
	mov	AX,[RX]
	mov	[RY],AX
; TO 67 IF VAL X NE M
	mov	AX,[RX+2]
	cmp	AX,[RM+2]
	jnz	L67
; VAL Z = 0 + 0
	xor	AX,AX
	mov	[RZ+2],AX

; LOC 65
L65:
; VAL Z = Z + 1
	inc	word [RZ+2]

; LOC 66
L66:
; TO 68 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L68
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; VAL Y = Y - 1
	dec	word [RY+2]
; PTR Y = X + 0
	mov	AX,[RX]
	mov	[RY],AX
; VAL W = W + 1
	inc	word [RW+2]
; TO 65 IF VAL X = M
	mov	AX,[RX+2]
	cmp	AX,[RM+2]
	jz	L65
; TO 66 IF VAL X NE R
	cmp	AX,[RR+2]
	jnz	L66
; VAL Z = Z - 1
	dec	word [RZ+2]
; TO 66 IF VAL Z NE 0
	mov	AX,[RZ+2]
	or	AX,AX
	jnz	L66

; LOC 67
L67:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; STO Q = Y
	mov	AX,[RQ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; STO U = W
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RW+2]
	sal	AX,2
	or	AX,[RW+4]
	sal	EAX,16
	mov	AX,[RW]
	mov	[EBX],EAX
; TO 60
	jmp	L60

; LOC 68
L68:
; STO U = 3
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	EAX,0xF0003
	mov	[EBX],EAX
; PTR U = U - 7
	mov	AX,[RU]
	sub	AX,4
	mov	[RU],AX
; PTR V = Q + 7
	mov	AX,[RQ]
	add	AX,4
	mov	[RV],AX
; PTR Q = V + 7
	add	AX,4
	mov	[RQ],AX
; TO 59
	jmp	L59

; LOC 69
L69:
; TO 58 IF VAL Y NE 0
	mov	AX,[RY+2]
	or	AX,AX
	jnz	L58
; PTR U = Z + 7
	mov	AX,[RZ]
	add	AX,4
	mov	[RU],AX
; GET Y = U
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX

; LOC 70
L70:
; RETURN BY B
	mov	AX,[RB]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 71
L71:
; PTR W = 8 - Z
	mov	AX,[R8]
	sub	AX,[RZ]
	mov	[RW],AX
; STO Z = W
	mov	AX,[RZ]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RW+2]
	sal	AX,2
	or	AX,[RW+4]
	sal	EAX,16
	mov	AX,[RW]
	mov	[EBX],EAX
; TO 73 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L73

; LOC 72
L72:
; VAL Y = Y - 1
	dec	word [RY+2]
; PTR Y = X + 0
	mov	AX,[RX]
	mov	[RY],AX
; PTR X = 0 + 0
	xor	AX,AX
	mov	[RX],AX
; STO 8 = X
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR 8 = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 72 IF VAL Y NE 0
	mov	AX,[RY+2]
	or	AX,AX
	jnz	L72

; LOC 73
L73:
; FLG X = 1
	mov	AX,1
	mov	[RX+4],AX
; PTR X = 0 + 0
	xor	AX,AX
	mov	[RX],AX
; STO 8 = X
	mov	AX,[R8]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RX+2]
	sal	AX,2
	or	AX,[RX+4]
	sal	EAX,16
	mov	AX,[RX]
	mov	[EBX],EAX
; PTR U = 8 + 7
	mov	AX,[R8]
	add	AX,4
	mov	[RU],AX
; FLG Y = 0
	xor	AX,AX
	mov	[RY+4],AX
; PTR Y = U + 0
	mov	AX,[RU]
	mov	[RY],AX
; STO U = Y
	mov	AX,[RU]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RY+2]
	sal	AX,2
	or	AX,[RY+4]
	sal	EAX,16
	mov	AX,[RY]
	mov	[EBX],EAX
; PTR 8 = U + 7
	mov	AX,[RU]
	add	AX,4
	mov	[R8],AX
; TO 97 IF PTR 8 GE 9
	cmp	AX,[R9]
	jge	L97
; RETURN BY B
	mov	AX,[RB]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 74
L74:
; PTR O = 9 + 0
	mov	AX,[R9]
	mov	[RO],AX
; VAL S = Y + 0
	mov	AX,[RY+2]
	mov	[RS+2],AX
; PTR S = Y + 0
	mov	AX,[RY]
	mov	[RS],AX
; PTR T = 0 + 0
	xor	AX,AX
	mov	[RT],AX
; TO 75 IF VAL Y NE 0
	mov	AX,[RY+2]
	or	AX,AX
	jnz	L75
; PTR N = 0 + 0
	xor	AX,AX
	mov	[RN],AX
; RETURN BY P
	mov	AX,[RP]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 75
L75:
; VAL T = M + 0
	mov	AX,[RM+2]
	mov	[RT+2],AX

; LOC 76
L76:
; TO 93 IF VAL S = 0
	mov	AX,[RS+2]
	or	AX,AX
	jz	L93
; GET X = S
	mov	AX,[RS]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR Y = S + 0
	mov	AX,[RS]
	mov	[RY],AX
; VAL Y = 0 + 0
	xor	AX,AX
	mov	[RY+2],AX
; TO 77 IF VAL X NE M
	mov	AX,[RX+2]
	cmp	AX,[RM+2]
	jnz	L77
; STO 9 = T
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RT+2]
	sal	AX,2
	or	AX,[RT+4]
	sal	EAX,16
	mov	AX,[RT]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; VAL S = S - 1
	dec	word [RS+2]
; PTR S = X + 0
	mov	AX,[RX]
	mov	[RS],AX
; TO 75
	jmp	L75

; LOC 77
L77:
; TO 78 IF VAL X = N
	mov	AX,[RX+2]
	cmp	AX,[RN+2]
	jz	L78
; TO 78 IF VAL X = O
	cmp	AX,[RO+2]
	jz	L78
; TO 78 IF VAL X = P
	cmp	AX,[RP+2]
	jz	L78
; TO 78 IF VAL X = Q
	cmp	AX,[RQ+2]
	jz	L78
; TO 78 IF VAL X = R
	cmp	AX,[RR+2]
	jz	L78
; VAL Y = Y + 1
	inc	word [RY+2]
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 77 IF VAL S NE Y
	mov	AX,[RS+2]
	cmp	AX,[RY+2]
	jnz	L77
; VAL X = R + 0
	mov	AX,[RR+2]
	mov	[RX+2],AX
; VAL S = S + 1
	inc	word [RS+2]

; LOC 78
L78:
; VAL J = X + 0
	mov	AX,[RX+2]
	mov	[RJ+2],AX
; PTR N = 0 + 0
	xor	AX,AX
	mov	[RN],AX
; VAL S = S - Y
	mov	AX,[RS+2]
	sub	AX,[RY+2]
	mov	[RS+2],AX
; VAL S = S - 1
	dec	word [RS+2]
; PTR S = X + 0
	mov	AX,[RX]
	mov	[RS],AX
; TO 83 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L83
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR U = VAL X
	mov	[RU],AX
; PTR U = U - E
	sub	AX,[RE]
	mov	[RU],AX
; TO 79 IF PTR U GE 5
	cmp	AX,10
	jge	L79
; TO 81 IF PTR U GE 0
	or	AX,AX
	jge	L81

; LOC 79
L79:
; PTR V = 9 + 7
	mov	AX,[R9]
	add	AX,4
	mov	[RV],AX
; GET W = F
	mov	AX,[RF]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RW],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RW+4],DX
	sar	AX,2
	mov	[RW+2],AX
; FLG Y = 0
	xor	AX,AX
	mov	[RY+4],AX
; PTR Z = F + 0
	mov	AX,[RF]
	mov	[RZ],AX
; TO 58 BY B
	mov	EAX,G15
	sub	EAX,progr
	mov	[RB],AX
	jmp	L58
G15:
; TO 83 IF FLG Y NE 1
	mov	AX,[RY+4]
	cmp	AX,1
	jnz	L83
; TO 83 IF VAL Y = 0
	mov	AX,[RY+2]
	or	AX,AX
	jz	L83
; GET X = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; FLG N = 1
	mov	AX,1
	mov	[RN+4],AX
; TO 82 IF VAL X = O
	mov	AX,[RX+2]
	cmp	AX,[RO+2]
	jz	L82
; FLG N = 0
	xor	AX,AX
	mov	[RN+4],AX
; PTR X = Y + 0
	mov	AX,[RY]
	mov	[RX],AX

; LOC 80
L80:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; PTR U = VAL X
	mov	[RU],AX
; PTR U = U - E
	sub	AX,[RE]
	mov	[RU],AX
; TO 81 IF PTR U = 0
	or	AX,AX
	jz	L81
; TO 93 IF PTR U GE 5
	cmp	AX,10
	jge	L93
; TO 93 IF PTR 0 GE U
	xor	AX,AX
	cmp	AX,[RU]
	jge	L93

; LOC 81
L81:
; PTR N = N * 5
	mov	AX,[RN]
	imul	word [R5]
	mov	[RN],AX
; PTR N = N + U
	add	AX,[RU]
	mov	[RN],AX

; LOC 82
L82:
; VAL Y = Y - 1
	dec	word [RY+2]
; TO 80 IF VAL Y NE 0
	mov	AX,[RY+2]
	or	AX,AX
	jnz	L80
; TO 83 IF FLG N = 0
	mov	AX,[RN+4]
	or	AX,AX
	jz	L83
; FLG N = 0
	xor	AX,AX
	mov	[RN+4],AX
; PTR N = 0 - N
	xor	AX,AX
	sub	AX,[RN]
	mov	[RN],AX

; LOC 83
L83:
; TO 92 IF VAL J = R
	mov	AX,[RJ+2]
	cmp	AX,[RR+2]
	jz	L92
; TO 90 IF VAL T = M
	mov	AX,[RT+2]
	cmp	AX,[RM+2]
	jz	L90
; TO 89 IF VAL J = P
	mov	AX,[RJ+2]
	cmp	AX,[RP+2]
	jz	L89
; TO 89 IF VAL J = Q
	cmp	AX,[RQ+2]
	jz	L89

; LOC 84
L84:
; TO 87 IF VAL T = Q
	mov	AX,[RT+2]
	cmp	AX,[RQ+2]
	jz	L87
; TO 86 IF VAL T = P
	cmp	AX,[RP+2]
	jz	L86
; TO 85 IF VAL T = O
	cmp	AX,[RO+2]
	jz	L85
; PTR T = T + N
	mov	AX,[RT]
	add	AX,[RN]
	mov	[RT],AX
; TO 88
	jmp	L88

; LOC 85
L85:
; PTR T = T - N
	mov	AX,[RT]
	sub	AX,[RN]
	mov	[RT],AX
; TO 88
	jmp	L88

; LOC 86
L86:
; PTR T = T * N
	mov	AX,[RT]
	imul	word [RN]
	mov	[RT],AX
; TO 88
	jmp	L88

; LOC 87
L87:
; PTR T = T / N
	mov	AX,[RT]
	cwd
	idiv	word [RN]
	mov	[RT],AX

; LOC 88
L88:
; VAL T = J + 0
	mov	AX,[RJ+2]
	mov	[RT+2],AX
; TO 76 IF VAL J NE R
	mov	AX,[RJ+2]
	cmp	AX,[RR+2]
	jnz	L76
; PTR N = T + 0
	mov	AX,[RT]
	mov	[RN],AX
; PTR 9 = 9 + 7
	mov	AX,[R9]
	add	AX,4
	mov	[R9],AX
; GET T = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RT],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RT+4],DX
	sar	AX,2
	mov	[RT+2],AX
; TO 92
	jmp	L92

; LOC 89
L89:
; TO 86 IF VAL T = P
	mov	AX,[RT+2]
	cmp	AX,[RP+2]
	jz	L86
; TO 87 IF VAL T = Q
	cmp	AX,[RQ+2]
	jz	L87

; LOC 90
L90:
; STO 9 = T
	mov	AX,[R9]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RT+2]
	sal	AX,2
	or	AX,[RT+4]
	sal	EAX,16
	mov	AX,[RT]
	mov	[EBX],EAX
; PTR 9 = 9 - 7
	mov	AX,[R9]
	sub	AX,4
	mov	[R9],AX
; TO 97 IF PTR 8 GE 9
	mov	AX,[R8]
	cmp	AX,[R9]
	jge	L97
; VAL T = J + 0
	mov	AX,[RJ+2]
	mov	[RT+2],AX
; PTR T = N + 0
	mov	AX,[RN]
	mov	[RT],AX
; TO 76
	jmp	L76

; LOC 91
L91:
; TO 93 IF VAL S NE 0
	mov	AX,[RS+2]
	or	AX,AX
	jnz	L93
; RETURN BY P
	mov	AX,[RP]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 92
L92:
; TO 84 IF VAL T NE M
	mov	AX,[RT+2]
	cmp	AX,[RM+2]
	jnz	L84
; TO 91 IF PTR 9 = O
	mov	AX,[R9]
	cmp	AX,[RO]
	jz	L91
; PTR 9 = 9 + 7
	add	AX,4
	mov	[R9],AX
; GET T = 9
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RT],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RT+4],DX
	sar	AX,2
	mov	[RT+2],AX
; TO 92 IF VAL S = 0
	mov	AX,[RS+2]
	or	AX,AX
	jz	L92
; GET X = S
	mov	AX,[RS]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; VAL S = S - 1
	dec	word [RS+2]
; PTR S = X + 0
	mov	AX,[RX]
	mov	[RS],AX
; VAL J = X + 0
	mov	AX,[RX+2]
	mov	[RJ+2],AX
; TO 92 IF VAL J = R
	cmp	AX,[RR+2]
	jz	L92
; TO 83 IF VAL J = N
	cmp	AX,[RN+2]
	jz	L83
; TO 83 IF VAL J = O
	cmp	AX,[RO+2]
	jz	L83
; TO 83 IF VAL J = P
	cmp	AX,[RP+2]
	jz	L83
; TO 83 IF VAL J = Q
	cmp	AX,[RQ+2]
	jz	L83

; LOC 93
L93:
; MESSAGE EXPR TO 4
	mov	EBX,MB
	mov	dword [EBX+10],"EXPR"
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iprnt
	mov	[R4+4],AX
; PTR N = 0 + 0
	xor	AX,AX
	mov	[RN],AX
; PTR 9 = O + 0
	mov	AX,[RO]
	mov	[R9],AX
; TO 94 BY B
	mov	EAX,G16
	sub	EAX,progr
	mov	[RB],AX
	jmp	L94
G16:
; RETURN BY P
	mov	AX,[RP]
	cwde
	add	EAX,progr
	jmp	EAX

; LOC 94
L94:
; PTR X = C + 0
	mov	AX,[RC]
	mov	[RX],AX
; PTR Y = J + 0
	mov	AX,[RJ]
	mov	[RY],AX
; TO 96 IF PTR 9 GE C
	mov	AX,[R9]
	cmp	AX,[RC]
	jge	L96
; STO 9 = L
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[RL+2]
	sal	AX,2
	or	AX,[RL+4]
	sal	EAX,16
	mov	AX,[RL]
	mov	[EBX],EAX

; LOC 95
L95:
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; CHAR = VAL X
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RX+4],AX
; TO 95 IF FLG X = 0
	or	AX,AX
	jz	L95
; WRITE NEXT 4
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iwrite
	mov	[R4+4],AX
; TO 98 IF FLG 4 NE 0
	or	AX,AX
	jnz	L98
; TO 96 IF VAL X = L
	mov	AX,[RX+2]
	cmp	AX,[RL+2]
	jz	L96
; CHAR = VAL X
	cwde
	mov	[ESP],EAX
	call	iwrch
	mov	[RX+4],AX
; TO 95
	jmp	L95

; LOC 96
L96:
; TO 70 IF PTR Y = 0
	mov	AX,[RY]
	or	AX,AX
	jz	L70
; PTR Y = Y - H
	sub	AX,[RH]
	mov	[RY],AX
; PTR X = Y - 7
	sub	AX,4
	mov	[RX],AX
; GET Y = Y
	mov	AX,[RY]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RY],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RY+4],DX
	sar	AX,2
	mov	[RY+2],AX
; GET X = X
	mov	AX,[RX]
	cwde
	add	EAX,list
	mov	EBX,EAX
	mov	AX,[EBX]
	mov	[RX],AX
	mov	AX,[EBX+2]
	mov	DX,AX
	and	DX,3
	mov	[RX+4],DX
	sar	AX,2
	mov	[RX+2],AX
; TO 95
	jmp	L95

; LOC 97
L97:
; MESSAGE FULL TO 4
	mov	EBX,MB
	mov	dword [EBX+10],"FULL"
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iprnt
	mov	[R4+4],AX
; TO 94 BY B
	mov	EAX,G17
	sub	EAX,progr
	mov	[RB],AX
	jmp	L94
G17:
; STOP
	xor	EAX,EAX
	mov	[ESP],EAX
	call	exit
	xor	EAX,EAX
;	leave
	ret

; LOC 98
L98:
; MESSAGE IOCH TO 4
	mov	EBX,MB
	mov	dword [EBX+10],"IOCH"
	mov	AX,4
	cwde
	mov	[ESP],EAX
	call	iprnt
	mov	[R4+4],AX
; TO 94 BY B
	mov	EAX,G18
	sub	EAX,progr
	mov	[RB],AX
	jmp	L94
G18:
; STOP
	xor	EAX,EAX
	mov	[ESP],EAX
	call	exit
	xor	EAX,EAX
;	leave
	ret

; END PROGRAM
	end
