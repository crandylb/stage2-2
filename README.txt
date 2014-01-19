README.txt -- stage2-2 contains optimized version via stage2, CRB, Oct 21, 2013
01/19/2014 CRB Add LICENSE

The purpose of this directory is to provide an optimized version of stage2
implemented using the facilities of the first version of stage2 obtained from
the stage2-1 repository. Both versions provide exactly the same features and
capabilities. The difference is that the translated assembly language code is
tighter and faster by eliminating redundant instructions and using immediate
operands in the instruction stream instead of constants stored in memory
locations. As a practical matter the differences in performance are tiny and
hard to measure. So the true purpose of stage2-2 is to illustratate the
capabilities of the stage2 macro processor to implement optimizations. For
practical use the optimized version should be used rather than the stage2-1
version.

Contents 0f this directory:
README.txt --	 this file
makefile --	 used to build files using GNU make
debug -- 	 makefile version to build stage2 for debugging
flb2yasm.s2m --	 macros for stage2 to translate flb to yasm
stg2.asm --  	 stage2 translated to x86 assembly language by stage2
stg2.o --	 assembled object code for stage2 from yasm assembler
stg2.lst --	 yasm listing file for stg2.asm, useful for debugging
stg2 --	 	 optimized stage2 executable linked with grandios via gcc
LICENSE		 GPLv2

README.txt
Describes the contents of this directory and how its contents can be used.

makefile
A default makefile for this directory to illustrate how its components can be
processed and combined to build an optimized version of the Stage 2 macro 
processor using the stage2 executable from stage2-1. To make this version of
stg2 copy grandios.o from the grandios repository.

debug
A makefile to build a version of stage2 with symbolic debugging infomation
included for use by GNU gdb or the graphical interface ddd. To build the debug
version use a commnd line such as:
	make -f debug stg2
To make this version of stg2 copy grandios.dbug.o from the grandios
repository. Note that this will overwrite the provided files stg2.asm, and 
stg2.lst.

flb2yasm.s2m
This file contains the macros for Stage 2 to translate flb to x86 assembly
language for the yasm assembler. It applies optimizations to eliminate
redundant instructions and uses immediate operands rather than constants
preloaded in the flb registers.

stg2.asm
This file is the output of stage 2 when it translates the stage2.flb source 
to x86 assembly language by:
   make stg2.asm
or, as you can see examining makefile, by running stage2 from the command line:
   stage2 flb2yasm.s2m - <stage2.flb stg2.asm

stg2.o
The Stage 2 object file output from the yasm assembler. See stage2.o in the
stage2-1 directory.

stg2.lst
The Stage 2 assembler listing file. See stage2.lst in stage2-1.

stg2
This is the optimized Stage 2 executable. It is slightly smaller and faster
than the unoptimized version produced in the stage2-1 directory. Note the
difference in spelling of the two executable versions: stage2 (unoptimized) is
used to produce stg2, the optimized version. My benchmark testing showed that
the optimized version was only two percent or less faster, and that is likely
becausee stg2 is about ten percent smaller and consequently loads faster. In
any case, the optimized stg2 is the one you would probably want to keep in
your local bin directory for application use.

LICENSE
The GNU general public license applies to all files written by me.

What You Need
The following are not included here but may be obtained as described below:
stage2.flb -- the Stage 2 source code file (see the stage2-1 repo)
stage2 --     the Stage 2 executable implemented in the stage2-1 repo
grandios.o -- compiled object code of the I/O system and wrapper for stage2
or
grandios.dbug.o -- compiled object code with debugging symbols
