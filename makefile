# makefile -- for stage2-2 directory, CRB, Oct 19, 2013

grandios.o:
	cp ~/grandios/grandios.o .

stg2.asm:	flb2yasm.s2m stage2.flb
	stage2 flb2yasm.s2m <stage2.flb - stg2.asm

stg2.o:		stg2.asm
	yasm stg2.asm -w -l stg2.lst -f elf32 -o stg2.o

stg2:		grandios.o stg2.o
	gcc -m32 grandios.o stg2.o -o stg2

testst2t:	stg2 st2t.s2
	./stg2 st2t.s2 - st2t.3 st2t.4

examst2t:	st2t.3 st2t.4
	tkxcd {,~/stage2/newstg2/}st2t.3 &
	tkxcd {,~/stage2/newstg2/}st2t.4 &
