CC=gcc
COV_TOOL=cpptestcc -compiler gcc_13-64 -line-coverage -statement-coverage -block-coverage -decision-coverage -simple-condition-coverage -mcdc-coverage -function-coverage -call-coverage -workspace .coverage --
INCLUDE_FLAGS=-I.
LINK_FLAGS=/opt/parasoft/cpptest/ct/2024.1.0/runtime/build/cpptest.o
DEBUG_FLAGS=
CFLAGS=-g

SRCS = clock.c \
       driver.c \
       timer.c \
	   stdinout.c	

OBJ = $(SRCS:.c=.o)

EXEC=timer.exe

.PHONY = clean all

all : $(EXEC)

$(EXEC) : $(OBJ)
	$(CC) $^ $(LINK_FLAGS) -o $@

%.o : %.c
	$(COV_TOOL) $(CC) $(CFLAGS) $(INCLUDE_FLAGS) -o $@ -c $<

clean:
	rm -rf $(OBJ) $(EXEC)
