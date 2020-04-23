##
# Makefile for Assembly MIPs verification
#
# @author Rafael Lima
##

###############################################################################
# Variables
###############################################################################

# MARS MIPS Options
# ref: https://courses.missouristate.edu/KenVollmar/mars/Help/MarsHelpCommand.html
MARS:= bin/Mars4_5.jar
MARSFLAGS:= a we me

SRC:= $(wildcard src/*.asm)
OBJ:= $(notdir $(basename ${SRC}))

###############################################################################
# Rules
###############################################################################

# Assemble only all codes, do not simulate
.PHONY: verify
verify: ${OBJ}

# Implicity Rule for assembly evaluation
%:src/%.asm
	java -jar ${MARS} ${MARSFLAGS} $<
